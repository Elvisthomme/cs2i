# CS2I Monorepo - Project Overview

This document gives you a high-level map of the existing code-base so you can extend it with confidence.

## 1. Repository Layout

- **`cs2i-api/`** - REST API built with Express + Sequelize (MySQL)  
  All routes are mounted under `ROOT_API` (default `/api/v1`).
- **`cs2i-admin/`** - Admin front-office built with **Next.js 14** (App Router, TypeScript).  
  Talks to the API through `NEXT_PUBLIC_API_URL` and uses **NextAuth.js** for session handling.
- **`cs2i-client/`** - Public client-side app (also Next.js).  
  Shares most of the auth logic with the admin.

---

## 2. Environment Variables

Separate **`.env`** files are expected at the root of each package.  
Here is the full list detected in the source code, with recommended defaults.

### 2.1  API (`cs2i-api/.env`)
```bash
# ── Server ──────────────────────────────────────────────────────────────
PORT=3000                 # Fallback to 3000 when undefined
ROOT_API=/api/v1          # Base prefix for every Express route
NODE_ENV=development

# ── CORS / Socket.IO ───────────────────────────────────────────────────
BASE_URL_CLIENT=http://localhost:3001  # Origin allowed by Socket.IO

# ── Email (Nodemailer) ─────────────────────────────────────────────────
EMAIL_HOST=smtp.example.com
EMAIL_PORT=465                         # 465 ⇒ secure: true, anything else ⇒ false
EMAIL_USERNAME=username@example.com
EMAIL_PASSWORD=********

# Multi-account senders
EMAIL_CONTACT=contact@example.com
EMAIL_NOREPLY=noreply@example.com
EMAIL_NOREPLY_PASSWORD=********
EMAIL_RECRUTEMENT=recrutement@example.com
EMAIL_RECRUTEMENT_PASSWORD=********

# ── Authentication ────────────────────────────────────────────────────
JWT_SECRET=<<random-hex>>   # If omitted, `config/config.json.salt` is used
JWT_REFRESH_SECRET=<<random-hex>>
TOKEN_LIFETIME=2592000      # Seconds (30 days) - overrides `tokenLifetime` in config

# ── Front-end URLs (emails, password reset) ───────────────────────────
CLIENT_URL=http://localhost:3002
```

### 2.2  Admin / Client (`*.env.local`)
```bash
NEXT_PUBLIC_API_URL=http://localhost:3000/api/v1
NEXTAUTH_SECRET=<<random-hex>>
NEXTAUTH_URL=http://localhost:3001   # Required in production for cookies
```

> **Tip** : run `grep -R "process.env" cs2i-*` when adding new features to keep this list up-to-date.

---

## 3. Authentication Workflow

### 3.1  Endpoints (`cs2i-api/routes/auth.route.js`)

| Method | Path | Payload | Notes |
|--------|------|---------|-------|
| POST | `/auth/signup` | `{ firstName,lastName,login,email?,phone?,password,preferredLanguage? }` | Duplicate checks by login/email/phone. Returns basic user info. |
| POST | `/auth/signin` | `{ email | phone | clientNumber | login , password }` | Flexible identifier strategy. |
| POST | `/auth/forgot-password` | `{ email }` | Sends reset e-mail via `EmailService`. |
| PUT  | `/auth/reset-password/:token` | `{ password }` | Token valid 10 min. |

### 3.2  JWT

```text
Authorization: Bearer <accessToken>
```
- Signed with `JWT_SECRET` (fallback `config.salt`).
- Lifetime: `TOKEN_LIFETIME` (default 30 days).

Admin & client apps store the token inside the NextAuth session (`auth.ts`).

---

## 4. Standard API Responses

Helper: `utils/api.response.formatting.js`

### 4.1  Success
```json
{
  "code": 200,
  "data": { /* anything you returned */ }
}
```
The wrapper is optional: many controllers send plain objects via `successResponse`.

### 4.2  Error
```json
{
  "error": "UNAUTHORIZED",
  "code": 401,
  "message": "Identifiants incorrects"
}
```
Error names & messages come from `errors.json`.

---

## 5. Pagination, Sorting & Filtering

Every *collection* route that calls `utils.showAll()` accepts the following query parameters:

- `page` (default **1**)
- `per_page` (default **10**)
- `sort_by=<column>`   - ascending
- `sort_by_desc=<column>` - descending
- Any other field present in the model can be provided to **filter**. For multi-values use a comma-separated list: `status=pending,approved`.

The helper automatically adds `deletedAt = null` so soft-deleted rows are hidden.

---

## 6. Express Middlewares

| File | Purpose |
|------|---------|
| **`middlewares/authJwt.js`** | `verifyToken` (+ attaches `req.user`) & `isAdmin` role guard |
| **`middlewares/verifySignUp.js`** | Pre-signup duplicate checks (login/email/phone) |
| **`middlewares/validate.js`** | `joiValidator(schema)` - request validation |
| **`middlewares/uploadFile.js`** | Multer wrapper for file uploads |

They are re-exported via `middlewares/index.js` and used directly in route definitions.

---

## 7. Adding New Features

1. **Decide the layer**: API vs Admin vs Client.  
2. **Respect the response helpers** so front-ends stay consistent.
3. **Document new env vars** directly in this file.
4. **Write/extend validators** under `validators/` instead of inline JS checks.
5. **Cache wisely**: heavy `showAll()` queries are cached in Redis; remember to invalidate if you mutate the resource.

---

## 8. Roles & Permissions

- **User roles** (`models/user.js`)

  `member`, `counselor`, `admin`, `student`, `instructor`, `manager`, `home`

- **Manager roles (admin-level)**  
  Defined in `User.MANAGER_ROLES`: `admin`, `home`.  
  These are the only values accepted by `authJwt.isAdmin()`.

- **Authorization flow**

  1. `verifyToken()` → decodes JWT, puts full user on `req.user`.
  2. Admin routes add `authJwt.isAdmin()` which runs:
     ```js
     const isValidRole = Object.values(db.User.MANAGER_ROLES).includes(req.user.role);
     ```
  3. Returns **403** if the role is not in the list.

- **Promoting a user to admin**

  ```sql
  UPDATE users SET role = 'admin' WHERE id = <USER_ID>;
  ```
  User must sign in again to get a fresh token reflecting the new role.

- **Frontend helper (NextAuth / React)**

  ```ts
  const { data: session } = useSession();
  const isAdmin = ['admin', 'home'].includes(session?.user?.role ?? '');
  ```

---

## 9. Local Docker tips

- Env files used by `docker-compose.yml` live in each package as `.env.local` (samples committed).  
  Update values, then run `docker compose up --build`.
- Services & ports in development:

  | Service | URL | Container name | Image |
  |---------|-----|----------------|-------|
  | MySQL   | `mysql://root@localhost:3306/cs2i` | `cs2i-db` | mysql:8 |
  | Redis   | `redis://localhost:6379` | `cs2i-redis` | redis:7 |
  | API     | http://localhost:3000 | `cs2i-api` | node:20-alpine build |
  | Admin   | http://localhost:3002 | `cs2i-admin` | node:20-alpine dev |
  | Client  | http://localhost:3001 | `cs2i-client` | node:20-alpine dev |

- Common issues
  - **`ECONNREFUSED 127.0.0.1:3306`** → API started outside Docker but DB is inside → use `DB_HOST=db`.
  - **`env file … not found`** → ensure the `.env.local` files exist per service.

Happy coding ! 🚀

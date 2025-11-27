# CS2I Training Module - Checklist de Suivi

> **Dernière mise à jour**: 2025-11-27
> **Environnement**: Docker Compose (dev)

---

## 🚀 Services

| Service | URL | Port | Status |
|---------|-----|------|--------|
| API (Backend) | http://localhost:3000 | 3000 | ✅ Running |
| Admin (Frontend) | http://localhost:3002 | 3002 | ✅ Running |
| Client (Frontend) | http://localhost:3001 | 3001 | ✅ Running |
| MySQL DB | localhost:3306 | 3306 | ✅ Healthy |
| Redis | localhost:6379 | 6379 | ✅ Running |

---

## 🔐 Comptes de Test

| Email | Mot de passe | Rôle | ClientNumber |
|-------|--------------|------|--------------|
| `admin@cs2i.org` | `password` | Admin | AD1530 |
| `counselor@cs2i.org` | `password` | Counselor | OP4614 |
| `member@cs2i.org` | `password` | Member | CL3778 |

---

## 📊 Données de Test

| Type | Quantité |
|------|----------|
| Utilisateurs | 3 (admin, counselor, member) |
| Trainers | 8 formateurs |
| Lessons | 18 formations |
| Categories | 8 catégories |
| Training Rooms | 5 salles |
| Sessions | 57 (28 présentiel + 29 distanciel) |
| Members | 15 membres |
| Enrollments | 31 inscriptions |
| Certificates | 14 certificats |
| Referrals | 12 parrainages |
| Commissions | 18 commissions |
| Cart Items | 16 articles panier |

---

## 🔴 PRIORITÉ 1: Commerciaux & Codes de Référencement

| # | Tâche | Type | État | Notes |
|---|-------|------|------|-------|
| 1 | Modèle Commercial (Backend) | Backend | ✅ | `salesRep.js`, `referral.js`, `commission.js` |
| 2 | Formulaire inscription commercial | Frontend | ⬜ | Page `/register/sales-rep` à créer |
| 3 | API POST /commerciaux/register | Backend | ⬜ | Endpoint à créer |
| 4 | Dashboard commercial (cs2i-client) | Frontend | 🔄 | Structure existe: `(dashboard)/sales-rep/` |
| 5 | Modèles Cooptation/Commission | Backend | ✅ | Tables existent |
| 6 | Algorithme calcul gains | Backend | ⬜ | À implémenter |
| 7 | API GET /commerciaux/{id}/cooptes | Backend | ⬜ | À créer |
| 8 | Interface visualisation cooptés | Frontend | 🔄 | Composants `sales-rep/referrals/` existent |

---

## 🟠 PRIORITÉ 2: Formateurs & Inscription

| # | Tâche | Type | État | Notes |
|---|-------|------|------|-------|
| 9 | Modèle Formateur | Backend | ✅ | `trainer.js`, `TrainerAvailability.js` |
| 10 | Formulaire inscription formateur | Frontend | ⬜ | Page `/register/trainer` à créer |
| 11 | API POST /formateurs/register | Backend | ⬜ | À créer |
| 12 | Génération code cooptation | Backend | ⬜ | Format TR-XXXXX |
| 13 | API GET /formateurs/{id}/cooptes | Backend | ⬜ | À créer |

---

## 🟡 PRIORITÉ 3: Module Formations

| # | Tâche | Type | État | Notes |
|---|-------|------|------|-------|
| 14 | Modèle Formation | Backend | ✅ | `lesson.js`, `LessonCategory.js` |
| 15 | Formulaire création formation | Frontend | ✅ | `LessonFormModal.tsx` |
| 16 | Système upload fichiers | Backend | ⬜ | À implémenter |
| 17 | API POST /formations | Backend | ✅ | `admin.lessons.route.js` |
| 18 | Relation Formation-Formateur | Backend | ✅ | `LessonAssignment.js` |
| 19 | API GET /formateurs | Backend | 🔄 | Routes trainer existent |
| 20 | Composant sélection formateur | Frontend | ⬜ | À créer |
| 21 | Afficher infos formateur | Frontend | ⬜ | Sur page formation |
| 22 | Composant Menu Formation | Frontend | 🔄 | Navigation catalogue |
| 23 | API GET /formations | Backend | ✅ | Avec filtres |
| 24 | Système filtres | Frontend | 🔄 | Catégorie, type, niveau, prix |

---

## 🟢 PRIORITÉ 4: Gestion & Sessions

| # | Tâche | Type | État | Notes |
|---|-------|------|------|-------|
| 25 | Page gestion formations (admin) | Frontend | ✅ | `AdminLessonsTable.tsx` |
| 26 | API PUT /formations/{id} | Backend | ✅ | Dans `admin.lessons.route.js` |
| 27 | API DELETE /formations/{id} | Backend | ✅ | Soft delete |
| 28 | Modales confirmation | Frontend | 🔄 | Partiellement |
| 29 | Modèle SessionPresentielle | Backend | ✅ | `inPersonSession.js` |
| 30 | Formulaire session présentielle | Frontend | ⬜ | Avec sélection salle |
| 31 | API POST sessions/presentielles | Backend | ⬜ | Vérif disponibilité |
| 32 | Modèle SessionDistancielle | Backend | ✅ | `remoteSession.js` |
| 33 | Formulaire session distancielle | Frontend | ⬜ | Lien visio |
| 34 | API POST sessions/distancielles | Backend | ⬜ | Avec notification |
| 35 | Envoi automatique emails | Backend | ⬜ | Notifications sessions |

---

## 🔵 PRIORITÉ 5: Devis, Inscriptions & Adhésions

| # | Tâche | Type | État | Notes |
|---|-------|------|------|-------|
| 36 | Modèle Devis | Backend | ✅ | `quote.js` |
| 37 | Template PDF devis | Backend | ⬜ | Génération PDF |
| 38 | API POST /devis/generate | Backend | ⬜ | Avec template |
| 39 | Bouton/formulaire devis | Frontend | ⬜ | Modal demande |
| 40 | Modèle Inscription | Backend | ✅ | `enrollment.js` |
| 41 | API POST /formations/{id}/inscrire | Backend | ⬜ | Avec panier |
| 42 | Formulaire inscription | Frontend | ⬜ | Multi-étapes |
| 43 | Page Mes Formations | Frontend | 🔄 | Liste inscriptions membre |
| 44 | API GET /utilisateurs/{id}/formations | Backend | ⬜ | Avec progression |
| 45 | Logique calcul statuts | Backend | ⬜ | En cours, terminé |
| 46 | Modèle Adhésion et règles | Backend | ⬜ | Membership rules |
| 47 | Algorithme éligibilité | Backend | ⬜ | Prix membre/non-membre |
| 48 | Composant badge éligibilité | Frontend | ⬜ | Affichage statut |
| 49 | Intégration prix différencié | Frontend | ⬜ | Sur cartes formations |

---

## 📂 Structure Existante

### cs2i-admin (Pages Admin)
```
✅ /dashboard
✅ /appointments
✅ /rooms
✅ /users
✅ /counselors
✅ /members
✅ /trainers
✅ /lessons (avec formulaire CRUD)
✅ /training-rooms
✅ /commissions
✅ /sales-reps
```

### cs2i-client (Pages Client)
```
✅ /lessons (catalogue)
✅ /cart
✅ /checkout
✅ /certificates
✅ /sessions
✅ /workshops
✅ /activities
✅ /membership
🔄 /sales-rep/* (dashboard, referrals, commissions)
🔄 /trainer/* (dashboard, referrals, payments)
🔄 /member/* (enrollments, quotes, appointments)
⬜ /register/sales-rep
⬜ /register/trainer
```

---

## 🛠️ Commandes Utiles

```bash
# Démarrer l'environnement
docker compose -f docker-compose.dev.yaml up -d

# Arrêter l'environnement
docker compose -f docker-compose.dev.yaml down

# Voir les logs
docker logs cs2i-api -f
docker logs cs2i-admin -f
docker logs cs2i-client -f

# Exécuter les migrations
docker exec cs2i-api npx sequelize-cli db:migrate

# Exécuter les seeds
docker exec cs2i-api npx sequelize-cli db:seed:all

# Reset database
docker exec cs2i-api npx sequelize-cli db:migrate:undo:all
docker exec cs2i-api npx sequelize-cli db:migrate
docker exec cs2i-api npx sequelize-cli db:seed:all
```

---

## 📝 Légende

- ✅ = Terminé
- 🔄 = En cours / Partiel
- ⬜ = À faire
- ⚠️ = Bloqué / Nécessite attention

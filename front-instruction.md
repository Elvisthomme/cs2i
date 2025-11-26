# 📋 FRONTEND IMPLEMENTATION GUIDE - CS2I Training Module

## 🎯 Vue d'ensemble

Ce document présente les étapes détaillées pour implémenter le frontend du module de formation CS2I avec une **approche Mobile-First** et un **design premium, vivant, UX/UI optimisé**.

**PROJETS**:
- **`cs2i-admin`** : Interface d'administration
- **`cs2i-client`** : Interface client (catalogue, inscriptions, espaces membre/formateur/commercial)

**PRIORITÉS**:
1. 🔴 **PRIORITÉ 1**: Module Commerciaux & Codes de Référencement (cooptation)
2. 🟠 **PRIORITÉ 2**: Module Formateurs & Inscription
3. 🟡 **PRIORITÉ 3**: Module Formations (Lessons)
4. 🟢 **PRIORITÉ 4**: Gestion & Sessions
5. 🔵 **PRIORITÉ 5**: Devis, Inscriptions, Adhésions

---

## ✅ CHECKLIST DE SUIVI DU PROJET

> **INSTRUCTIONS**: Au fil de ma progression, je vous indiquerai quelles tâches cocher.
> - ⬜ = À faire
> - 🔄 = En cours
> - ✅ = Terminé
> - ⚠️ = Nécessite modification

---

### 🔴 PRIORITÉ 1: Commerciaux & Codes de Référencement

| # | Tâche | Type | Statut | Notes |
|---|-------|------|--------|-------|
| 1 | Créer modèle données Commercial (Backend) | Backend | ⬜ | Table `sales_reps` avec referral_code |
| 2 | Développer formulaire inscription commercial (Frontend) | Frontend | ⬜ | Page `/register/sales-rep` - Mobile-first |
| 3 | Créer API POST /commerciaux/register (Backend) | Backend | ⬜ | Auto-génération code référencement |
| 4 | Créer page dashboard commercial (Frontend) | Frontend | ⬜ | Stats, cooptés, gains - Design premium |
| 5 | Créer modèles Cooptation et Commission (Backend) | Backend | ⬜ | Tables `referrals`, `commissions` |
| 6 | Développer algorithme calcul gains (Backend) | Backend | ⬜ | % sur membership + formations |
| 7 | Créer API GET /commerciaux/{id}/cooptes (Backend) | Backend | ⬜ | Liste personnes référées |
| 8 | Développer interface visualisation cooptés (Frontend) | Frontend | ⬜ | Liste avec stats et filtres |

---

### 🟠 PRIORITÉ 2: Formateurs & Inscription

| # | Tâche | Type | Statut | Notes |
|---|-------|------|--------|-------|
| 9 | Créer modèle données Formateur (Backend) | Backend | ✅ | Table `trainers` existe - À enrichir |
| 10 | Développer formulaire inscription formateur (Frontend) | Frontend | ⬜ | Page `/register/trainer` - Multi-étapes |
| 11 | Créer API POST /formateurs/register (Backend) | Backend | ⬜ | Avec génération code cooptation |
| 12 | Implémenter génération code cooptation (Backend) | Backend | ⬜ | Format: TR-XXXXX unique |
| 13 | Créer API GET /formateurs/{id}/cooptes (Backend) | Backend | ⬜ | Étudiants référés par formateur |

---

### 🟡 PRIORITÉ 3: Module Formations

| # | Tâche | Type | Statut | Notes |
|---|-------|------|--------|-------|
| 14 | Créer modèle Formation (Backend) | Backend | ✅ | Table `trainings`→`lessons` existe |
| 15 | Développer formulaire création formation (Frontend) | Frontend | ⬜ | Admin: création complète |
| 16 | Implémenter système upload fichiers (Backend) | Backend | ⬜ | Templates, slides, vidéos |
| 17 | Créer API POST /formations (Backend) | Backend | ⬜ | Avec tous les types |
| 18 | Créer relation Formation-Formateur (Backend) | Backend | ⬜ | Table `lesson_assignments` |
| 19 | Créer API GET /formateurs (Backend) | Backend | ⬜ | Liste formateurs actifs |
| 20 | Composant sélection formateur (Frontend) | Frontend | ⬜ | Avec tarif négocié |
| 21 | Afficher infos formateur sur page formation (Frontend) | Frontend | ⬜ | Bio, stats, note |
| 22 | Créer composant Menu Formation (Frontend) | Frontend | ⬜ | Navigation catalogue |
| 23 | Créer API GET /formations (Backend) | Backend | ⬜ | Avec filtres |
| 24 | Développer système filtres (Frontend) | Frontend | ⬜ | Catégorie, type, niveau, prix |

---

### 🟢 PRIORITÉ 4: Gestion & Sessions

| # | Tâche | Type | Statut | Notes |
|---|-------|------|--------|-------|
| 25 | Créer page gestion formations (Frontend) | Frontend | ⬜ | Admin: liste CRUD |
| 26 | Créer API PUT /formations/{id} (Backend) | Backend | ⬜ | Update formation |
| 27 | Créer API DELETE /formations/{id} (Backend) | Backend | ⬜ | Soft delete |
| 28 | Implémenter modales confirmation (Frontend) | Frontend | ⬜ | Delete, publish, etc. |
| 29 | Créer modèle SessionPresentielle (Backend) | Backend | ✅ | Table `inperson_sessions` existe |
| 30 | Développer formulaire session présentielle (Frontend) | Frontend | ⬜ | Avec sélection salle |
| 31 | Créer API POST /formations/{id}/sessions/presentielles | Backend | ⬜ | Vérif disponibilité |
| 32 | Créer modèle SessionDistancielle (Backend) | Backend | ✅ | Table `remote_sessions` existe |
| 33 | Développer formulaire session distancielle (Frontend) | Frontend | ⬜ | Lien visio |
| 34 | Créer API POST /formations/{id}/sessions/distancielles | Backend | ⬜ | Avec notification |
| 35 | Implémenter envoi automatique emails (Backend) | Backend | ⬜ | Notifications sessions |

---

### 🔵 PRIORITÉ 5: Devis, Inscriptions & Adhésions

| # | Tâche | Type | Statut | Notes |
|---|-------|------|--------|-------|
| 36 | Créer modèle Devis (Backend) | Backend | ⬜ | Table `quotes` |
| 37 | Développer template PDF devis (Backend) | Backend | ⬜ | Génération PDF |
| 38 | Créer API POST /devis/generate (Backend) | Backend | ⬜ | Avec template |
| 39 | Intégrer bouton et formulaire devis (Frontend) | Frontend | ⬜ | Modal demande |
| 40 | Créer modèle Inscription (Backend) | Backend | ✅ | Table `enrollments` existe |
| 41 | Créer API POST /formations/{id}/inscrire (Backend) | Backend | ⬜ | Avec panier |
| 42 | Développer formulaire inscription (Frontend) | Frontend | ⬜ | Multi-étapes |
| 43 | Créer page Mes Formations (Frontend) | Frontend | ⬜ | Liste inscriptions membre |
| 44 | Créer API GET /utilisateurs/{id}/formations (Backend) | Backend | ⬜ | Avec progression |
| 45 | Implémenter logique calcul statuts (Backend) | Backend | ⬜ | En cours, terminé |
| 46 | Créer modèle Adhésion et règles (Backend) | Backend | ⬜ | Membership rules |
| 47 | Algorithme calcul éligibilité (Backend) | Backend | ⬜ | Prix membre/non-membre |
| 48 | Composant badge éligibilité (Frontend) | Frontend | ⬜ | Affichage statut |
| 49 | Intégration prix différencié (Frontend) | Frontend | ⬜ | Sur cartes formations |

---

## 🎨 DESIGN SYSTEM - Mobile-First Premium

### Principes de Design

1. **Mobile-First**: Toujours commencer par mobile, puis enrichir pour desktop
2. **Vivant**: Animations subtiles, micro-interactions engageantes
3. **Premium**: Ombres douces, dégradés subtils, espacement généreux
4. **UX**: Navigation intuitive, feedback immédiat, états de chargement
5. **UI**: Cohérence visuelle, hiérarchie claire, contraste accessible

### Palette de Couleurs Premium

```typescript
const colors = {
  // Primary - Bleu profond premium
  primary: {
    50: '#f0f9ff',
    100: '#e0f2fe',
    500: '#0ea5e9',
    600: '#0284c7',
    700: '#0369a1',
    gradient: 'linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%)',
  },

  // Secondary - Violet élégant
  secondary: {
    500: '#8b5cf6',
    600: '#7c3aed',
    gradient: 'linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%)',
  },

  // Accent - Or premium (pour gains/commissions)
  gold: {
    400: '#fbbf24',
    500: '#f59e0b',
    600: '#d97706',
    gradient: 'linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%)',
  },

  // Success
  success: {
    500: '#10b981',
    600: '#059669',
  },

  // Backgrounds
  background: {
    primary: '#ffffff',
    secondary: '#f8fafc',
    dark: '#0f172a',
    glass: 'rgba(255, 255, 255, 0.8)',
  },
}
```

### Composants Premium Mobile-First

```css
/* Card Premium avec Glass Effect */
.card-premium {
  @apply bg-white/80 backdrop-blur-lg;
  @apply rounded-2xl shadow-lg shadow-black/5;
  @apply border border-white/20;
  @apply transition-all duration-300;
  @apply hover:shadow-xl hover:shadow-black/10;
  @apply hover:-translate-y-1;
}

/* Button Premium avec Glow */
.btn-premium {
  @apply relative overflow-hidden;
  @apply bg-gradient-to-r from-primary-500 to-primary-600;
  @apply text-white font-semibold;
  @apply rounded-xl px-6 py-3;
  @apply shadow-lg shadow-primary-500/25;
  @apply transition-all duration-300;
  @apply hover:shadow-xl hover:shadow-primary-500/40;
  @apply active:scale-95;
}

/* Badge Gains Animation */
.badge-gains {
  @apply bg-gradient-to-r from-gold-400 to-gold-500;
  @apply text-white font-bold;
  @apply rounded-full px-4 py-2;
  @apply shadow-lg shadow-gold-500/30;
  @apply animate-pulse-subtle;
}
```

### Animations Framer Motion

```typescript
// lib/utils/animations.ts

export const fadeInUp = {
  initial: { opacity: 0, y: 20 },
  animate: { opacity: 1, y: 0 },
  exit: { opacity: 0, y: -20 },
  transition: { duration: 0.4, ease: [0.25, 0.46, 0.45, 0.94] }
}

export const staggerContainer = {
  animate: {
    transition: {
      staggerChildren: 0.1,
      delayChildren: 0.1
    }
  }
}

export const cardHoverPremium = {
  rest: {
    scale: 1,
    y: 0,
    boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
  },
  hover: {
    scale: 1.02,
    y: -8,
    boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.1)',
    transition: { duration: 0.3, ease: 'easeOut' }
  },
  tap: { scale: 0.98 }
}

export const pulseGlow = {
  animate: {
    boxShadow: [
      '0 0 0 0 rgba(245, 158, 11, 0.4)',
      '0 0 0 10px rgba(245, 158, 11, 0)',
    ],
    transition: { duration: 1.5, repeat: Infinity }
  }
}

export const countUp = {
  initial: { opacity: 0, scale: 0.5 },
  animate: {
    opacity: 1,
    scale: 1,
    transition: { type: 'spring', stiffness: 200, damping: 10 }
  }
}
```

---

## 📁 STRUCTURE DES PROJETS

### cs2i-admin (Administration)
```
cs2i-admin/src/
├── app/
│   ├── (admin)/
│   │   ├── dashboard/        # ✅ Existe
│   │   ├── members/          # ✅ Existe
│   │   ├── rooms/            # ✅ Existe
│   │   ├── trainers/         # ✅ À compléter
│   │   ├── sales-reps/       # 🆕 PRIORITÉ - Gestion commerciaux
│   │   ├── referrals/        # 🆕 PRIORITÉ - Gestion cooptations
│   │   ├── commissions/      # 🆕 PRIORITÉ - Gestion commissions
│   │   ├── lessons/          # 🆕 À créer
│   │   ├── categories/       # 🆕 À créer
│   │   ├── sessions/         # 🆕 À créer
│   │   ├── enrollments/      # 🆕 À créer
│   │   ├── quotes/           # 🆕 À créer
│   │   └── payments/         # 🆕 À créer
│   └── components/pages/
│       ├── sales-reps/       # 🆕 PRIORITÉ
│       ├── referrals/        # 🆕 PRIORITÉ
│       └── ...
└── lib/api/
    ├── sales-reps.service.ts # 🆕 PRIORITÉ
    ├── referrals.service.ts  # 🆕 PRIORITÉ
    ├── commissions.service.ts# 🆕 PRIORITÉ
    └── ...
```

### cs2i-client (Client)
```
cs2i-client/src/
├── app/[locale]/
│   ├── (auth)/
│   │   ├── register/
│   │   │   ├── trainer/      # 🆕 Inscription formateur
│   │   │   └── sales-rep/    # 🆕 PRIORITÉ - Inscription commercial
│   ├── (main)/
│   │   ├── lessons/          # 🆕 Catalogue formations
│   │   ├── trainers/         # 🆕 Répertoire formateurs
│   │   └── sessions/         # 🆕 Calendrier sessions
│   └── (dashboard)/
│       ├── member/
│       │   ├── cart/         # 🆕 Panier
│       │   ├── enrollments/  # 🆕 Mes formations
│       │   └── certificates/ # 🆕 Mes certificats
│       ├── trainer/
│       │   ├── dashboard/    # 🆕 Dashboard formateur
│       │   ├── referrals/    # 🆕 Mes cooptés
│       │   └── payments/     # 🆕 Mes paiements
│       └── sales-rep/        # 🆕 PRIORITÉ - Espace commercial
│           ├── dashboard/    # Dashboard avec stats gains
│           ├── referrals/    # Liste cooptés
│           ├── commissions/  # Historique commissions
│           └── marketing/    # Outils (QR code, liens)
└── components/
    ├── sales-rep/            # 🆕 PRIORITÉ
    ├── referrals/            # 🆕 PRIORITÉ
    └── ...
```

---

## 🚀 PHASES D'IMPLÉMENTATION

### PHASE 0: PRIORITÉ ABSOLUE - Commerciaux & Référencement

#### Sprint 0.1: Inscription Commercial (Tâches #1-3)

**Page Mobile-First**: `/register/sales-rep`

```
Mobile (375px):
┌─────────────────────────────────────┐
│         [Logo CS2I]                 │
│                                     │
│    Devenir Commercial Partenaire    │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ Prénom                      │   │
│  │ [_________________________] │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ Nom                         │   │
│  │ [_________________________] │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ Email                       │   │
│  │ [_________________________] │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ Téléphone                   │   │
│  │ [_________________________] │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ Mot de passe                │   │
│  │ [_________________________] │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ Code parrain (optionnel)    │   │
│  │ [_________________________] │   │
│  └─────────────────────────────┘   │
│                                     │
│  ☑ J'accepte les CGV               │
│                                     │
│  ┌─────────────────────────────┐   │
│  │   🚀 Créer mon compte       │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ 💰 Jusqu'à 15% commission   │   │
│  │ 📊 Dashboard temps réel     │   │
│  │ 🎯 Outils marketing         │   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
```

**Composants** `cs2i-client/src/components/sales-rep/`:
```
sales-rep/
├── registration/
│   ├── SalesRepRegistrationForm.tsx
│   ├── BenefitsCard.tsx
│   └── ReferralCodeInput.tsx
└── ...
```

---

#### Sprint 0.2: Dashboard Commercial (Tâches #4, 7-8)

**Dashboard Mobile-First Premium**:

```
Mobile (375px):
┌─────────────────────────────────────┐
│ [☰]  Dashboard        [🔔] [👤]    │
├─────────────────────────────────────┤
│                                     │
│  Bonjour, Jean! 👋                  │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ 💰 Vos Gains                │   │
│  │                             │   │
│  │ Ce mois    Total            │   │
│  │ €1,234     €8,567           │   │
│  │ [████████░░] +23%           │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ 🔗 Votre Code               │   │
│  │ ┌─────────────────────┐    │   │
│  │ │ COM-JEAN-2024  [📋] │    │   │
│  │ └─────────────────────┘    │   │
│  │ [WhatsApp] [Email] [QR]    │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌────────┬────────┬────────┐     │
│  │ 👥 45  │ ✅ 32  │ 💳 28  │     │
│  │Parrainés│Convertis│ Payés │     │
│  └────────┴────────┴────────┘     │
│                                     │
│  📈 Évolution des gains            │
│  ┌─────────────────────────────┐   │
│  │    ___                      │   │
│  │   /   \    ___              │   │
│  │  /     \__/   \___          │   │
│  │ Jan Feb Mar Avr Mai         │   │
│  └─────────────────────────────┘   │
│                                     │
│  👥 Derniers Parrainages           │
│  ┌─────────────────────────────┐   │
│  │ [A] Marie D.       Il y a 2h│   │
│  │     Membre ✅      +€45.00  │   │
│  ├─────────────────────────────┤   │
│  │ [A] Pierre L.      Hier     │   │
│  │     Formation ✅   +€22.50  │   │
│  └─────────────────────────────┘   │
│                                     │
│  [Voir tous →]                      │
│                                     │
├─────────────────────────────────────┤
│ [🏠] [👥] [💰] [📊] [👤]           │
└─────────────────────────────────────┘
```

**Composants Dashboard**:
```
sales-rep/
├── dashboard/
│   ├── EarningsCard.tsx           # Carte gains animée
│   ├── ReferralCodeCard.tsx       # Code + partage
│   ├── StatsGrid.tsx              # Grille stats
│   ├── EarningsChart.tsx          # Graphique gains
│   ├── RecentReferrals.tsx        # Liste récents
│   └── ShareButtons.tsx           # Boutons partage
├── referrals/
│   ├── ReferralList.tsx           # Liste complète
│   ├── ReferralCard.tsx           # Carte parrainé
│   ├── ReferralFilters.tsx        # Filtres
│   └── ReferralStatusBadge.tsx    # Badge statut
└── commissions/
    ├── CommissionList.tsx         # Historique
    ├── CommissionCard.tsx         # Carte commission
    └── PayoutRequest.tsx          # Demande paiement
```

---

#### Sprint 0.3: Cooptation & Commissions (Tâches #5-6)

**API Endpoints à créer**:
```
POST   /api/v1/sales-reps/register
GET    /api/v1/sales-reps/me
GET    /api/v1/sales-reps/me/stats
GET    /api/v1/sales-reps/me/referrals
GET    /api/v1/sales-reps/me/commissions
POST   /api/v1/sales-reps/me/payout-request
```

**Types TypeScript**:
```typescript
// types/sales-rep.ts
interface SalesRep {
  id: string;
  userId: string;
  referralCode: string;
  status: 'pending' | 'active' | 'suspended';
  totalReferrals: number;
  totalConversions: number;
  totalEarnings: number;
  pendingEarnings: number;
  createdAt: string;
}

interface Referral {
  id: string;
  referrerId: string;
  referredUserId: string;
  referredUser: User;
  status: 'pending' | 'converted' | 'expired';
  conversionType?: 'membership' | 'lesson_enrollment';
  commissionAmount?: number;
  createdAt: string;
  convertedAt?: string;
}

interface Commission {
  id: string;
  referralId: string;
  amount: number;
  percentage: number;
  sourceType: 'membership' | 'lesson_enrollment';
  status: 'pending' | 'approved' | 'paid';
  paidAt?: string;
  createdAt: string;
}
```

---

### PHASE 1: Formateurs & Inscription (Tâches #9-13)

#### Sprint 1.1: Inscription Formateur

**Page Multi-étapes Mobile-First**: `/register/trainer`

```
Étape 1/3 - Informations personnelles
┌─────────────────────────────────────┐
│         [Logo CS2I]                 │
│                                     │
│    Devenir Formateur CS2I           │
│                                     │
│  [●───────────────────]  1/3        │
│                                     │
│  Prénom: [_____________________]    │
│  Nom: [_____________________]       │
│  Email: [_____________________]     │
│  Téléphone: [_____________________] │
│  Mot de passe: [________________]   │
│                                     │
│  [Continuer →]                      │
└─────────────────────────────────────┘

Étape 2/3 - Profil professionnel
┌─────────────────────────────────────┐
│  [●●──────────────────]  2/3        │
│                                     │
│  Spécialisation:                    │
│  [Sélectionner ▼]                   │
│                                     │
│  Catégories:                        │
│  ☑ Français  ☑ Informatique        │
│  □ Anglais   □ Management          │
│                                     │
│  Expérience: [___] ans              │
│                                     │
│  Bio courte:                        │
│  [Zone de texte...]                 │
│                                     │
│  [← Retour] [Continuer →]           │
└─────────────────────────────────────┘

Étape 3/3 - Documents
┌─────────────────────────────────────┐
│  [●●●─────────────────]  3/3        │
│                                     │
│  CV: [📎 Uploader PDF]              │
│                                     │
│  Diplômes:                          │
│  [+ Ajouter un diplôme]             │
│  ┌───────────────────────────┐     │
│  │ Master Pédagogie 2015 [×] │     │
│  └───────────────────────────┘     │
│                                     │
│  LinkedIn: [https://...]            │
│                                     │
│  Code parrainage (optionnel):       │
│  [_____________________]            │
│                                     │
│  ☑ J'accepte les CGV               │
│                                     │
│  [← Retour] [🎓 Soumettre]          │
└─────────────────────────────────────┘
```

---

### PHASE 2: Module Formations (Tâches #14-24)

#### Sprint 2.1: Catalogue Public

**Page Catalogue Mobile-First**: `/lessons`

```
Mobile (375px):
┌─────────────────────────────────────┐
│ [☰]  Formations        [🔍] [🛒]   │
├─────────────────────────────────────┤
│                                     │
│  ┌─────────────────────────────┐   │
│  │ [Héro avec gradient]        │   │
│  │                             │   │
│  │ Développez vos compétences  │   │
│  │                             │   │
│  │ 🔍 Rechercher...            │   │
│  │ [_____________________]     │   │
│  │                             │   │
│  │ [Info] [Français] [+]       │   │
│  └─────────────────────────────┘   │
│                                     │
│  [Type ▼] [Niveau ▼] [Prix ▼]      │
│                                     │
│  256 formations                     │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ [Vignette 16:9]             │   │
│  │ [Leçon] [Débutant]          │   │
│  ├─────────────────────────────┤   │
│  │ React Avancé - Hooks        │   │
│  │ Maîtrisez les concepts...   │   │
│  │                             │   │
│  │ 👤 Marie D.  ⭐ 4.9 (234)   │   │
│  │ ⏱️ 12h  🎯 Online           │   │
│  │                             │   │
│  │ 💰 150€  [Membre: 120€]    │   │
│  │                             │   │
│  │ [Voir détails]              │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ [Vignette - Atelier]        │   │
│  │ [Atelier] [Tous niveaux]    │   │
│  ├─────────────────────────────┤   │
│  │ Atelier CV & Entretien      │   │
│  │ Préparez votre recherche... │   │
│  │                             │   │
│  │ 👤 Jean M.  ⭐ 4.8 (156)    │   │
│  │ ⏱️ 3h  🎯 Présentiel        │   │
│  │ 📅 15 Dec 2025              │   │
│  │                             │   │
│  │ 💰 80€  [Membre: 64€]      │   │
│  │                             │   │
│  │ [Voir détails]              │   │
│  └─────────────────────────────┘   │
│                                     │
│  [Charger plus...]                  │
│                                     │
└─────────────────────────────────────┘
```

**Composants**:
```
lessons/
├── LessonCard.tsx              # Carte premium animée
├── LessonGrid.tsx              # Grille responsive
├── LessonFilters.tsx           # Filtres mobile-friendly
├── LessonSearch.tsx            # Recherche suggestions
├── LessonHero.tsx              # Hero section
├── LessonTypeBadge.tsx         # Badge type
├── LessonModeBadge.tsx         # Badge mode
├── LessonPriceDisplay.tsx      # Prix membre/non-membre
└── LessonSkeleton.tsx          # Loading skeleton
```

---

### PHASE 3: Gestion & Sessions (Tâches #25-35)

#### Sprint 3.1: Administration Formations

**Page Admin**: `cs2i-admin/(admin)/lessons`

```
┌─────────────────────────────────────────────────────────────┐
│  Gestion des Formations                [+ Créer]           │
├─────────────────────────────────────────────────────────────┤
│  [Catégorie ▼] [Type ▼] [Statut ▼] [🔍 Rechercher]        │
├─────────────────────────────────────────────────────────────┤
│  ┌──────────────────────────────────────────────────────┐  │
│  │ [Vignette] React Avancé                              │  │
│  │            Marie D. • Leçon • Online                 │  │
│  │            [Publié ✓] 234 inscrits                   │  │
│  │            [👁️ Voir] [✏️ Éditer] [🗑️]               │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │ [Vignette] Atelier CV                                │  │
│  │            Jean M. • Atelier • Présentiel            │  │
│  │            [Brouillon] 0 inscrits                    │  │
│  │            [👁️ Voir] [✏️ Éditer] [📤 Publier]       │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

---

### PHASE 4: Devis, Inscriptions & Adhésions (Tâches #36-49)

#### Sprint 4.1: Système de Devis

**Modal Demande Devis**:
```
┌─────────────────────────────────────┐
│  Demander un Devis          [×]    │
├─────────────────────────────────────┤
│                                     │
│  Formation: React Avancé            │
│  Prix catalogue: 150€               │
│                                     │
│  Entreprise: [________________]     │
│  Nombre de participants: [__]       │
│  Date souhaitée: [📅 Choisir]      │
│                                     │
│  Message (optionnel):               │
│  [Zone de texte...]                 │
│                                     │
│  [Annuler] [📄 Demander le devis]  │
│                                     │
└─────────────────────────────────────┘
```

#### Sprint 4.2: Prix Différenciés

**Affichage Prix avec Badge Membre**:
```
┌─────────────────────────────────────┐
│  💰 Prix                            │
│                                     │
│  [Non-membre: 150€ barré]          │
│  Membre: 120€ (-20%)               │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ 👑 Devenez membre et          │ │
│  │    économisez 30€!            │ │
│  │    [En savoir plus]           │ │
│  └───────────────────────────────┘ │
│                                     │
│  [🛒 Ajouter au panier]            │
│  [📄 Demander un devis]            │
└─────────────────────────────────────┘
```

---

## 📱 RESPONSIVE BREAKPOINTS

```typescript
const breakpoints = {
  xs: '320px',   // Petits mobiles
  sm: '375px',   // iPhone standard
  md: '768px',   // Tablettes
  lg: '1024px',  // Desktop
  xl: '1280px',  // Grand écran
  '2xl': '1536px', // Très grand écran
}
```

### Approche Mobile-First

```tsx
// Toujours commencer par mobile
<div className="
  grid grid-cols-1        // Mobile: 1 colonne
  sm:grid-cols-2          // Tablette: 2 colonnes
  lg:grid-cols-3          // Desktop: 3 colonnes
  xl:grid-cols-4          // Grand: 4 colonnes
  gap-4 sm:gap-6 lg:gap-8 // Espacement progressif
">
```

---

## 🔐 RÔLES & PERMISSIONS

### Rôles
- **Guest**: Lecture catalogue
- **User/Member**: Panier, inscriptions, certificats
- **Trainer**: Profil, sessions, paiements, cooptation
- **SalesRep**: Dashboard, cooptation, commissions
- **Admin**: Tout

### Permissions SalesRep
```typescript
const salesRepPermissions = {
  dashboard: ['view'],
  referrals: ['view', 'export'],
  commissions: ['view'],
  profile: ['view', 'update'],
  payoutRequest: ['create'],
}
```

---

## 📝 PROGRESSION & SUIVI

### Comment utiliser cette checklist

1. **Au début de chaque tâche**: Je vous indiquerai le numéro et passerai le statut à 🔄
2. **À la fin de chaque tâche**: Je vous indiquerai de cocher ✅
3. **En cas de blocage**: J'indiquerai ⚠️ avec explication

### Format de mise à jour
```
PROGRESSION:
- Tâche #X: ✅ Terminée - [Notes si nécessaire]
- Tâche #Y: 🔄 En cours
- Tâche #Z: ⚠️ Bloquée - [Raison]
```

---

## 🔗 RÉFÉRENCES

### Documentation
- [REFACTOR_INSTRUCTIONS.md](./REFACTOR_INSTRUCTIONS.md) - Checklist backend
- [instruction.md](./instruction.md) - Spécifications techniques

### Projets
- **cs2i-admin**: `/home/vagrant/Projects/shlife/cs2i/cs2i-admin/`
- **cs2i-client**: `/home/vagrant/Projects/shlife/cs2i/cs2i-client/`
- **cs2i-api**: `/home/vagrant/Projects/shlife/cs2i/cs2i-api/`

### API Backend
- Base URL: `http://localhost:3001/api/v1/`

---

## ⚠️ NOTES IMPORTANTES

### Contradiction REFACTOR_INSTRUCTIONS.md

Le fichier `REFACTOR_INSTRUCTIONS.md` indique de **SUPPRIMER** les inscriptions autonomes formateurs/commerciaux. Cependant, votre checklist demande de les **CRÉER**.

**Décision**: Je suis votre checklist car vous êtes le client. Les fonctionnalités commerciaux et codes de référencement sont **PRIORITAIRES** comme demandé.

### Backend à créer/modifier

Pour que le frontend fonctionne, les endpoints backend suivants doivent être créés:
- `POST /api/v1/sales-reps/register` - Inscription commercial
- `POST /api/v1/trainers/register` - Inscription formateur
- `GET/POST /api/v1/referrals/*` - Gestion cooptation
- `GET/POST /api/v1/commissions/*` - Gestion commissions

---

**FIN DU GUIDE - Prêt à commencer par les Tâches #1-8 (Commerciaux)!**

## Coffee & Tea Boutique

Application e-commerce full-stack (Node/Express + MySQL + React/Vite) pour vendre cafés et thés.

### Architecture

- `backend/` : Node.js, Express, MySQL.
- `frontend/` : React, Vite, Tailwind CSS.


### Pour lancer Backend

```bash
cd backend
npm install
```

```bash
npm run dev
#accessible sur http://localhost:4000
```

### Pour lancer Frontend

```bash
cd frontend
npm install
npm run dev
# accessible sur http://localhost:5173
```

### Fonctionnalités volet User

- Page d’accueil guidant vers Café ou Thé, avec liens vers packs et promos.
- Sidebar persistante pour naviguer entre sections et accéder au panier.
- Pages catégories listant produits (nom, description, prix, stock) avec bouton « Ajouter au panier ».
- Panier partagé Café/Thé, modification quantité, suppression, totalisé.
- Recherche partagée entre toutes les pages.

### Fonctionnalités volet admin

- Mettre à jour les produits dans MySQL nom/description/prix/stock.
- Gérer les factures.

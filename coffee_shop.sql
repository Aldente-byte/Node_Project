-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 04 déc. 2025 à 20:34
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `coffee_shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `total`, `created_at`) VALUES
(1, 11.80, '2025-12-03 13:51:15'),
(2, 5.80, '2025-12-03 14:12:57'),
(3, 25.00, '2025-12-03 14:16:17'),
(4, 25.00, '2025-12-03 14:18:08'),
(5, 3.80, '2025-12-04 11:46:06'),
(6, 25.00, '2025-12-04 18:02:32');

-- --------------------------------------------------------

--
-- Structure de la table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name_fr`, `price`, `quantity`) VALUES
(1, 1, 6, 'Promo Caf? du Mois', 5.90, 2),
(2, 2, 4, 'Infusion Menthe', 2.90, 2),
(3, 3, 7, 'Matcha', 25.00, 1),
(4, 4, 7, 'Matcha', 25.00, 1),
(5, 5, 2, 'Café Latte Vanille', 3.80, 1),
(6, 6, 7, 'Matcha', 25.00, 1);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `description_fr` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `category` enum('coffee','tea','bundle','sale') NOT NULL,
  `image_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name_fr`, `description_fr`, `price`, `stock`, `category`, `image_url`) VALUES
(1, 'Espresso Intense', 'Un espresso cors? aux notes de chocolat noir.', 2.50, 50, 'coffee', 'https://images.pexels.com/photos/324028/pexels-photo-324028.jpeg'),
(2, 'Café Latte Vanille', 'Café doux au lait et arome naturel de vanille.', 3.80, 39, 'coffee', 'https://plus.unsplash.com/premium_photo-1723759448747-1d174225e61f?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(3, 'Thé Vert Sencha', 'Thé vert japonais frais et végétal.', 3.20, 60, 'tea', 'https://images.unsplash.com/photo-1628153792464-21bffac488d4?q=80&w=580&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(4, 'Infusion Menthe', 'Infusion rafra?chissante ? la menthe poivr?e.', 2.90, 35, 'tea', 'https://media.istockphoto.com/id/1140625685/photo/fresh-mint-leaves-with-dried-mint-in-wooden-spoon.jpg?s=1024x1024&w=is&k=20&c=tO_N96Wr2n9lcfbDyjJ2gYqUa6-NUrpW3B_5-tqGm8k='),
(5, 'Pack Découverte Café & Thé', 'Un assortiment de cafés et thés pour explorer notre gamme.', 12.90, 20, 'bundle', 'https://media.istockphoto.com/id/1393074741/photo/tea-and-coffee-are-on-wooden-spoons.jpg?s=1024x1024&w=is&k=20&c=e0_r5aF-tOYriRf9acAVf7nftXQBW-AKEPynt7ckSm0='),
(6, 'Promo Café du Mois', 'Café en promotion, torréfaction moyenne, idéal pour filtre.', 5.90, 30, 'sale', NULL),
(7, 'Matcha', 'japanese tead', 25.00, 48, 'tea', 'https://images.unsplash.com/photo-1624893578106-a98840591afc?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order` (`order_id`),
  ADD KEY `fk_product` (`product_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

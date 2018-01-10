-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 09, 2018 alle 18:41
-- Versione del server: 10.1.26-MariaDB
-- Versione PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniscout`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `album`
--

CREATE TABLE `album` (
  `id_image` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `album`
--

INSERT INTO `album` (`id_image`, `id_event`, `photo`) VALUES
(1, 1, 'https://goo.gl/nUDwnP'),
(2, 1, 'https://goo.gl/y96esc'),
(3, 1, 'https://goo.gl/dzHzPu');

-- --------------------------------------------------------

--
-- Struttura della tabella `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `articles`
--

INSERT INTO `articles` (`id_article`, `id_event`, `title`, `description`) VALUES
(1, 1, 'A walk to explore Talvera/Talfer', 'Vivamus sed metus vel purus pulvinar cursus. Etiam quam tellus, venenatis et porta congue, finibus id arcu. Phasellus hendrerit risus urna, in semper felis semper imperdiet. Mauris id ultrices felis, quis scelerisque nulla. In semper nibh a urna viverra pretium. Nunc malesuada ullamcorper enim vitae congue. Suspendisse euismod egestas eleifend.');

-- --------------------------------------------------------

--
-- Struttura della tabella `events`
--

CREATE TABLE `events` (
  `id_event` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `date_time` datetime NOT NULL,
  `location` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `past_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `events`
--

INSERT INTO `events` (`id_event`, `title`, `date_time`, `location`, `description`, `photo`, `past_date`) VALUES
(1, 'A walk along Talvera/Talfer', '2018-02-01 14:30:00', 'Bolzano/Bozen', 'Proin leo lorem, iaculis et neque eget, laoreet iaculis diam. Aenean aliquam non nisi id maximus. Maecenas viverra malesuada facilisis. Phasellus porta et tortor a dictum. Cras ut ornare leo. Fusce ultricies maximus condimentum. Phasellus semper ultricies erat nec suscipit. Vestibulum mattis mauris at urna rhoncus tristique. Ut laoreet aliquam lacus, eu pharetra nisl pretium ut.', 'https://goo.gl/5oBZYZ', 1),
(2, 'We\'re visiting Ritten/Renon!', '2018-06-10 08:00:00', 'Ritten/Renon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin in est id enim luctus tempor. Duis ultricies, tortor sit amet aliquam malesuada, enim tortor rhoncus nulla, vel lacinia ex lorem a leo. Vivamus volutpat tempor eros in malesuada. Sed ultrices augue sit amet ipsum imperdiet porttitor. Fusce sapien lorem, viverra ut semper ut, pretium id ante. Ut ultricies orci nec molestie aliquet. Maecenas viverra eget orci in egestas. Donec quis sem in tortor egestas mattis pharetra vel lectus. Cras ac neque purus. Donec interdum tempus quam, a placerat ante semper at. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed tempor eros urna, non faucibus est faucibus ut.', 'https://goo.gl/BRdqhS', 0),
(3, 'Your first trip to Jenesien/San Genesio', '2018-05-15 10:00:00', 'Jenesien/San Genesio', 'Nam eget consectetur turpis, sed cursus lectus. Phasellus pulvinar tristique orci ultricies elementum. Vivamus iaculis nec tellus id suscipit. Vestibulum dapibus sed elit et facilisis. Suspendisse nibh augue, hendrerit vel condimentum vitae, maximus at arcu. Suspendisse rhoncus purus at lacus ullamcorper mattis. Quisque imperdiet lacinia ligula nec scelerisque. Integer ac felis elit. Donec feugiat felis nisi, nec maximus enim tincidunt a. Donec finibus et tellus nec volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla quis aliquet augue, non tempor mauris.', 'https://goo.gl/DNXwKr', 0),
(4, 'Barbecue at Colle/Kohlern', '2018-07-08 12:30:00', 'Colle/Kohlern', 'Quisque ex eros, dictum sit amet nunc et, tristique rutrum turpis. Phasellus commodo, arcu in tempor egestas, sapien nisi sodales mauris, eget ullamcorper magna eros vitae justo. Donec vel nisi in nisl tristique dictum. Mauris ut tempor dolor, in mattis turpis. Sed eget sagittis metus. Aenean cursus dignissim velit, posuere commodo est vehicula eu. Suspendisse nunc lectus, blandit placerat ligula sed, mattis bibendum felis. Vivamus vel porta ligula, id porta metus. Curabitur sit amet mattis lorem. Nam ut ultrices ipsum, eget tempor erat.', 'https://goo.gl/9xUyHU', 0);
-- --------------------------------------------------------

--
-- Struttura della tabella `participants`
--

CREATE TABLE `participants` (
  `id_part` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email_address` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `participants`
--

INSERT INTO `participants` (`id_part`, `id_event`, `name`, `surname`, `phone_number`, `email_address`) VALUES
(1, 1, 'Giulia', 'Baldini', '298148948', 'baldinigiuls@gmail.com');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `id_event` (`id_event`);

--
-- Indici per le tabelle `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_event` (`id_event`);

--
-- Indici per le tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id_event`);

--
-- Indici per le tabelle `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id_part`),
  ADD KEY `id_event` (`id_event`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `album`
--
ALTER TABLE `album`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `events`
--
ALTER TABLE `events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `participants`
--
ALTER TABLE `participants`
  MODIFY `id_part` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `articles` (`id_event`);

--
-- Limiti per la tabella `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`);

--
-- Limiti per la tabella `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

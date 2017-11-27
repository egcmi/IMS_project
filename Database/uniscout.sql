-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 27, 2017 alle 16:11
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
-- Struttura della tabella `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `post` text,
  `album` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `articles`
--

INSERT INTO `articles` (`id_article`, `id_event`, `title`, `post`, `album`) VALUES
(1, 2, 'Amazing day with the Llamas', 'We spent the day with the llamas. They spit.', 'http://static.suedtirol.com/sasso-di-santa-croce.mtn.0002fa.jpg;;;http://static.suedtirol.com/sasso-di-santa-croce.mtn.0002fa.jpg;;;http://static.suedtirol.com/sasso-di-santa-croce.mtn.0002fa.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `events`
--

CREATE TABLE `events` (
  `id_event` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `date_time` datetime NOT NULL,
  `location` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `past_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `events`
--

INSERT INTO `events` (`id_event`, `name`, `date_time`, `location`, `description`, `price`, `photo`, `past_date`) VALUES
(1, 'Walk in the woods', '0000-00-00 00:00:00', 'Ritten', 'Come and join us in this amazing trip in the woods.', '5', 'http://static.suedtirol.com/sasso-di-santa-croce.mtn.0002fa.jpg', 0),
(2, 'Lorem', '0000-00-00 00:00:00', 'Ritten', 'Come and join us in this amazing trip in the woods.', '10', 'http://static.suedtirol.com/sasso-di-santa-croce.mtn.0002fa.jpg', 0),
(3, 'Walk in the woods', '2013-10-10 18:15:00', 'Ritten', 'Come and join us in this amazing trip in the woods.', '5', 'http://static.suedtirol.com/sasso-di-santa-croce.mtn.0002fa.jpg', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipants`
--

CREATE TABLE `partecipants` (
  `id_part` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email_address` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `partecipants`
--

INSERT INTO `partecipants` (`id_part`, `id_event`, `full_name`, `phone_number`, `email_address`) VALUES
(1, 2, 'Caio', '298148948', 'ciccio@pasticcio.com');

--
-- Indici per le tabelle scaricate
--

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
-- Indici per le tabelle `partecipants`
--
ALTER TABLE `partecipants`
  ADD PRIMARY KEY (`id_part`),
  ADD KEY `id_event` (`id_event`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `events`
--
ALTER TABLE `events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `partecipants`
--
ALTER TABLE `partecipants`
  MODIFY `id_part` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`);

--
-- Limiti per la tabella `partecipants`
--
ALTER TABLE `partecipants`
  ADD CONSTRAINT `partecipants_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

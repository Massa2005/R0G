-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 05, 2024 alle 10:42
-- Versione del server: 10.4.25-MariaDB
-- Versione PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rogdb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `commenti`
--

CREATE TABLE `commenti` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `mail_utente` varchar(255) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `commento` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `editori`
--

CREATE TABLE `editori` (
  `e_mail` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sede` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `editori`
--

INSERT INTO `editori` (`e_mail`, `nome`, `password`, `sede`) VALUES
('aaa', 'aaa', 'aaa', 'oriago');

-- --------------------------------------------------------

--
-- Struttura della tabella `giochi`
--

CREATE TABLE `giochi` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descrizione` varchar(500) NOT NULL,
  `prezzo` float NOT NULL,
  `sconto` int(11) NOT NULL,
  `mail_editore` varchar(255) NOT NULL,
  `main_img` varchar(255) NOT NULL,
  `valutazione` float NOT NULL,
  `data_pubblicazione` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `giochi`
--

INSERT INTO `giochi` (`id`, `nome`, `descrizione`, `prezzo`, `sconto`, `mail_editore`, `main_img`, `valutazione`, `data_pubblicazione`) VALUES
(1, 'mortal kombat', 'cazzotti', 60, 0, 'aaa', '', 0, '2024-03-08'),
(2, 'sss', 'fsad', 3, 0, 'aaa', '', 0, '2024-02-27'),
(3, 'aaa', 'aaa', 23, 0, 'aaa', '', 0, '2024-02-28'),
(4, 'fff', 'ssss', 3, 0, 'aaa', '', 0, '0000-00-00'),
(5, 'just cause', 'ssssss', 12, 0, 'aaa', '', 0, '0001-01-01'),
(6, 'just cause 3', 'Yu shut grapplin end go ZOOOOOOOOM and then BOOOOOM  end WOW, big plane GNEEEEEEWWWWW and KABOOOM', 14.78, 0, 'aaa', '', 0, '2024-03-11'),
(7, 'giovanniaaa', 'ultimo aggiunto\r\ne figo\r\ntest\r\naaa', 111, 0, 'aaa', '', 0, '2024-02-29'),
(8, 'test img', 'aaa', 22, 0, 'aaa', 'x', 0, '2024-02-29'),
(9, 'test vero', 'upload custom image', 1, 0, 'aaa', 'barche.png', 0, '2024-03-01'),
(10, 'ultimate test', 'immagine caricata spero', 24, 0, 'aaa', 'barche.png', 0, '2024-03-16'),
(11, '14123', 'qadsf', 234, 0, 'aaa', 'barche.png', 0, '2024-03-15'),
(12, 'ee', 'adasf', 315, 0, 'aaa', 'Icon.png', 0, '2024-03-16'),
(13, 'hreasfg', 'wryaghjjj', 134, 0, 'aaa', 'myflixer.png', 0, '2024-03-15'),
(14, 'egqwreq', 'fqegd', 12, 0, 'aaa', 'x', 0, '2024-03-08');

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE `immagini` (
  `game_id` int(11) NOT NULL,
  `source_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `keys`
--

CREATE TABLE `keys` (
  `game_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `libreria`
--

CREATE TABLE `libreria` (
  `mail_utente` varchar(255) NOT NULL,
  `game_id` int(11) NOT NULL,
  `data_acquisto` date NOT NULL DEFAULT current_timestamp(),
  `a_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `r_tag_game`
--

CREATE TABLE `r_tag_game` (
  `game_id` int(11) NOT NULL,
  `tag_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tags`
--

CREATE TABLE `tags` (
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `e_mail` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `data_nascita` date NOT NULL,
  `data_account` date NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`e_mail`, `nome`, `cognome`, `data_nascita`, `data_account`, `password`) VALUES
('aaa', 'aaa', 'aaa', '2024-03-04', '2024-03-09', 'aaa'),
('jjj', 'jjj', 'jjj', '2024-02-28', '2024-03-11', 'jjj'),
('samuele.zanon@itiszuccante.edu.it', 'Samuele', 'Zanon', '2005-02-13', '2024-03-08', 'Lollollollollol');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `commenti`
--
ALTER TABLE `commenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id_on_comment` (`game_id`),
  ADD KEY `user_id_on_comment` (`mail_utente`);

--
-- Indici per le tabelle `editori`
--
ALTER TABLE `editori`
  ADD PRIMARY KEY (`e_mail`);

--
-- Indici per le tabelle `giochi`
--
ALTER TABLE `giochi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publisher_on_game` (`mail_editore`);

--
-- Indici per le tabelle `immagini`
--
ALTER TABLE `immagini`
  ADD KEY `game_source` (`game_id`);

--
-- Indici per le tabelle `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`key`),
  ADD KEY `game_id_key_ref` (`game_id`);

--
-- Indici per le tabelle `libreria`
--
ALTER TABLE `libreria`
  ADD KEY `game_id_ref` (`game_id`),
  ADD KEY `a_key_ref` (`a_key`),
  ADD KEY `nonrompereilcazzo_mail_key_ref` (`mail_utente`);

--
-- Indici per le tabelle `r_tag_game`
--
ALTER TABLE `r_tag_game`
  ADD KEY `cicciopasticcio` (`game_id`),
  ADD KEY `tag_ref` (`tag_name`);

--
-- Indici per le tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`e_mail`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `commenti`
--
ALTER TABLE `commenti`
  ADD CONSTRAINT `game_id_on_comment` FOREIGN KEY (`game_id`) REFERENCES `giochi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id_on_comment` FOREIGN KEY (`mail_utente`) REFERENCES `utenti` (`e_mail`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `giochi`
--
ALTER TABLE `giochi`
  ADD CONSTRAINT `publisher_on_game` FOREIGN KEY (`mail_editore`) REFERENCES `editori` (`e_mail`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `immagini`
--
ALTER TABLE `immagini`
  ADD CONSTRAINT `game_source` FOREIGN KEY (`game_id`) REFERENCES `giochi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `keys`
--
ALTER TABLE `keys`
  ADD CONSTRAINT `game_id_key_ref` FOREIGN KEY (`game_id`) REFERENCES `giochi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `libreria`
--
ALTER TABLE `libreria`
  ADD CONSTRAINT `a_key_ref` FOREIGN KEY (`a_key`) REFERENCES `keys` (`key`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `game_id_ref` FOREIGN KEY (`game_id`) REFERENCES `giochi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nonrompereilcazzo_mail_key_ref` FOREIGN KEY (`mail_utente`) REFERENCES `utenti` (`e_mail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `r_tag_game`
--
ALTER TABLE `r_tag_game`
  ADD CONSTRAINT `cicciopasticcio` FOREIGN KEY (`game_id`) REFERENCES `giochi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tag_ref` FOREIGN KEY (`tag_name`) REFERENCES `tags` (`tag`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

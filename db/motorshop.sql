-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 15, 2017 alle 11:48
-- Versione del server: 10.1.25-MariaDB
-- Versione PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `motorshop`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `carrello`
--

CREATE TABLE `carrello` (
  `id_prodotto` int(11) NOT NULL,
  `quantity` int(3) DEFAULT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `carrello`
--

INSERT INTO `carrello` (`id_prodotto`, `quantity`, `username`) VALUES
(20, 1, 'luca'),
(21, 2, 'fra');

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie`
--

CREATE TABLE `categorie` (
  `id_categoria` int(10) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT 'descrizione mancante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `categorie`
--

INSERT INTO `categorie` (`id_categoria`, `nome`, `descrizione`) VALUES
(1, 'Caschi', 'caschi moto, enduro, cross'),
(13, 'Abbigliamento', 'Abbigliamento moto stradale, enduro, cross, motard'),
(14, 'Accessori', 'Accessori vari per moto'),
(15, 'Stivali', 'Stivali moto stradali, enduro, cross, motard');

-- --------------------------------------------------------

--
-- Struttura della tabella `coupon`
--

CREATE TABLE `coupon` (
  `id_coupon` int(10) NOT NULL,
  `codice_coupon` int(10) NOT NULL,
  `validità` date DEFAULT NULL,
  `sconto` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `dettagliordini`
--

CREATE TABLE `dettagliordini` (
  `id_ordine` int(10) NOT NULL,
  `id_prodotto` int(11) NOT NULL,
  `quantita` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `dettagliordini`
--

INSERT INTO `dettagliordini` (`id_ordine`, `id_prodotto`, `quantita`) VALUES
(1, 1, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppi`
--

CREATE TABLE `gruppi` (
  `id_gruppo` int(10) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descrizione` varchar(100) DEFAULT 'descrizione mancante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `gruppi`
--

INSERT INTO `gruppi` (`id_gruppo`, `nome`, `descrizione`) VALUES
(1, 'admin', 'superadmin'),
(2, 'user', 'normaluser');

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppiservizi`
--

CREATE TABLE `gruppiservizi` (
  `id_gruppo` int(10) DEFAULT NULL,
  `id_servizio` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `gruppiservizi`
--

INSERT INTO `gruppiservizi` (`id_gruppo`, `id_servizio`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(2, 5),
(1, 4),
(1, 6),
(1, 7),
(2, 1),
(1, 8),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 17),
(1, 16),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(1, 40),
(2, 40);

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE `immagini` (
  `id_immagine` int(10) NOT NULL,
  `path` varchar(50) DEFAULT NULL,
  `alt` varchar(50) DEFAULT 'immagine mancante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `immagini`
--

INSERT INTO `immagini` (`id_immagine`, `path`, `alt`) VALUES
(39, './img/cascocross1.jpg', 'Casco Cross AGV'),
(40, './img/cascocross2.jpg', 'Casco Cross Acerbis'),
(41, './img/tuta1.jpg', 'Tuta Acerbis'),
(42, './img/stivali1.jpg', 'Stivali Acerbis'),
(43, './img/slider1.jpg', 'Slider1'),
(44, './img/slider2.jpg', 'Slider 2'),
(45, './img/slider3.jpg', 'Slider 3'),
(46, './img/newsMarquez.jpg', 'News Marquez'),
(47, './img/cascojet.jpg', 'Casco Jet Acerbis'),
(48, './img/casco1.jpg', 'Casco AGV VR46'),
(49, './img/guanti.jpg', 'Guanti Stradale'),
(50, './img/maglia1.jpg', 'Felpa Aprilia'),
(51, './img/maglia2.jpg', 'Camicia Aprilia'),
(52, './img/sottocasco.jpg', 'Sottocasco'),
(53, './img/stivali2.jpg', 'Stivali OffRoad Oneil'),
(54, './img/stivali3.jpg', 'Stivali Off Road Axo'),
(55, './img/stivalistrada.jpg', 'Stivali Forma'),
(56, './img/pantaloneAcerbis1.jpg', 'Pantalone Acerbis Rosso'),
(57, './img/magliaAcerbis1.jpg', 'Maglia Acerbis Rossa');

-- --------------------------------------------------------

--
-- Struttura della tabella `immaginiprodotto`
--

CREATE TABLE `immaginiprodotto` (
  `id_immagine` int(10) DEFAULT NULL,
  `id_prodotto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `marketingforspecificuser`
--

CREATE TABLE `marketingforspecificuser` (
  `id_prodotto` int(11) NOT NULL,
  `contvisualizzazioni` int(12) DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `addremovotocart` int(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `news`
--

CREATE TABLE `news` (
  `id_news` int(11) NOT NULL,
  `data_news` date DEFAULT NULL,
  `immagine` varchar(1000) NOT NULL,
  `titolo` varchar(80) DEFAULT NULL,
  `corpo` longtext NOT NULL,
  `id_prodotto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `news`
--

INSERT INTO `news` (`id_news`, `data_news`, `immagine`, `titolo`, `corpo`, `id_prodotto`) VALUES
(2, '2017-11-12', './img/newsMarquez.jpg', 'MotoGP Valencia: Vince Pedrosa, Marquez Campione del Mondo', 'Dani Pedrosa trionfa nel giorno di Marc Marquez: se il pilota di Sabadell conquista una nuova vittoria superando allâ€™ultimo giro Johann Zarco (al terzo podio stagionale, il secondo consecutivo, nella sua stagione dâ€™esordio in MotoGP) il terzo posto di Marquez, ottenuto dopo un salvataggio al limite, gli permette di festeggiare la quarta corona iridata in MotoGP. Ducati resta allâ€™asciutto, visto il doppio zero per cadute di Andrea Dovizioso e Jorge Lorenzo, ma con la consapevolezza di aver sfiorato il titolo e di chiudere una stagione da protagonista, con lâ€™italiano vice campione del mondo.\r\nLa gara inizia con lâ€™ottimo scatto di Marquez, ben protetto da Pedrosa, mentre a seguire ci sono Zarco e Lorenzo, agganciato poco dopo da un Dovizioso in rimonta. Eccezion fatta per il rookie francese che prende la testa della corsa, sono questi i piloti che impostano un ritmo superiore agli altri: da notare poi i messaggi mandati dal box Ducati al maiorchino, che perÃ² rimane davanti al compagno di squadra cercando di mantenerlo agganciato al duo Honda ed a Zarco. I colpi di scena perÃ² arrivano a pochi giri dalla fine: Marquez si salva miracolosamente da una caduta, perdendo svariate posizioni, ma poco dopo finisce nella ghiaia prima la gara di Jorge Lorenzo ed infine quella di Andrea Dovizioso.\r\nLa stagione si chiude con la battaglia tra Johann Zarco e Dani Pedrosa, con lo spagnolo che alla fine riesce ad avere la meglio sul rookie ed a vincere la gara, mentre Marc Marquez terzo Ã¨ ufficialmente campione del mondo, il piÃ¹ giovane a vincere sei titoli in carriera. La quarta posizione al traguardo Ã¨ di Alex Rins, che ha preceduto Valentino Rossi ed Andrea Iannone, mentre Jack Miller conquista il settimo posto davanti a Cal Crutchlow, alla wild card Michele Pirro ed a Tito Rabat. Si chiude con un mesto dodicesimo posto la stagione di Maverick Vinales, che ha preceduto Danilo Petrucci sul traguardo, mentre finisce con un doppio zero lâ€™annata di Aprilia, vista la caduta sia di Aleix Espargaro che di Sam Lowes.', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `ordini`
--

CREATE TABLE `ordini` (
  `id_ordine` int(10) NOT NULL,
  `data_ordine` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prezzoTotale` int(10) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ordini`
--

INSERT INTO `ordini` (`id_ordine`, `data_ordine`, `prezzoTotale`, `username`) VALUES
(1, '2017-11-14 17:39:41', 200, 'fra'),
(2, '2017-11-14 18:18:14', 200, 'luca');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `id_prodotto` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `prezzo` int(10) NOT NULL,
  `quantità` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prenotazioni`
--

INSERT INTO `prenotazioni` (`id_prodotto`, `username`, `prezzo`, `quantità`) VALUES
(22, 'luca', 60, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id_prodotto` int(11) NOT NULL,
  `titolo` varchar(50) NOT NULL,
  `tipologia` varchar(50) DEFAULT NULL,
  `prezzo` int(10) DEFAULT NULL,
  `quantita` int(10) DEFAULT NULL,
  `descrizione` text,
  `id_immaginePrincipale` int(10) DEFAULT NULL,
  `id_categoria` int(10) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotti`
--

INSERT INTO `prodotti` (`id_prodotto`, `titolo`, `tipologia`, `prezzo`, `quantita`, `descrizione`, `id_immaginePrincipale`, `id_categoria`, `data`) VALUES
(1, 'Casco Cross AGV', 'OffRoad', 200, 5, 'gbdfvfdvfdvdfv', 39, 1, '2017-11-13 10:58:07'),
(19, 'Casco Cross Acerbis', 'OffRoad', 100, 4, 'Casco Acerbis', 40, 1, '2017-11-14 10:58:07'),
(20, 'Tuta Acerbis', 'Stradale', 800, 2, 'Tuta Moto Stradale Acerbis', 41, 13, '2017-11-14 11:15:05'),
(21, 'Stivali Off Road Acerbis', 'OffRoad', 100, 6, 'Stivali Enduro cross', 42, 15, '2017-11-14 11:16:24'),
(22, 'Casco Jet Acerbis', 'Stradale', 60, 0, 'Casco jet per Scooter Acerbis', 47, 1, '2017-11-14 18:26:40'),
(23, 'Casco AGV Replica VR46', 'Stradale', 250, 1, 'Casco Replica Valentino Rossi', 48, 1, '2017-11-14 19:33:58'),
(24, 'Guanti Arlen', 'Stradale', 50, 10, 'Guanti per moto da strada ', 49, 14, '2017-11-14 19:34:54'),
(25, 'Felpa Aprilia Racing', 'Stradale', 80, 25, 'Felpa Team Aprilia Racing', 50, 13, '2017-11-14 19:35:33'),
(26, 'Camicia Aprilia RAcing', 'Stradale', 70, 20, 'Camicia Team Aprilia Racing', 51, 13, '2017-11-14 19:36:02'),
(27, 'Sottocasco ', 'OffRoad', 20, 15, 'Sottocasco ', 52, 14, '2017-11-14 19:36:36'),
(28, 'Stivali OffRoad Axo', 'OffRoad', 170, 8, 'Stivali OffRoad Axo, Enduro, Cross', 54, 15, '2017-11-14 19:37:14'),
(29, 'Stivali Forma', 'Stradale', 99, 8, 'Stivali per moto stradale Forma', 55, 15, '2017-11-14 19:39:40'),
(30, 'Pantalone Acerbis 2017 Rosso', 'OffRoad', 154, 5, 'Pantalone della nuova collezione Acerbis 2017 Rosso', 56, 13, '2017-11-14 19:44:26'),
(31, 'Maglia Acerbis 2017 Rosso', 'OffRoad', 54, 5, 'Maglia della nuova collezione Acerbis 2017 Rossa', 57, 13, '2017-11-14 19:45:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `recensioni`
--

CREATE TABLE `recensioni` (
  `id_recensione` int(12) NOT NULL,
  `data_inserimento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `titolo` varchar(50) NOT NULL,
  `testo` varchar(350) NOT NULL,
  `username` varchar(50) NOT NULL,
  `id_prodotto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `recensioni`
--

INSERT INTO `recensioni` (`id_recensione`, `data_inserimento`, `titolo`, `testo`, `username`, `id_prodotto`) VALUES
(6, '2017-11-14 19:21:01', 'Ottimo Prodoto', 'Prodotto ok', 'luca', 1),
(7, '2017-11-14 19:23:40', 'Top!!!!!!!!!', 'I migliori stivali in commercio', 'fra', 21),
(8, '2017-11-15 10:42:37', 'ciao', 'yfcgbhj', 'fra', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `servizi`
--

CREATE TABLE `servizi` (
  `id_servizio` int(10) NOT NULL,
  `script` varchar(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT 'descrizione mancante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `servizi`
--

INSERT INTO `servizi` (`id_servizio`, `script`, `descrizione`) VALUES
(1, 'login.php', ''),
(2, 'add-categoria.php', 'aggiunta della categoria '),
(3, 'add-prodotto.php', 'aggiunta prodotti'),
(4, 'index.php', 'pagina iniziale della deshboard'),
(5, 'add-news.php', 'aggiunta news'),
(6, 'edit-user.php', 'modifica degli utenti registrati'),
(7, 'delete-group.php', 'cancellazione di un gruppo'),
(8, 'delete-news.php', 'eliminazione news'),
(9, 'single-product.php', 'pagina singolo prodotto front-end'),
(10, 'add-group.php', 'aggiunta gruppo'),
(11, 'add-immagini.php', 'aggiunta immagini'),
(12, 'add-slider.php', 'aggiunta slider'),
(13, 'add-user.php', 'aggiunta utente'),
(14, 'add-servizio.php', 'aggiunta servizi'),
(16, 'assegnagruppo-servizio.php', 'assegnazione di un gruppo ad uno specifico servizio'),
(17, 'assegnagruppo-user.php', 'assegnazione di un gruppo ad un user'),
(20, 'delete-categoria.php', 'cancellazione categorie'),
(21, 'delete-prodotto.php', 'cancellazione prodotti'),
(22, 'delete-immagini.php', 'cancellazione immagini'),
(23, 'delete-servizio.php', 'cancellazione servizi '),
(24, 'delete-user.php', 'cancellazione utenti '),
(25, 'delete-slider.php', 'cancellazione slider index'),
(26, 'edit-categoria.php', 'modifica categoria'),
(27, 'edit-group.php', 'modifica gruppo'),
(28, 'edit-immagini.php', 'modifica immagini'),
(29, 'edit-news.php', 'modifica news'),
(30, 'edit-prodotto.php', 'modifica prodotto'),
(31, 'edit-servizio.php', 'modifica servizio'),
(32, 'edit-slider.php', 'modifica slider'),
(33, 'add-coupon.php', 'aggiunta coupon'),
(34, 'delete-coupon.php', 'cancellazione coupon'),
(35, 'edit-coupon.php', 'modifica coupon'),
(36, 'index.php', 'descrizione mancante'),
(37, 'single-product.php', 'descrizione mancante'),
(38, 'cart.php', 'descrizione mancante'),
(39, 'checkout.php', 'descrizione mancante'),
(40, 'addProductToCart.php', 'descrizione mancante');

-- --------------------------------------------------------

--
-- Struttura della tabella `slider`
--

CREATE TABLE `slider` (
  `id_immagine` int(10) DEFAULT NULL,
  `id_position` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `slider`
--

INSERT INTO `slider` (`id_immagine`, `id_position`) VALUES
(43, 1),
(44, 2),
(45, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `indirizzo` varchar(50) NOT NULL,
  `cap` int(10) NOT NULL,
  `stato` varchar(50) NOT NULL,
  `cellulare` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`nome`, `cognome`, `citta`, `indirizzo`, `cap`, `stato`, `cellulare`, `username`, `password`, `email`) VALUES
('Francesco', 'Di Cato', 'Celano', 'Via Santa Cecilia', 67043, 'Italia', '3397470467', 'fra', '123', 'france@gmail.com'),
('Gino', 'Formaggino', 'Avezzano', 'Via Roma', 1, 'Italia', '123456789', 'gino', 'gino', 'gino@gmail.com'),
('Luca', 'Potenza', 'Civitella', 'via 20 settembre', 67042, 'Italia', '333333333', 'luca', '123', 'luca@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `utentigruppi`
--

CREATE TABLE `utentigruppi` (
  `username` varchar(50) NOT NULL,
  `id_gruppo` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utentigruppi`
--

INSERT INTO `utentigruppi` (`username`, `id_gruppo`) VALUES
('fra', 1),
('gino', 2),
('luca', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `wishlist`
--

CREATE TABLE `wishlist` (
  `id_prodotto` int(11) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `wishlist`
--

INSERT INTO `wishlist` (`id_prodotto`, `username`) VALUES
(20, 'luca'),
(1, 'fra');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `carrello`
--
ALTER TABLE `carrello`
  ADD PRIMARY KEY (`id_prodotto`,`username`),
  ADD KEY `username` (`username`);

--
-- Indici per le tabelle `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indici per le tabelle `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id_coupon`);

--
-- Indici per le tabelle `dettagliordini`
--
ALTER TABLE `dettagliordini`
  ADD KEY `id_ordine` (`id_ordine`),
  ADD KEY `id_prodotto` (`id_prodotto`);

--
-- Indici per le tabelle `gruppi`
--
ALTER TABLE `gruppi`
  ADD PRIMARY KEY (`id_gruppo`);

--
-- Indici per le tabelle `gruppiservizi`
--
ALTER TABLE `gruppiservizi`
  ADD KEY `id_gruppo` (`id_gruppo`),
  ADD KEY `id_servizio` (`id_servizio`);

--
-- Indici per le tabelle `immagini`
--
ALTER TABLE `immagini`
  ADD PRIMARY KEY (`id_immagine`);

--
-- Indici per le tabelle `immaginiprodotto`
--
ALTER TABLE `immaginiprodotto`
  ADD KEY `id_prodotto` (`id_prodotto`),
  ADD KEY `id_immagine` (`id_immagine`);

--
-- Indici per le tabelle `marketingforspecificuser`
--
ALTER TABLE `marketingforspecificuser`
  ADD KEY `username` (`username`),
  ADD KEY `id_prodotto` (`id_prodotto`);

--
-- Indici per le tabelle `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_news`),
  ADD KEY `id_prodotto` (`id_prodotto`);

--
-- Indici per le tabelle `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`id_ordine`),
  ADD KEY `username` (`username`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`id_prodotto`,`username`),
  ADD KEY `username` (`username`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id_prodotto`),
  ADD KEY `id_immaginePrincipale` (`id_immaginePrincipale`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indici per le tabelle `recensioni`
--
ALTER TABLE `recensioni`
  ADD PRIMARY KEY (`id_recensione`),
  ADD KEY `username` (`username`),
  ADD KEY `id_prodotto` (`id_prodotto`);

--
-- Indici per le tabelle `servizi`
--
ALTER TABLE `servizi`
  ADD PRIMARY KEY (`id_servizio`);

--
-- Indici per le tabelle `slider`
--
ALTER TABLE `slider`
  ADD KEY `id_immagine` (`id_immagine`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`username`);

--
-- Indici per le tabelle `utentigruppi`
--
ALTER TABLE `utentigruppi`
  ADD PRIMARY KEY (`username`,`id_gruppo`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_gruppo` (`id_gruppo`);

--
-- Indici per le tabelle `wishlist`
--
ALTER TABLE `wishlist`
  ADD KEY `id_prodotto` (`id_prodotto`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT per la tabella `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id_coupon` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `gruppi`
--
ALTER TABLE `gruppi`
  MODIFY `id_gruppo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `immagini`
--
ALTER TABLE `immagini`
  MODIFY `id_immagine` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT per la tabella `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `ordini`
--
ALTER TABLE `ordini`
  MODIFY `id_ordine` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id_prodotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT per la tabella `recensioni`
--
ALTER TABLE `recensioni`
  MODIFY `id_recensione` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT per la tabella `servizi`
--
ALTER TABLE `servizi`
  MODIFY `id_servizio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `carrello`
--
ALTER TABLE `carrello`
  ADD CONSTRAINT `carrello_ibfk_1` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`) ON DELETE CASCADE,
  ADD CONSTRAINT `carrello_ibfk_2` FOREIGN KEY (`username`) REFERENCES `utenti` (`username`) ON DELETE CASCADE;

--
-- Limiti per la tabella `dettagliordini`
--
ALTER TABLE `dettagliordini`
  ADD CONSTRAINT `dettagliordini_ibfk_1` FOREIGN KEY (`id_ordine`) REFERENCES `ordini` (`id_ordine`) ON DELETE CASCADE,
  ADD CONSTRAINT `dettagliordini_ibfk_2` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`);

--
-- Limiti per la tabella `gruppiservizi`
--
ALTER TABLE `gruppiservizi`
  ADD CONSTRAINT `gruppiservizi_ibfk_1` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppi` (`id_gruppo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gruppiservizi_ibfk_2` FOREIGN KEY (`id_servizio`) REFERENCES `servizi` (`id_servizio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `immaginiprodotto`
--
ALTER TABLE `immaginiprodotto`
  ADD CONSTRAINT `immaginiprodotto_ibfk_1` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`) ON DELETE CASCADE,
  ADD CONSTRAINT `immaginiprodotto_ibfk_2` FOREIGN KEY (`id_immagine`) REFERENCES `immagini` (`id_immagine`) ON DELETE CASCADE;

--
-- Limiti per la tabella `marketingforspecificuser`
--
ALTER TABLE `marketingforspecificuser`
  ADD CONSTRAINT `marketingforspecificuser_ibfk_1` FOREIGN KEY (`username`) REFERENCES `utenti` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `marketingforspecificuser_ibfk_2` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`);

--
-- Limiti per la tabella `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`);

--
-- Limiti per la tabella `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `ordini_ibfk_1` FOREIGN KEY (`username`) REFERENCES `utenti` (`username`) ON DELETE CASCADE;

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`),
  ADD CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`username`) REFERENCES `utenti` (`username`) ON DELETE CASCADE;

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `prodotti_ibfk_1` FOREIGN KEY (`id_immaginePrincipale`) REFERENCES `immagini` (`id_immagine`) ON DELETE CASCADE,
  ADD CONSTRAINT `prodotti_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorie` (`id_categoria`) ON DELETE CASCADE;

--
-- Limiti per la tabella `recensioni`
--
ALTER TABLE `recensioni`
  ADD CONSTRAINT `recensioni_ibfk_1` FOREIGN KEY (`username`) REFERENCES `utenti` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `recensioni_ibfk_2` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`) ON DELETE CASCADE;

--
-- Limiti per la tabella `slider`
--
ALTER TABLE `slider`
  ADD CONSTRAINT `slider_ibfk_1` FOREIGN KEY (`id_immagine`) REFERENCES `immagini` (`id_immagine`) ON DELETE CASCADE;

--
-- Limiti per la tabella `utentigruppi`
--
ALTER TABLE `utentigruppi`
  ADD CONSTRAINT `utentigruppi_ibfk_1` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppi` (`id_gruppo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utentigruppi_ibfk_2` FOREIGN KEY (`username`) REFERENCES `utenti` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`id_prodotto`) REFERENCES `prodotti` (`id_prodotto`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`username`) REFERENCES `utenti` (`username`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

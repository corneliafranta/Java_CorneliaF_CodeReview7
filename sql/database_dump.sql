-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Aug 2020 um 14:54
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr7-franta`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `courses`
--

INSERT INTO `courses` (`id`, `name`, `teacher`) VALUES
(1, '1a', 7),
(2, '2a', 4),
(3, '3a', 6),
(4, '4a', 5),
(5, '1b', 2),
(6, '2b', 9),
(7, '3b', 10),
(8, '4b', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `surname` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `students`
--

INSERT INTO `students` (`id`, `name`, `surname`, `email`, `course`) VALUES
(2, 'Amelie', 'Franta', 'a.fr@gmail.com', 1),
(3, 'Marlène', 'Gillard', 'ggillard0@multiply.com', 1),
(4, 'Maëlann', 'Gillopp', 'cgillopp1@nbcnews.com', 1),
(5, 'Lóng', 'Mustarde', 'cmustarde2@ameblo.jp', 1),
(6, 'Béatrice', 'Blowen', 'iblowen3@marketwatch.com', 1),
(7, 'Océane', 'Cowlam', 'scowlam4@t-online.de', 5),
(8, 'Yóu', 'Ramm', 'nramm5@friendfeed.com', 5),
(9, 'Mélinda', 'Squeers', 'fsqueers6@jigsy.com', 5),
(10, 'Stéphanie', 'Tittershill', 'etittershill7@time.com', 5),
(11, 'Cléa', 'Chalice', 'nchalice8@wikia.com', 5),
(12, 'Miléna', 'Parkes', 'aparkes9@lulu.com', 2),
(13, 'Eloïse', 'MacLucais', 'tmaclucaisa@istockphoto.com', 2),
(14, 'Marie-hélène', 'O\'Halligan', 'mohalliganb@china.com.cn', 2),
(15, 'Angélique', 'MacCague', 'emaccaguec@constantcontact.com', 2),
(16, 'Léane', 'Ravillas', 'hravillasd@simplemachines.org', 2),
(17, 'Gaïa', 'Piecha', 'rpiechae@furl.net', 6),
(18, 'Séréna', 'Isaak', 'disaakf@paypal.com', 6),
(19, 'Gaëlle', 'Murdoch', 'cmurdochg@patch.com', 6),
(20, 'Mahélie', 'Charpin', 'lcharpinh@ask.com', 6),
(21, 'Léonore', 'Langeley', 'mlangeleyi@hhs.gov', 6),
(22, 'Loïs', 'Whatling', 'awhatlingj@google.pl', 3),
(23, 'Amélie', 'Duplain', 'kduplaink@delicious.com', 3),
(24, 'Maëly', 'Gaylard', 'bgaylardl@jigsy.com', 3),
(25, 'Aloïs', 'Etter', 'retterm@gizmodo.com', 3),
(26, 'Marie-françoise', 'Stovin', 'cstovinn@twitter.com', 3),
(27, 'Börje', 'Celier', 'aceliero@toplist.cz', 7),
(28, 'Andréa', 'Rubel', 'drubelp@biblegateway.com', 7),
(29, 'Maëlle', 'Soigne', 'csoigneq@elegantthemes.com', 7),
(30, 'Kévina', 'Frissell', 'lfrissellr@sbwire.com', 7),
(31, 'Rébecca', 'Juckes', 'zjuckess@huffingtonpost.com', 7),
(32, 'Aimée', 'Stoller', 'istollert@51.la', 4),
(33, 'Séréna', 'McTurlough', 'vmcturloughu@icio.us', 4),
(34, 'Åslög', 'McCaw', 'cmccawv@huffingtonpost.com', 4),
(35, 'Yè', 'O\' Bee', 'aobeew@dedecms.com', 4),
(36, 'Garçon', 'Peasby', 'apeasbyx@nytimes.com', 4),
(37, 'Eliès', 'Tomowicz', 'atomowiczy@pinterest.com', 8),
(38, 'Åke', 'Menis', 'dmenisz@bandcamp.com', 8),
(39, 'Géraldine', 'Tabour', 'ctabour10@vkontakte.ru', 8),
(40, 'Laurène', 'De Witt', 'hdewitt11@webnode.com', 8),
(41, 'Clélia', 'Prys', 'kprys12@ca.gov', 8),
(42, 'Andrée', 'Sallan', 'tsallan13@deliciousdays.com', 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `surname` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `surname`, `email`) VALUES
(1, 'Yè', 'Danet', 'tdanet0@microsoft.com'),
(2, 'Illustrée', 'Ivashintsov', 'tivashintsov1@home.pl'),
(3, 'Valérie', 'Haily', 'lhaily2@seattletimes.com'),
(4, 'Zoé', 'Burder', 'mburder3@xinhuanet.com'),
(5, 'Gisèle', 'Gillcrist', 'cgillcrist4@pen.io'),
(6, 'Styrbjörn', 'Minchi', 'jminchi5@fda.gov');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachingplan`
--

CREATE TABLE `teachingplan` (
  `course` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `teachingplan`
--

INSERT INTO `teachingplan` (`course`, `teacher`) VALUES
(1, 5),
(5, 5),
(2, 2),
(6, 6),
(3, 3),
(7, 1),
(4, 4),
(8, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher` (`teacher`);

--
-- Indizes für die Tabelle `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course` (`course`);

--
-- Indizes für die Tabelle `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teachingplan`
--
ALTER TABLE `teachingplan`
  ADD KEY `fk_course_id` (`course`),
  ADD KEY `fk_teacher_id` (`teacher`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT für Tabelle `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`);

--
-- Constraints der Tabelle `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`course`) REFERENCES `courses` (`id`);

--
-- Constraints der Tabelle `teachingplan`
--
ALTER TABLE `teachingplan`
  ADD CONSTRAINT `fk_course_id` FOREIGN KEY (`course`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `fk_teacher_id` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

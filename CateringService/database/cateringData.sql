-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2022 at 09:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catering`
--

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`KategorijaID`, `NazivKategorije`, `Program`) VALUES
(0, 'Izbrisana', 'Rezervisan'),
(13, 'Pizze', 'slani'),
(14, 'Pite', 'slatki'),
(15, 'Kolači', 'slatki'),
(16, 'Torte', 'slatki'),
(17, 'Burita', 'slani'),
(18, 'Salate', 'slani'),
(20, 'Mesa', 'slani');

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`KorisnickoIme`, `Ime`, `Prezime`, `Adresa`, `Poeni`, `PasswordHash`, `RolaID`) VALUES
('dgudovicA', 'David', 'Gudov', 'IX Crnogorske Brigade 106', 41, '923352284767451ab158a387a283df26', 1),
('dgudovicK', 'David', 'Gudd', 'Adresaa', 0, '7e831608553c7cd0fce55e8aa933eded', 3),
('dgudovicKl', 'David', 'Gudovic', 'awdwa', 3, '923352284767451ab158a387a283df26', 3),
('dgudovicM', 'David', 'Gudovic', 'Obrenovacka 23', 13, '923352284767451ab158a387a283df26', 2),
('izbrisani', 'Rezervisan', 'Korisnik', 'Nema', 0, 'Nema', 1);

--
-- Dumping data for table `narudzbine`
--

INSERT INTO `narudzbine` (`NarudzbinaID`, `KorisnickoIme`, `DatumKreiranja`, `DatumOstvarivanja`, `Status`, `UkupnaCena`, `Popust`) VALUES
(1, 'dgudovicA', '2022-07-19', NULL, 2, 3900, 0),
(2, 'dgudovicA', '2022-07-19', NULL, 2, 3900, 0),
(3, 'dgudovicA', '2022-07-19', '2022-07-19', 1, 4800, 0),
(4, 'dgudovicA', '2022-07-19', '2022-07-19', 1, 3900, 0),
(5, 'dgudovicA', '2022-07-19', '2022-07-19', 1, 3900, 0),
(6, 'dgudovicA', '2022-07-19', '2022-07-19', 1, 3900, 0),
(7, 'dgudovicA', '2022-07-19', NULL, 2, 3600, 0),
(8, 'dgudovicA', '2022-07-19', NULL, 2, 2880, 20),
(9, 'dgudovicM', '2022-07-20', '2022-07-20', 1, 4600, 0),
(10, 'dgudovicM', '2022-07-20', NULL, 2, 3680, 20),
(11, 'dgudovicM', '2022-07-20', NULL, 0, 4600, 0),
(12, 'dgudovicA', '2022-07-20', NULL, 2, 3900, 0),
(13, 'dgudovicA', '2022-07-20', NULL, 0, 3900, 0),
(14, 'dgudovicA', '2022-07-20', NULL, 0, 3900, 0),
(15, 'dgudovicA', '2022-07-20', NULL, 2, 3900, 0),
(16, 'dgudovicA', '2022-07-22', '2022-07-22', 1, 2880, 20),
(17, 'dgudovicA', '2022-07-24', NULL, 2, 1200, 0),
(18, 'dgudovicA', '2022-07-25', NULL, 0, 3040, 20),
(19, 'dgudovicKl', '2022-07-26', '2022-07-26', 1, 3700, 0);

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`ProizvodID`, `NazivProizvoda`, `Opis`, `Slika`, `CenaPoPorciji`, `KategorijaID`) VALUES
(0, 'izbrisani', 'Rezervisan proizvod ID za izbrisane proizvode', 'nema', 0, 0),
(1, 'Cezar Salata', 'Salata od pileceg belog mesa, zelene salate, i tako to sto znam ja ', 'cezar.jpg', 200, 18),
(4, 'Burito Madre', 'Najpopularniji lokalni burito sa piletinom, zapečenim pasuljem i zelenom salatom', 'burito.jpg', 300, 17),
(5, 'Capricciosa', 'Klasična italijanska pica sa tankim testom, pelatom, šunkom i sirom', 'pica.jpg', 300, 13),
(6, 'Popek', 'Pohovano mleveno juneće meso, sa kajmakom i pršutom, pomfrit i salata', 'popek.jpg', 500, 20),
(7, 'Lenja pita', 'Tradicionalna pita crnogorske kuhinje sa dve kore i filom od jabuka', 'lenjaPita.jpg', 400, 14),
(8, 'Quatro Stagioni', 'Poznata italijanska pica sa cetiri vrste sira. Mozarela, Gauda, Trapist, Parmegiano.', 'quatroS.jpg', 500, 13),
(20, 'Čokoladna torta', 'Torta sa prelivom od crne čokolade i filom od bele čokolade', 'cokTorta.jpg', 400, 16),
(24, 'Mafin s\' jagodom', 'Ukusni mafin sa ukrasnim omotom, filom od vanile i jagodama', 'mafinJag.jpg', 300, 15);

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RolaID`, `NazivRole`) VALUES
(1, 'Administrator'),
(2, 'Menadzer'),
(3, 'Klijent');

--
-- Dumping data for table `stavkenarudzbine`
--

INSERT INTO `stavkenarudzbine` (`ProizvodID`, `NarudzbinaID`, `Kolicina`) VALUES
(1, 1, 3),
(1, 2, 3),
(1, 3, 3),
(1, 4, 3),
(1, 5, 3),
(1, 6, 3),
(1, 9, 4),
(1, 10, 4),
(1, 11, 4),
(1, 12, 3),
(1, 13, 3),
(1, 14, 3),
(1, 15, 3),
(1, 18, 7),
(1, 19, 6),
(4, 1, 4),
(4, 2, 4),
(4, 3, 7),
(4, 4, 4),
(4, 5, 4),
(4, 6, 4),
(4, 7, 4),
(4, 8, 4),
(4, 9, 4),
(4, 10, 4),
(4, 11, 4),
(4, 12, 4),
(4, 13, 4),
(4, 14, 4),
(4, 15, 4),
(4, 16, 4),
(6, 1, 4),
(6, 2, 4),
(6, 3, 4),
(6, 4, 4),
(6, 5, 4),
(6, 6, 4),
(6, 7, 4),
(6, 8, 4),
(6, 9, 5),
(6, 10, 5),
(6, 11, 5),
(6, 12, 4),
(6, 13, 4),
(6, 14, 4),
(6, 15, 4),
(6, 16, 4),
(6, 19, 5),
(24, 18, 8);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

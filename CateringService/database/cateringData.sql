-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2022 at 07:08 PM
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
(1, 'Test', 'slani'),
(2, 'Pice', 'slani'),
(3, 'Pite', 'slatki');

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`KorisnickoIme`, `Ime`, `Prezime`, `Adresa`, `Poeni`, `PasswordHash`, `RolaID`) VALUES
('dgudovic', 'David', 'Gudovic', 'IX Crnogorske Brigade 1060', 14, '923352284767451ab158a387a283df26', 1),
('Dusko', 'Dusan', 'Gudovic', 'Obrenovacka 23', 0, 'f1dc735ee3581693489eaf286088b916', 3),
('izbrisani', 'Rezervisan', 'Korisnik', 'Nema', 0, 'Nema', 1);

--
-- Dumping data for table `narudzbine`
--

INSERT INTO `narudzbine` (`NarudzbinaID`, `KorisnickoIme`, `DatumKreiranja`, `DatumOstvarivanja`, `Ostvarena`, `UkupnaCena`, `Popust`) VALUES
(13, 'dgudovic', '2022-07-16', NULL, 0, 3200, 20),
(14, 'dgudovic', '2022-07-16', NULL, 0, 2900, 0),
(15, 'dgudovic', '2022-07-16', NULL, 0, 3600, 0);

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`ProizvodID`, `NazivProizvoda`, `Opis`, `Slika`, `CenaPoPorciji`, `KategorijaID`) VALUES
(0, 'izbrisani', 'Rezervisan proizvod ID za izbrisane proizvode', 'nema', 0, 1),
(1, 'Cezar Salata', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ', 'cezar', 100, 1),
(4, 'Burito', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\r\nLorem ipsum dolor sit amet, consectetur adipiscing eli', 'burito', 300, 1),
(5, 'Pica', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore', 'pica', 300, 2),
(6, 'Popek', 'Sto se tice popeka popeko sam', 'popek', 600, 1),
(7, 'Lenja pita', 'Prava pita za crnogorsku omladinu jedan dva tri a dje a dje a dje si ti', 'lenjaPita', 400, 3),
(8, 'Quatro Stagioni', 'Poznata italijanska pica sa cetiri vrste sira. Mozarela, Gauda, Trapist, Parmegiano.', 'quatroStagioni', 500, 2);

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
(0, 13, 4),
(4, 14, 3),
(6, 14, 2),
(6, 15, 6),
(7, 14, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

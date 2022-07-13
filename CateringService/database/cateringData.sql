
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Database: `catering`   SAMO PODACI
--


INSERT INTO `kategorije` (`KategorijaID`, `NazivKategorije`, `Program`) VALUES
(1, 'Test', 'slani'),
(2, 'Pice', 'slani'),
(3, 'Pite', 'slatki');

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`KorisnickoIme`, `Ime`, `Prezime`, `Adresa`, `Poeni`, `PasswordHash`, `RolaID`) VALUES
('dgudovic', 'David', 'Gudovic', 'IX Crnogorske Brigade 106', 1000, '923352284767451ab158a387a283df26', 1),
('Dusko', 'Dusan', 'Gudovic', 'Obrenovacka 23', 0, 'f1dc735ee3581693489eaf286088b916', 3);

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`ProizvodID`, `NazivProizvoda`, `Opis`, `Slika`, `CenaPoPorciji`, `KategorijaID`) VALUES
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
COMMIT;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
-- STRUCTURE ONLY -- 
-- --------------------------------------------------------

--
-- Table structure for table `izvestaji`
--

CREATE TABLE `izvestaji` (
  `IzvestajID` int(11) NOT NULL,
  `KorisnickoIme` varchar(50) NOT NULL,
  `TekstIzvestaja` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

CREATE TABLE `kategorije` (
  `KategorijaID` int(11) NOT NULL,
  `NazivRole` varchar(30) NOT NULL,
  `Opis` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `KorisnickoIme` varchar(50) NOT NULL,
  `Ime` varchar(30) NOT NULL,
  `Prezime` varchar(30) NOT NULL,
  `Adresa` varchar(30) NOT NULL,
  `Poeni` int(11) NOT NULL,
  `PasswordHash` varchar(50) NOT NULL,
  `RolaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `narudzbine`
--

CREATE TABLE `narudzbine` (
  `NarudzbinaID` int(11) NOT NULL,
  `KorisnickoIme` varchar(50) NOT NULL,
  `DatumKreiranja` date NOT NULL,
  `DatumOstvarivanja` date DEFAULT NULL,
  `Ostvarena` int(11) NOT NULL,
  `UkupnaCena` float NOT NULL,
  `Popust` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

CREATE TABLE `proizvodi` (
  `ProizvodID` int(11) NOT NULL,
  `NazivProizvoda` varchar(30) NOT NULL,
  `Opis` varchar(30) NOT NULL,
  `Slika` varchar(50) NOT NULL,
  `CenaPoPorciji` int(11) NOT NULL,
  `Program` varchar(10) NOT NULL,
  `KategorijaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RolaID` int(11) NOT NULL,
  `NazivRole` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stavkenarudzbine`
--

CREATE TABLE `stavkenarudzbine` (
  `ProizvodID` int(11) NOT NULL,
  `NarudzbinaID` int(11) NOT NULL,
  `KorisnickoIme` varchar(50) NOT NULL,
  `Kolicina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `izvestaji`
--
ALTER TABLE `izvestaji`
  ADD PRIMARY KEY (`IzvestajID`),
  ADD KEY `FK_IzvestajiKorisnik` (`KorisnickoIme`);

--
-- Indexes for table `kategorije`
--
ALTER TABLE `kategorije`
  ADD PRIMARY KEY (`KategorijaID`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`KorisnickoIme`),
  ADD KEY `FK_Korisnik_Rola` (`RolaID`);

--
-- Indexes for table `narudzbine`
--
ALTER TABLE `narudzbine`
  ADD PRIMARY KEY (`NarudzbinaID`,`KorisnickoIme`),
  ADD KEY `FK_Narudzbina_Korisnik` (`KorisnickoIme`);

--
-- Indexes for table `proizvodi`
--
ALTER TABLE `proizvodi`
  ADD PRIMARY KEY (`ProizvodID`),
  ADD KEY `FK_Proizvodi_Kategorije` (`KategorijaID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RolaID`);

--
-- Indexes for table `stavkenarudzbine`
--
ALTER TABLE `stavkenarudzbine`
  ADD PRIMARY KEY (`ProizvodID`,`NarudzbinaID`,`KorisnickoIme`),
  ADD KEY `FK_Stavke_Narudzbe_Korisnik` (`KorisnickoIme`),
  ADD KEY `FK_Stavke_Narudzbe` (`NarudzbinaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `izvestaji`
--
ALTER TABLE `izvestaji`
  MODIFY `IzvestajID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategorije`
--
ALTER TABLE `kategorije`
  MODIFY `KategorijaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `narudzbine`
--
ALTER TABLE `narudzbine`
  MODIFY `NarudzbinaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proizvodi`
--
ALTER TABLE `proizvodi`
  MODIFY `ProizvodID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RolaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `izvestaji`
--
ALTER TABLE `izvestaji`
  ADD CONSTRAINT `FK_IzvestajiKorisnik` FOREIGN KEY (`KorisnickoIme`) REFERENCES `korisnici` (`KorisnickoIme`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD CONSTRAINT `FK_Korisnik_Rola` FOREIGN KEY (`RolaID`) REFERENCES `role` (`RolaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `narudzbine`
--
ALTER TABLE `narudzbine`
  ADD CONSTRAINT `FK_Narudzbina_Korisnik` FOREIGN KEY (`KorisnickoIme`) REFERENCES `korisnici` (`KorisnickoIme`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `proizvodi`
--
ALTER TABLE `proizvodi`
  ADD CONSTRAINT `FK_Proizvodi_Kategorije` FOREIGN KEY (`KategorijaID`) REFERENCES `kategorije` (`KategorijaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `stavkenarudzbine`
--
ALTER TABLE `stavkenarudzbine`
  ADD CONSTRAINT `FK_Stavke_Narudzbe` FOREIGN KEY (`NarudzbinaID`) REFERENCES `narudzbine` (`NarudzbinaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Stavke_Narudzbe_Korisnik` FOREIGN KEY (`KorisnickoIme`) REFERENCES `narudzbine` (`KorisnickoIme`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Stavke_Proizvodi` FOREIGN KEY (`ProizvodID`) REFERENCES `proizvodi` (`ProizvodID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;



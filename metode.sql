-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table metodesaw.alternatif
CREATE TABLE IF NOT EXISTS `alternatif` (
  `idalternatif` int(11) NOT NULL AUTO_INCREMENT,
  `nmalternatif` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idalternatif`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table metodesaw.alternatif: ~3 rows (approximately)
/*!40000 ALTER TABLE `alternatif` DISABLE KEYS */;
INSERT INTO `alternatif` (`idalternatif`, `nmalternatif`) VALUES
	(1, 'Ringan'),
	(2, 'Sedang'),
	(3, 'Berat');
/*!40000 ALTER TABLE `alternatif` ENABLE KEYS */;

-- Dumping structure for table metodesaw.bobot
CREATE TABLE IF NOT EXISTS `bobot` (
  `idbobot` int(11) NOT NULL AUTO_INCREMENT,
  `idkriteria` int(11) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idbobot`),
  KEY `idkriteria` (`idkriteria`),
  CONSTRAINT `FK__kriteria` FOREIGN KEY (`idkriteria`) REFERENCES `kriteria` (`idkriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table metodesaw.bobot: ~5 rows (approximately)
/*!40000 ALTER TABLE `bobot` DISABLE KEYS */;
INSERT INTO `bobot` (`idbobot`, `idkriteria`, `value`) VALUES
	(1, 1, '0.456'),
	(2, 2, '0.256'),
	(3, 3, '0.156'),
	(4, 4, '0.09'),
	(5, 5, '0.04\r\n');
/*!40000 ALTER TABLE `bobot` ENABLE KEYS */;

-- Dumping structure for table metodesaw.kriteria
CREATE TABLE IF NOT EXISTS `kriteria` (
  `idkriteria` int(11) NOT NULL AUTO_INCREMENT,
  `nmkriteria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idkriteria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table metodesaw.kriteria: ~5 rows (approximately)
/*!40000 ALTER TABLE `kriteria` DISABLE KEYS */;
INSERT INTO `kriteria` (`idkriteria`, `nmkriteria`) VALUES
	(1, 'Jumlah korban'),
	(2, 'Kerugian harta benda'),
	(3, 'Kerusakan prasarana dan sarana'),
	(4, 'Cakupan luas wilayah yang terkena'),
	(5, 'Dampak sosial yang ditimbulkan');
/*!40000 ALTER TABLE `kriteria` ENABLE KEYS */;

-- Dumping structure for table metodesaw.matrixkeputusan
CREATE TABLE IF NOT EXISTS `matrixkeputusan` (
  `idmatrix` int(11) NOT NULL AUTO_INCREMENT,
  `idalternatif` int(11) DEFAULT NULL,
  `idbobot` int(11) DEFAULT NULL,
  `idskala` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmatrix`),
  KEY `idalternatif` (`idalternatif`),
  KEY `idbobot` (`idbobot`),
  KEY `idskala` (`idskala`),
  CONSTRAINT `FK__alternatif` FOREIGN KEY (`idalternatif`) REFERENCES `alternatif` (`idalternatif`),
  CONSTRAINT `FK__bobot` FOREIGN KEY (`idbobot`) REFERENCES `bobot` (`idbobot`),
  CONSTRAINT `FK__skala` FOREIGN KEY (`idskala`) REFERENCES `skala` (`idskala`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table metodesaw.matrixkeputusan: ~15 rows (approximately)
/*!40000 ALTER TABLE `matrixkeputusan` DISABLE KEYS */;
INSERT INTO `matrixkeputusan` (`idmatrix`, `idalternatif`, `idbobot`, `idskala`) VALUES
	(1, 1, 1, 1),
	(2, 1, 2, 1),
	(3, 1, 3, 1),
	(4, 1, 4, 1),
	(5, 1, 5, 1),
	(6, 2, 1, 2),
	(7, 2, 2, 2),
	(8, 2, 3, 2),
	(9, 2, 4, 2),
	(10, 2, 5, 2),
	(11, 3, 1, 3),
	(12, 3, 2, 3),
	(13, 3, 3, 3),
	(14, 3, 4, 3),
	(15, 3, 5, 3);
/*!40000 ALTER TABLE `matrixkeputusan` ENABLE KEYS */;

-- Dumping structure for view metodesaw.multimoora_1
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `multimoora_1` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pra` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.multimoora_2
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `multimoora_2` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pra` DOUBLE NULL,
	`normalisasi` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.multimoora_3
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `multimoora_3` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pra` DOUBLE NULL,
	`normalisasi` DOUBLE NULL,
	`normalisasibobot` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.multimoora_4
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `multimoora_4` (
	`idalternatif` INT(11) NOT NULL,
	`hasil` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.nilaimax
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `nilaimax` (
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`maksimum` INT(11) NULL
) ENGINE=MyISAM;

-- Dumping structure for table metodesaw.skala
CREATE TABLE IF NOT EXISTS `skala` (
  `idskala` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idskala`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table metodesaw.skala: ~2 rows (approximately)
/*!40000 ALTER TABLE `skala` DISABLE KEYS */;
INSERT INTO `skala` (`idskala`, `value`, `keterangan`) VALUES
	(1, 1, 'Kecil'),
	(2, 2, 'Sedang'),
	(3, 3, 'Besar');
/*!40000 ALTER TABLE `skala` ENABLE KEYS */;

-- Dumping structure for view metodesaw.topsis_maxmin
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_maxmin` (
	`idmatrix` INT(11) NOT NULL,
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`maximum` DOUBLE NULL,
	`minimum` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.topsis_nilaiv
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_nilaiv` (
	`idalternatif` INT(11) NOT NULL,
	`dplus` DOUBLE NULL,
	`dmin` DOUBLE NULL,
	`nilaiv` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.topsis_normalisasi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_normalisasi` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.topsis_pembagi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_pembagi` (
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`bagi` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.topsis_sipsin
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_sipsin` (
	`idalternatif` INT(11) NOT NULL,
	`dplus` DOUBLE NULL,
	`dmin` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.topsis_terbobot
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `topsis_terbobot` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DOUBLE NULL,
	`terbobot` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.vmatrixkeputusan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vmatrixkeputusan` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.vnormalisasi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vnormalisasi` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DECIMAL(14,4) NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.vprarangking
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vprarangking` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DECIMAL(14,4) NULL,
	`prarangking` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.vrangking
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vrangking` (
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`rangking` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for table metodesaw.weight
CREATE TABLE IF NOT EXISTS `weight` (
  `id_weight` int(11) NOT NULL AUTO_INCREMENT,
  `bencana` varchar(50) NOT NULL,
  `alternatif` int(1) NOT NULL,
  `kriteria` int(1) NOT NULL,
  PRIMARY KEY (`id_weight`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table metodesaw.weight: ~0 rows (approximately)
/*!40000 ALTER TABLE `weight` DISABLE KEYS */;
INSERT INTO `weight` (`id_weight`, `bencana`, `alternatif`, `kriteria`) VALUES
	(1, 'Kebakaran', 3, 3),
	(2, 'Gempa Bumi', 3, 1);
/*!40000 ALTER TABLE `weight` ENABLE KEYS */;

-- Dumping structure for view metodesaw.wp_jumbobot
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_jumbobot` (
	`jumlah` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.wp_nilais
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_nilais` (
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilaiS` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.wp_nilaiv
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_nilaiv` (
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilaiV` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.wp_normalisasiterbobot
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_normalisasiterbobot` (
	`idbobot` INT(11) NOT NULL,
	`idkriteria` INT(11) NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`jumlah` DOUBLE NULL,
	`normalisasi_w` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.wp_pangkat
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_pangkat` (
	`idmatrix` INT(11) NOT NULL,
	`idalternatif` INT(11) NOT NULL,
	`nmalternatif` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idkriteria` INT(11) NOT NULL,
	`nmkriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`idbobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nilai` INT(11) NULL,
	`keterangan` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi_w` DOUBLE NULL,
	`pangkat` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.wp_sums
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_sums` (
	`jum` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view metodesaw.multimoora_1
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `multimoora_1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multimoora_1` AS SELECT vmatrixkeputusan.`*`, SQRT(SUM(POW(vmatrixkeputusan
.nilai,2))) AS pra FROM vmatrixkeputusan GROUP BY vmatrixkeputusan.idkriteria ;

-- Dumping structure for view metodesaw.multimoora_2
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `multimoora_2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multimoora_2` AS SELECT vmatrixkeputusan.*, multimoora_1.pra,
(vmatrixkeputusan.nilai/multimoora_1.pra) AS
normalisasi FROM vmatrixkeputusan, multimoora_1 WHERE
multimoora_1.idkriteria=vmatrixkeputusan.idkriteria
GROUP BY vmatrixkeputusan.idmatrix ;

-- Dumping structure for view metodesaw.multimoora_3
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `multimoora_3`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multimoora_3` AS SELECT multimoora_2.*, (multimoora_2.normalisasi*
multimoora_2.value) AS normalisasibobot FROM
multimoora_2 GROUP BY multimoora_2.idmatrix ;

-- Dumping structure for view metodesaw.multimoora_4
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `multimoora_4`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `multimoora_4` AS SELECT multimoora_3.idalternatif, SUM(multimoora_3.
normalisasibobot) AS hasil FROM multimoora_3 GROUP BY
multimoora_3.idalternatif ;

-- Dumping structure for view metodesaw.nilaimax
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `nilaimax`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilaimax` AS SELECT idkriteria,nmkriteria,MAX(nilai) AS maksimum FROM vmatrixkeputusan
GROUP BY idkriteria ;

-- Dumping structure for view metodesaw.topsis_maxmin
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_maxmin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_maxmin` AS SELECT topsis_terbobot.idmatrix,topsis_terbobot.idkriteria, topsis_terbobot.nmkriteria,
MAX(topsis_terbobot.terbobot) AS maximum, MIN(topsis_terbobot.terbobot) AS
minimum FROM topsis_terbobot GROUP BY topsis_terbobot.idkriteria ;

-- Dumping structure for view metodesaw.topsis_nilaiv
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_nilaiv`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_nilaiv` AS SELECT topsis_sipsin.*, (topsis_sipsin.dmin/(topsis_sipsin.dplUs+topsis_sipsin.dmin)) AS nilaiv FROM topsis_sipsin GROUP BY topsis_sipsin.idalternatif ;

-- Dumping structure for view metodesaw.topsis_normalisasi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_normalisasi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_normalisasi` AS SELECT vmatrixkeputusan.`*`,(vmatrixkeputusan.nilai/topsis_pembagi.bagi) AS normalisasi FROM
vmatrixkeputusan,topsis_pembagi WHERE topsis_pembagi.idkriteria=vmatrixkeputusan.idkriteria
GROUP BY vmatrixkeputusan.idmatrix ;

-- Dumping structure for view metodesaw.topsis_pembagi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_pembagi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_pembagi` AS SELECT vmatrixkeputusan.idkriteria,vmatrixkeputusan.nmkriteria,
SQRT(SUM(POW(vmatrixkeputusan.nilai,2))) AS bagi FROM vmatrixkeputusan
GROUP BY vmatrixkeputusan.idkriteria ;

-- Dumping structure for view metodesaw.topsis_sipsin
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_sipsin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_sipsin` AS SELECT topsis_terbobot.idalternatif, SQRT(SUM(POW((topsis_maxmin.maximum-topsis_terbobot.terbobot),2))) AS
dplus, SQRT(SUM(POW((topsis_maxmin.minimum-topsis_terbobot.terbobot),2))) AS
dmin FROM topsis_terbobot, topsis_maxmin WHERE topsis_terbobot.idkriteria=topsis_maxmin.idkriteria
GROUP BY topsis_terbobot.idalternatif ;

-- Dumping structure for view metodesaw.topsis_terbobot
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `topsis_terbobot`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topsis_terbobot` AS SELECT topsis_normalisasi.`*`,(bobot.value*topsis_normalisasi.normalisasi)
AS terbobot FROM topsis_normalisasi, bobot WHERE bobot.idkriteria=topsis_normalisasi.idkriteria
GROUP BY topsis_normalisasi.idmatrix ;

-- Dumping structure for view metodesaw.vmatrixkeputusan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vmatrixkeputusan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmatrixkeputusan` AS SELECT matrixkeputusan.idmatrix,alternatif.*,kriteria.*,bobot.idbobot,bobot.value,
skala.value AS nilai,skala.keterangan FROM matrixkeputusan,skala,bobot,kriteria,alternatif WHERE 
matrixkeputusan.idalternatif=alternatif.idalternatif AND matrixkeputusan.idbobot=bobot.idbobot AND
matrixkeputusan.idskala=skala.idskala AND kriteria.idkriteria=bobot.idkriteria ;

-- Dumping structure for view metodesaw.vnormalisasi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vnormalisasi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnormalisasi` AS SELECT vmatrixkeputusan.`*`,(vmatrixkeputusan.nilai/nilaimax.maksimum)
as normalisasi from vmatrixkeputusan,nilaimax where nilaimax.idkriteria=
vmatrixkeputusan.idkriteria GROUP BY vmatrixkeputusan.idmatrix ;

-- Dumping structure for view metodesaw.vprarangking
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vprarangking`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprarangking` AS SELECT vnormalisasi.*,(vnormalisasi.value*vnormalisasi.normalisasi) AS
prarangking FROM vnormalisasi GROUP BY vnormalisasi.idmatrix ;

-- Dumping structure for view metodesaw.vrangking
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vrangking`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vrangking` AS SELECT idalternatif,nmalternatif,SUM(prarangking) AS rangking FROM vprarangking
GROUP BY idalternatif ;

-- Dumping structure for view metodesaw.wp_jumbobot
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_jumbobot`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_jumbobot` AS SELECT SUM(VALUE) AS jumlah FROM bobot ;

-- Dumping structure for view metodesaw.wp_nilais
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_nilais`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_nilais` AS SELECT idalternatif,nmalternatif,EXP(SUM(LOG(wp_pangkat.pangkat)))
AS nilaiS FROM wp_pangkat GROUP BY idalternatif ;

-- Dumping structure for view metodesaw.wp_nilaiv
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_nilaiv`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_nilaiv` AS SELECT wp_nilais.idalternatif,wp_nilais.nmalternatif,(nilaiS/jum)
AS nilaiV FROM wp_nilais,wp_sums ;

-- Dumping structure for view metodesaw.wp_normalisasiterbobot
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_normalisasiterbobot`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_normalisasiterbobot` AS SELECT bobot.*,wp_jumbobot.jumlah,(bobot.value/wp_jumbobot.jumlah)
AS normalisasi_w FROM bobot,wp_jumbobot ;

-- Dumping structure for view metodesaw.wp_pangkat
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_pangkat`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_pangkat` AS SELECT vmatrixkeputusan.*,wp_normalisasiterbobot.normalisasi_w,
POW(vmatrixkeputusan.nilai,wp_normalisasiterbobot.normalisasi_w)
AS pangkat FROM vmatrixkeputusan,wp_normalisasiterbobot WHERE
wp_normalisasiterbobot.idkriteria=vmatrixkeputusan.idkriteria
GROUP BY vmatrixkeputusan.idmatrix ;

-- Dumping structure for view metodesaw.wp_sums
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_sums`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wp_sums` AS SELECT SUM(wp_nilais.nilaiS) AS jum FROM wp_nilais ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

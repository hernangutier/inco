-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 11, 2018 at 07:35 PM
-- Server version: 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 5.6.38-1+ubuntu16.04.1+deb.sury.org+2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inco`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_upd_recepciones_detail` (IN `idprod` INT)  MODIFIES SQL DATA
BEGIN

declare codprod,cnt,cnt_def integer;

DECLARE fin INTEGER DEFAULT 0;

DECLARE runners_cursor CURSOR FOR
   SELECT id_prod, cnt_recibida,cnt_defect FROM recepciones_detail where         						
   id_recep=idprod;
   
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
   
   OPEN runners_cursor;
  get_runners: LOOP
    FETCH runners_cursor INTO codprod, cnt,cnt_def;
    IF fin = 1 THEN
       LEAVE get_runners;
    END IF;

  UPDATE productos SET e_in_inv=e_in_inv+cnt-cnt_def WHERE id=codprod;


  END LOOP get_runners;

  CLOSE runners_cursor;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `almacenes`
--

CREATE TABLE `almacenes` (
  `id` int(11) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `almacenes`
--

INSERT INTO `almacenes` (`id`, `ref`, `descripcion`) VALUES
(1, '01', 'ALMACEN PRINCIPAL');

-- --------------------------------------------------------

--
-- Table structure for table `choferes`
--

CREATE TABLE `choferes` (
  `id` int(11) NOT NULL,
  `cedrif` varchar(20) DEFAULT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `direccion` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `choferes`
--

INSERT INTO `choferes` (`id`, `cedrif`, `nombres`, `direccion`) VALUES
(1, 'V9382864', 'CARLOS MIGUEL LOPEZ ALARCON', 'BARINAS');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `cedrif` varchar(20) DEFAULT NULL,
  `razon` varchar(200) DEFAULT NULL,
  `percent_transport` decimal(16,2) DEFAULT '0.00',
  `id_zona` int(11) DEFAULT NULL,
  `direccion` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `cedrif`, `razon`, `percent_transport`, `id_zona`, `direccion`) VALUES
(1, 'J40146316', 'IMPORTADORA TODOMAX, C.A', '0.02', 2, 'AV. CUZ PAREDES CRUCE CON CALLEJON COROMOTO  '),
(2, 'J40356322', 'MAXIAGRO DON PANCHO, C.A', '0.20', 2, 'AV. CUATRICENTENARIA'),
(6, 'J30403001', 'INVERSIONES LA SOLEDAD C.A.', '0.03', 1, 'SOCOPO '),
(7, 'J29517611', 'AGROFERRETERIA GUANOCO, C.A\r\n', NULL, 3, 'AV. JOSE MARIA VARGAS DESPUES DEL TERMINAL DEL PASAJEROS C.C.\r\n'),
(8, 'J40008128', 'AGROSUMINISTROS DEL LLANO C.A\r\n', NULL, 2, 'AV INDUSTRIAL S/N SECTOR AVENIDA INDUSTRIAL\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `comisiones`
--

CREATE TABLE `comisiones` (
  `id` int(11) NOT NULL,
  `ref` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `date_ini` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `id_chof` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comisiones`
--

INSERT INTO `comisiones` (`id`, `ref`, `descripcion`, `date_ini`, `date_fin`, `id_chof`) VALUES
(1, 'AGOST-01-2018', 'PAGO DE COMISIONES CORRESPONDIENTE A LA 1 ERA', '2018-08-01 00:00:00', '2018-08-15 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comisiones_dt`
--

CREATE TABLE `comisiones_dt` (
  `id` int(11) NOT NULL,
  `id_com` int(11) DEFAULT NULL,
  `nfact` varchar(20) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `base_i` varchar(45) DEFAULT NULL,
  `date_fact` datetime DEFAULT NULL,
  `comision` decimal(16,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comisiones_dt`
--

INSERT INTO `comisiones_dt` (`id`, `id_com`, `nfact`, `id_client`, `base_i`, `date_fact`, `comision`) VALUES
(1, 1, '2817', 1, '2300456789.89', NULL, '0.00'),
(2, 1, '2818', 2, '12345689.9', NULL, '0.00'),
(3, NULL, '', NULL, '', NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `ref` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id`, `descripcion`, `ref`) VALUES
(1, 'DECORACIÓN', '1'),
(2, 'HOGAR', '2'),
(3, 'FERRETERIA', '3'),
(4, 'CONSTRUCCIÓN', '4'),
(5, 'AGRO-INDUSTRIAL', '5');

-- --------------------------------------------------------

--
-- Table structure for table `grupos`
--

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `ref` varchar(3) DEFAULT NULL,
  `id_lin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grupos`
--

INSERT INTO `grupos` (`id`, `descripcion`, `ref`, `id_lin`) VALUES
(1, 'MECATES CORDELES Y DRIZAS', '300', 14),
(2, 'BOMBAS HIDRONEUMATICOS Y MOTORES ELECTRICOS', '501', 25),
(3, 'MATERIALES DE CERCADO', '531', 28),
(4, 'BIDONES SACOS ETC.', '530', 28),
(5, 'HERRAMIENTAS MANUALES', '502', 25),
(6, 'EQUIPOS Y ACCESORIOS MANUALES', '500', 25),
(7, 'ELECTROSOLDADOS', '460', 20),
(8, 'VARIOS', '402', 21),
(9, 'MALLAS DE CERCADO', '400', 21),
(10, 'ADITIVOS', '401', 21),
(11, 'ACCESORIOS PARA PLOMERIA', '450', 22),
(12, 'VALVULAS DE PLOMERIA', '451', 22),
(13, 'CONEXIONES AGUAS SERVIDAS', '410', 23),
(14, 'TUBERIAS DE AGUAS SERVIDAS', '411', 23),
(15, 'CONEXIONES AGUAS CALIENTES', '430', 24),
(16, 'CONEXIONES AGUAS BLANCAS', '420', 18),
(17, 'TUBERIAS Y CONEXIONES ELECTRICAS', '440', 19),
(18, 'CAJETINES', '444', 19),
(19, 'CUCHILLAS DE PORCELANA', '443', 19),
(20, 'ENCHUFES VARIOS', '448', 19),
(21, 'CEMENTOS Y CONCRETOS', '403', 21),
(22, 'ESTUCOS Y PASTAS PROFESIONALES', '100', 4),
(23, 'ARTICULOS DE PEZCA', '202', 11),
(24, 'BISAGRAS', '303', 14),
(25, 'ACCESORIOS DE JARDINERIA', '120', 1),
(26, 'PEGAMENTOS', '130', 2),
(27, 'CINTAS ESPECIALES DE EMBALAR', '131', 2),
(28, 'BOMBILLOS', '110', 3),
(29, 'FONDOS DE HERRERIA', '102', 4),
(30, 'SOLVENTES', '103', 4),
(31, 'PINTURA OLEO, CAUCHO Y MADERA', '101', 4),
(32, 'PEGAS EPOXICAS', '350', 12),
(33, 'PEGAMENTOS INSTANTANEOS', '351', 12),
(34, 'LIJAS', '330', 13),
(35, 'VARIOS', '302', 14),
(36, 'CLAVOS Y GRAPAS', '301', 14),
(37, 'DISCOS DE CORTE', '321', 15),
(38, 'ELECTRODOS Y ACCESORIOS', '320', 15),
(39, 'HERRAMIENTAS MANUALES', '341', 16),
(40, 'HERRAMIENTAS ELECTRICAS', '342', 16),
(41, 'CANDADOS', '311', 17),
(42, 'CERRADURAS DE TODOS TIPOS', '312', 17),
(43, 'LINEA BLANCA', '260', 5),
(44, 'KIT DE INSTALCIÓN WC Y LAVAMANOS', '221', 6),
(45, 'ENVACES, SILLAS, MESAS ETC.', '240', 7),
(46, 'ACCESORIOS DE COCINA', '210', 8),
(47, 'ACCESORIOS DE BAÑO', '211', 8),
(48, 'GRIFERIA DE BAÑOS', '212', 8),
(49, 'ORGANIZACION', '250', 9),
(50, 'DESINFECTANTES', '230', 10),
(51, 'LINTERNAS, LAMPARAS ETC.', '201', 11),
(52, 'CAVAS, HIELERAS Y TERMOS', '200', 11),
(53, 'CABLES Y CONDUCTORES', '449', 19),
(54, 'ARTICULOS ELECTRICOS', '441', 19),
(55, 'ACCESORIOS VARIOS DE ELECTRICIDAD', '442', 19),
(56, 'PROTECTORES DE VOLTAJE', '445', 19),
(57, 'SOCATES Y RECEPTACULOS', '446', 19),
(58, 'INTERRUPTORES, TOMAS Y BREAKERS', '447', 19),
(59, 'ACCESORIOS DE SEGURIDAD INDUSTRIAL', '510', 26),
(60, 'AYUDANTES DE COCINA', '261', 5);

-- --------------------------------------------------------

--
-- Table structure for table `inv_detail`
--

CREATE TABLE `inv_detail` (
  `id` int(11) NOT NULL,
  `id_master` int(11) DEFAULT NULL,
  `id_prod` int(11) DEFAULT NULL,
  `cnt` int(11) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inv_master`
--

CREATE TABLE `inv_master` (
  `id` int(11) NOT NULL,
  `fecha_ini` varchar(45) DEFAULT NULL,
  `ncontrol` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) NOT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inv_master`
--

INSERT INTO `inv_master` (`id`, `fecha_ini`, `ncontrol`, `descripcion`, `status`) VALUES
(1, NULL, NULL, 'INVENTARIO DE AUDITORIA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lineas`
--

CREATE TABLE `lineas` (
  `id` int(11) NOT NULL,
  `id_dep` int(11) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lineas`
--

INSERT INTO `lineas` (`id`, `id_dep`, `ref`, `descripcion`) VALUES
(1, 1, '12', 'JARDINERIA'),
(2, 1, '13', 'PEGAMENTOS Y CINTAS'),
(3, 1, '11', 'ILUMINACIÓN'),
(4, 1, '10', 'PINTURAS'),
(5, 2, '26', 'ARTEFACTOS DEL HOGAR'),
(6, 2, '22', 'PLOMERIA Y GRIFERIAS'),
(7, 2, '24', 'ARTICULOS PLASTICOS  DEL HOGAR'),
(8, 2, '21', 'BAÑOS Y COCINAS'),
(9, 2, '25', 'MUEBLES Y ACCESORIOS'),
(10, 2, '23', 'LIMPIEZA'),
(11, 2, '20', 'CAMPING'),
(12, 3, '35', 'PEGAMENTOS Y CEMENTO PLASTICO'),
(13, 3, '33', 'ACCESORIOS HERRAMIENTAS Y MAQ.'),
(14, 3, '30', 'UNION Y SUJECIÓN'),
(15, 3, '32', 'HERRERIA Y ABRACIVOS'),
(16, 3, '34', 'HERRAMIENTAS'),
(17, 3, '31', 'CERRAJERIA'),
(18, 4, '42', 'AGUAS BLANCAS'),
(19, 4, '44', 'ELECTRICIDAD'),
(20, 4, '46', 'HERRERIA'),
(21, 4, '40', 'MATERIALES DE CONSTRUCCIÓN'),
(22, 4, '45', 'PLOMERIA EN GENERAL'),
(23, 4, '41', 'AGUAS SERVIDAS'),
(24, 4, '43', 'AGUAS CALIENTES'),
(25, 5, '50', 'HERRAMIENTAS Y EQUIPOS MANUALES'),
(26, 5, '51', 'SEGURIDAD INDUSTRIAL'),
(27, 5, '52', 'EQUIPOS ELECT. Y COMBUSTION'),
(28, 5, '53', 'INSUMOS AGROINDUSTRIALES');

-- --------------------------------------------------------

--
-- Table structure for table `lotes`
--

CREATE TABLE `lotes` (
  `id` int(11) NOT NULL,
  `id_recep` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `cnt_empaque` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lotes`
--

INSERT INTO `lotes` (`id`, `id_recep`, `id_prod`, `cnt_empaque`) VALUES
(1, 15, 110, 60),
(2, 15, 110, 60),
(3, 15, 110, 60),
(4, 15, 110, 20),
(5, 15, 108, 19),
(6, 15, 109, 6),
(7, 15, 109, 6),
(8, 15, 109, 6),
(9, 15, 109, 6),
(10, 15, 109, 6);

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`id`, `descripcion`) VALUES
(1, '(SPUD)'),
(2, '1'),
(3, '3M'),
(4, '4'),
(5, 'ACNE'),
(6, 'ARCA'),
(7, 'AYA'),
(8, 'BELLOTA'),
(9, 'BOSCH'),
(10, 'CABEL'),
(11, 'CAZ'),
(12, 'CESTIPLAST'),
(13, 'CINDU'),
(14, 'CISA'),
(15, 'CLASI LAX'),
(16, 'COBRA'),
(17, 'CORAL'),
(18, 'DECOCAR'),
(19, 'DEDOCAR'),
(20, 'DIESEL TOOLD'),
(21, 'DYNA'),
(22, 'ELEFANTE'),
(23, 'ELITE LIGH'),
(24, 'ESPESOR 2.769  mm BLIS'),
(25, 'EXXEL'),
(26, 'FAUCI'),
(27, 'FERMETAL'),
(28, 'FESTA'),
(29, 'FM'),
(30, 'GENERAL'),
(31, 'H.L'),
(32, 'HOGAR'),
(33, 'IMPLAVEN'),
(34, 'IMSA'),
(35, 'INDKRETTO'),
(36, 'INPLAVEN'),
(37, 'ITALIANO'),
(38, 'JIALITE'),
(39, 'LAMINADOS'),
(40, 'LEWIZ'),
(41, 'LINCE'),
(42, 'LINCOLN'),
(43, 'M.T'),
(44, 'MAESTRO PROFECIONALES'),
(45, 'MANAPLAS'),
(46, 'MANPICA'),
(47, 'MARINE'),
(48, 'MAXI TAPE'),
(49, 'MAXIMETAL'),
(50, 'MEGA POWER'),
(51, 'METCO'),
(52, 'NEW KNIFE SWITCH'),
(53, 'OPTILINE'),
(54, 'PETROL'),
(55, 'PITBULL'),
(56, 'POPOTAMO'),
(57, 'PRACTI BOX'),
(58, 'PREMIUM 40LTS'),
(59, 'PRO-LIFE'),
(60, 'PROLIFE'),
(61, 'RIFOX'),
(62, 'S-Q'),
(63, 'SAABO'),
(64, 'SACO'),
(65, 'SAM'),
(66, 'SAN'),
(67, 'SIRAGON'),
(68, 'SISALARA'),
(69, 'SOLD'),
(70, 'SP'),
(71, 'SPEED'),
(72, 'SPIDELECTRI'),
(73, 'SQ'),
(74, 'STANDARD 55 LTS'),
(75, 'THHN\\/THN12'),
(76, 'TIGER'),
(77, 'TITAN'),
(78, 'TOYO'),
(79, 'TREFYMACA'),
(80, 'TREXA'),
(81, 'TRICAL'),
(82, 'TRIVOL'),
(83, 'TROEN'),
(84, 'TUBRICA'),
(85, 'TUCSON TOOLS'),
(86, 'UNIPLAS'),
(87, 'UNIT PLAS'),
(88, 'USA'),
(89, 'VICSON'),
(90, 'VIDON'),
(91, 'VINIL'),
(92, 'GLOBAL'),
(93, 'FLETE'),
(94, 'BELLPOWER'),
(95, 'BIDON'),
(97, 'INDUFERCA'),
(98, 'PROTEC'),
(99, 'MAXCAM'),
(100, 'VERT'),
(101, 'H&H'),
(102, 'SEABOOTS'),
(103, 'BAHCO'),
(104, 'INTERFLEX'),
(105, 'BOSSMAN'),
(106, 'VENCERAMICA'),
(107, 'MAXICABLE'),
(108, 'SPRAYER'),
(109, 'FIRM'),
(110, 'CARBORUNDUN'),
(111, 'TESCO'),
(112, 'PROTEKTOR'),
(113, 'CABLECO'),
(114, 'KNIFE'),
(115, 'PLASTICOS DE EMPAQUE, C.A.'),
(116, 'PLASTICOS BORECA'),
(117, 'SUPRACAL'),
(118, 'IND. DE CORDELES Y FILAMENTOS, C.A.'),
(119, 'DIAMOND'),
(120, 'CLASIC LUX'),
(121, 'TICINO'),
(122, 'CASTOR');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `ref` varchar(45) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `und` varchar(45) DEFAULT NULL,
  `costo` decimal(16,4) DEFAULT '0.0000',
  `percent_utilidad` decimal(16,4) DEFAULT '30.0000',
  `pvp` decimal(16,4) DEFAULT '0.0000',
  `is_public` int(11) DEFAULT '1',
  `id_marca` int(11) DEFAULT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `min_venta` int(11) DEFAULT NULL,
  `e_in_inv` int(11) DEFAULT '0',
  `e_out_inv` int(11) DEFAULT '0',
  `id_ubic` int(11) DEFAULT NULL,
  `ref_fab` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `ref`, `descripcion`, `und`, `costo`, `percent_utilidad`, `pvp`, `is_public`, `id_marca`, `id_grupo`, `min_venta`, `e_in_inv`, `e_out_inv`, `id_ubic`, `ref_fab`) VALUES
(8, '440-001', 'TUBO PVC 1/2*3MTS CONDUIT BLANCO FESTA\r\n', 'UND', '13455.8900', '30.0000', '45.8900', 0, 28, 17, 6, 0, 0, NULL, NULL),
(9, '440-002', 'TUBO PVC 3/4*3MTS CONDUIT BLANCO FESTA\r\n', 'UND', '1345.9000', '30.0000', '45.8700', 0, 28, 17, 6, 0, 0, NULL, NULL),
(10, '440-005', 'TUBO PVC 1"*3MTS CONDUIT BLANCO FESTA\r\n', 'UND', '5677.0000', '30.0000', '0.0000', 0, 28, 17, 5, 0, 0, NULL, NULL),
(11, '440-006', 'TUBO PVC 1"1/2*3MTS CONDUIT BLANCO FESTA\r\n', NULL, '1230.9800', '30.0000', '0.0000', 0, 28, 17, NULL, 0, 0, NULL, NULL),
(12, '440-003', 'CURVA PVC 1/2*90 CONDUIT BLANCO FESTA\r\n', 'UND', '345.8900', '30.0000', '0.0000', 0, 28, 17, 25, 0, 0, NULL, NULL),
(13, '440-004', 'CURVA PVC 3/4*90 CONDUIT BLANCO FESTA\r\n', NULL, '3456.0000', '30.0000', '0.0000', 0, 28, 17, NULL, 0, 0, NULL, NULL),
(14, '440-007', 'CURVA PVC 1"*90 CONDUIT BLANCO FESTA\r\n', 'UND', '1459.0900', '30.0000', '0.0000', 0, 28, 17, 100, 0, 0, NULL, NULL),
(15, '440-008', 'CURVA PVC 1 1/2*90 CONDUIT BLANCO FESTA\r\n', NULL, '1345.9000', '30.0000', '0.0000', 0, 28, 17, NULL, 0, 0, NULL, NULL),
(16, '444-006', 'CAJETIN 4*2 PLASTICO TRANSLUCIDO FESTA\r\n', 'UND', '345.0000', '30.0000', '0.0000', 0, 28, 18, 6, 0, 0, NULL, NULL),
(17, '444-007', 'CAJETIN OCTOGONAL PLÁSTICO TRASLUCIDO FESTA\r\n', 'UND', '4000.0000', '30.0000', '0.0000', 0, 28, 18, 25, 0, 0, NULL, NULL),
(19, '501-002', 'BOMBA DE AGUA 1/2 HP LINCE\r\n', 'UND', '1345.0000', '30.0000', '0.0000', 0, 41, 2, 1, 0, 0, NULL, NULL),
(20, '341-001', 'MACHETE RULA 22" BELLOTA\r\n', 'UND', '860.0000', '30.0000', '874.8900', 0, 8, 39, 3, 0, 0, NULL, NULL),
(21, '301-014', 'GRAPAS GALV 1*9 (24.5KG) VICSON\r\n', 'KG.', '3400.0000', '30.0000', '0.0000', 0, 89, 1, 24, 0, 0, NULL, NULL),
(22, '444-005', 'CAJETIN RECT. 4"*2"COMBINADO 1/2"3/4"INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 36, 18, 6, 0, 0, NULL, NULL),
(23, '440-009', 'TUBO PVC CONDUIT 1/2"*3MTS (BLANCO) INPLAVEN\r\n', 'UND', '1300.0000', '30.0000', '0.0000', 0, 36, 17, 6, 0, 0, NULL, NULL),
(24, '440-012', 'TUBO PVC CONDUIT 3/4"*3MTS (BLANCO) INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 36, 17, 6, 0, 0, NULL, NULL),
(25, '420-005', 'CODO 1/2*45° AGUA BLANCA INPLAVEN', 'UND', '0.0000', '30.0000', '0.0000', 0, 36, 16, 6, 0, 0, NULL, NULL),
(26, '430-002', 'CODO 3/4 *45° AGUAS CALIENTES TUBRICA', 'UND', '340.9000', '30.0000', '0.0000', 0, 84, 16, 6, 0, 0, NULL, NULL),
(27, '341-017', 'HOJA PARA SEGUETA BAHCO 24 DIENTES', 'UND', '0.0000', '30.0000', '149.2500', 1, 103, 5, 10, 100, 0, NULL, NULL),
(28, '341-018', 'HOJA PARA SEGUETA BAHCO 18 DIENTES', 'UND', '0.0000', '30.0000', '149.2500', 1, 103, 5, 10, 100, 0, NULL, NULL),
(29, '446-003', 'RECEPTACULO DE BAKELITA 4-1/2" FERMETAL', 'UND', '0.0000', '30.0000', '178.7700', 1, 27, 57, 10, 0, 0, 1, NULL),
(30, '448-001', 'ENCHUFE DE GOMA INDS.TIPO 101 FERMETAL', 'UND', '0.0000', '30.0000', '134.6000', 1, 27, 20, 20, 0, 0, 1, NULL),
(31, '448-003', 'ENCHUFE S/TIERRA 15A AMAR VINIL', 'UND', '0.0000', '30.0000', '213.3100', 1, 27, 20, 20, 0, 0, 1, NULL),
(32, '448-002', 'ENCHUFE S/TIERR METALICO AMARILLO 15', 'UND', '0.0000', '30.0000', '238.3500', 1, 27, 20, 25, 0, 0, 1, NULL),
(33, '500-001', 'PULVERIZADOR MANUAL TIP MORRAL CAP 16LTS VERT', 'UND', '0.0000', '30.0000', '1951.5100', 0, 100, 2, 6, 0, 0, NULL, NULL),
(34, '501-003', 'BOMBA DE AGUA 1/2 HP MEGA POWER\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 50, 2, 1, 0, 0, NULL, NULL),
(35, '450-012', 'TEFLON 1/2 DIESEL TOOLS\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 20, 2, 24, 0, 0, NULL, NULL),
(36, '451-002', 'LLAVE D/CHORRO PVC 1/2" PLASTICA GENERICA\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 30, 12, 6, 0, 0, NULL, NULL),
(37, '451-003', 'LLAVE D/CHORRO PVC 1/2 "PLASTICA FERMETAL\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 12, 6, 0, 0, NULL, NULL),
(38, '300-099', 'CAL HIDRATADA 8 KG SUPRACAL', 'SACO', '0.0000', '30.0000', '0.0000', 0, 117, 12, 6, 840, 0, NULL, NULL),
(39, '443-009', 'CUCHILLA DE 2 PASE 3X200 AMP FERMETAL', 'UND.', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(40, '443-008', 'CUCHILLA DE 2 PASE 3X100 AMP FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(41, '443-007', 'CUCHILLA DE 2 PASE 3X60 AMP FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(42, '443-006', 'CUCHILLA DE 2 PASE 3X30 AMP FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(43, '443-005', 'CUCHILLA DE 2 PASES 2X100 AMP FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(44, '443-004', 'CUCHILLA DE 2 PASE 2X60 AMP FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(45, '443-003', 'CUCHILLA DE 1 PASE 2X100 AMP FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(46, '443-002', 'CUCHILLA DE 1 PASE 2X60 AMP FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(47, '443-001', 'CUCHILLA DE 1 PASE 2X30 AMP FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 19, 1, 0, 0, 1, NULL),
(48, '443-010', 'CUCHILLA 1PASE 3X30 AMP C/FUSIBLE NEW KNIFE', 'UND', '0.0000', '30.0000', '0.0000', 0, 52, 19, 1, 0, 0, 1, NULL),
(49, '443-012', 'CUCHILLA DE 1 PASE 2X30 AMP KNIFE', 'UND', '0.0000', '30.0000', '0.0000', 0, 52, 19, 1, 0, 0, 1, NULL),
(50, '200-017', 'CAVA 11,35 LT ARTIC AMERICANA DECOCAR\r\n', 'UND', '1564.2000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, 1, NULL),
(51, '200-009', 'CAVA 19 LTS (20QT) ARCTIC DECOCAR', 'UND', '2545.4700', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, 1, NULL),
(52, '200-010', 'CAVA 30 LTS (32QT) ARTIC JUNIOR DECOCAR', 'UND', '2300.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, 1, NULL),
(53, '200-012', 'CAVA 40 LTS ICE ROLLER PREMIUM DECOCAR', 'UND', '3456.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, 1, NULL),
(54, '200-013', 'CAVA 40 LTS ICE ROLLER STAN DECOCAR\r\n', 'UND', '3400.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(55, '200-011', 'CAVA 32LTS (34QT) ARTIC DECOCAR\r\n', 'UND', '3566.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(56, '200-014', 'CAVA 46 LTS (48QT) ARTIC DECOCAR\r\n', 'UND', '3456.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(57, '200-016', 'CAVA 46 LTS (48QT) MARYNE ARTIC DECOCAR\r\n', 'UND', '3400.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(58, '200-004', 'TERMO POPOTAMO 2 LTS DECOCAR\r\n', 'UND', '3400.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(59, '200-005', 'TERMO POPOTAMO 4 TLS DECOCAR\r\n', 'UND', '3400.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(60, '200-007', 'TERMO POPOTAMO 7 LTS DECOCAR\r\n', 'UND', '3500.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(61, '200-008', 'TERMO POPOTAMO 8 LTS DECOCAR\r\n', 'UND', '5003.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(62, '200-001', 'TERMO ARTIC 4,7 LTS DECOCAR\r\n', 'UND', '4000.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(63, '200-002', 'TERMO POPOTAMO 15LTS DECOCAR\r\n', 'UND', '5666.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(64, '200-003', 'TERMO POPOTAMO 19 LTS DECOCAR\r\n', 'UND', '3456.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(65, '200-006', 'TERMO POPOTAMO 44 LTS DECOCAR\r\n', 'UND', '2400.0000', '30.0000', '0.0000', 0, 18, 52, 1, 0, 0, NULL, NULL),
(66, '320-001', 'ELECTRODO 3.32*6013 MAXI-PREMIUM\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 49, 38, 1, 0, 0, NULL, NULL),
(67, '321-001', 'DISCO P/H 4.1/2x2.0 MM U. FINO PREMIER CARBORUNDUN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 110, 38, 1, 0, 0, NULL, NULL),
(68, '321-005', 'DISCO P/HIERRO 7x2.0 MM U. FINO PREMIER CARBORUNDUN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 110, 37, 1, 0, 0, NULL, NULL),
(69, '321-003', 'DISCO P/ HIERRO TRONZADORA 14" (6UNI)\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 110, 37, 1, 0, 0, NULL, NULL),
(70, '446-001', 'SOCATE GOMA/CERAMICA MAXIMETAL.\r\n', 'UND', '0.0000', '30.0000', '130.0000', 1, 49, 57, 10, 0, 0, NULL, NULL),
(71, '240-018', 'CAJA P/ HERRAMIENTAS 14" BOSSMAN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 105, 49, 1, 0, 0, NULL, NULL),
(72, '240-019', 'CAJA P/ HERRAMIENTAS 19" BOSSMAN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 105, 49, 12, 0, 0, NULL, NULL),
(73, '449-009', 'ALAMBRE GALV G. P/C E. C-14 (2,11M) VICSON\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 89, 53, 1, 0, 0, NULL, NULL),
(74, '449-010', 'ALAMBRE GALV G. P/C E. C-12 (2,77M) VICSON\r\n', 'ROLLO', '0.0000', '30.0000', '0.0000', 0, 89, 53, 1, 0, 0, NULL, NULL),
(75, '446-004', 'SOCATE DE PORCELANA C/FORRO GOMA ROSCA E27', 'UND', '0.0000', '30.0000', '32.2000', 1, 100, 57, 1, 0, 0, NULL, NULL),
(76, '341-007', 'PALA DRAGA CON MANGO DE MADERA DE 1.5MTS H&H', 'UND', '0.0000', '30.0000', '2840.0800', 0, 101, 5, 1, 0, 0, NULL, NULL),
(77, '120-001', 'MANGUERA CULEBRA 1/2"X100M BELL POWER\r\n', 'ROLLO', '0.0000', '30.0000', '0.0000', 0, 94, 25, 1, 0, 0, NULL, NULL),
(78, '450-013', 'TEFLON 3/4 19MM*15M\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 30, 11, 10, 0, 0, NULL, NULL),
(79, '451-007', 'LLAVE BOLA PVC 1/2" SACO\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 64, 12, 1, 0, 0, NULL, NULL),
(80, '450-001', 'SIFON 1 1/2" FLEXIBLE SACO\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 64, 11, 1, 0, 0, NULL, NULL),
(81, '450-003', 'SIFON 1 1/4 LAVAMANO\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 30, 11, 6, 0, 0, NULL, NULL),
(82, '447-001', 'TOMA CORRIENTE SUPERFIC TRIPLE EXXEL', 'UND', '0.0000', '30.0000', '0.0000', 0, 25, 58, 10, 0, 0, 1, NULL),
(83, '447-002', 'TOMA DOBLE POLARIZADA 270 SACO', 'UND', '0.0000', '30.0000', '0.0000', 0, 64, 58, 10, 0, 0, 1, NULL),
(84, '447-003', 'TOMA SENC. EMB. C/POLO A TIERRA IV SPIDERELECTRIC', 'UND', '0.0000', '30.0000', '0.0000', 0, 72, 58, 10, 0, 0, 1, NULL),
(85, '420-001', 'CODO DE 1/2*90 AGUAS/ BLANCAS INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 36, 16, 1, 0, 0, NULL, NULL),
(86, '420-003', 'ANILLO 1/2 AGUA BLANCA INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 36, 16, 10, 0, 0, NULL, NULL),
(87, '420-002', 'ANILLO 1" AGUA BLANCA INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '0.0000', 0, 36, 16, 10, 0, 0, NULL, NULL),
(88, '420-008', 'TEE 1" AGUA BLANCA P/PEGAR INPLAVEN', 'UND', '0.0000', '30.0000', '0.0000', 0, 36, 16, 1, 0, 0, NULL, NULL),
(89, '410-015', 'ANILLO 2" AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '60.3700', 0, 36, 13, 1, 0, 0, NULL, NULL),
(90, '410-016', 'ANILLO 3" AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '87.2000', 0, 36, 13, 1, 0, 0, NULL, NULL),
(91, '410-017', 'ANILLO 4" AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '161.0000', 0, 36, 13, 1, 0, 0, NULL, NULL),
(92, '410-018', 'CODO 2"*90 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '85.3100', 0, 36, 13, 1, 0, 0, NULL, NULL),
(93, '410-002', 'CODO 3"*90° AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '187.6900', 0, 36, 13, 1, 0, 0, NULL, NULL),
(94, '410-003', 'CODO 4"*90° AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '364.0000', 0, 36, 13, 1, 0, 0, NULL, NULL),
(95, '410-004', 'CODO 3"*45° AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '164.9400', 0, 36, 13, 1, 0, 0, NULL, NULL),
(96, '300-008', 'CORDEL PP30  X 12 UNID. FIL', 'UND', '0.0000', '30.0000', '0.0000', 0, 118, 1, 12, 72, 0, NULL, NULL),
(97, '410-005', 'TEE 2*2 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '136.5000', 0, 36, 13, 10, 0, 0, NULL, NULL),
(98, '410-006', 'TEE 3*3 AGUAS NEGRAS INPLAVEN (40UNID)', 'UND', '0.0000', '30.0000', '341.2500', 0, 36, 13, 40, 0, 0, NULL, NULL),
(99, '410-007', 'TEE 4*4 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '511.8700', 0, 36, 13, 1, 0, 0, NULL, NULL),
(100, '410-008', 'TEE 4*2 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '455.0000', 0, 36, 13, 1, 0, 0, NULL, NULL),
(101, '410-009', 'YEE 2*2 AGUAS NEGRAS INPLAVEN (50UNID)', 'UND', '0.0000', '30.0000', '136.5000', 0, 36, 13, 1, 0, 0, NULL, NULL),
(102, '410-010', 'YEE 4*4 AGUAS NEGRAS INPLAVEN (10UNID)', 'UND', '0.0000', '30.0000', '716.6200', 0, 36, 13, 1, 0, 0, NULL, NULL),
(103, '410-011', 'YEE 4 A 2 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '227.5000', 0, 36, 13, 1, 0, 0, NULL, NULL),
(104, '410-012', 'CODO DE 2*45 PVC AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '85.3100', 0, 36, 13, 1, 0, 0, NULL, NULL),
(105, '410-013', 'CODO DE 2*90 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '0.0000', 0, 36, 13, 1, 0, 0, NULL, NULL),
(106, '446-002', 'RECEPTACULO DE PORC. 4" E-27 CLASI LAX', 'UND', '0.0000', '30.0000', '260.0200', 1, 15, 57, 10, 0, 0, 1, NULL),
(107, '447-007', 'TOMA STATNDAR RECETACULO SIMPLE FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 58, 10, 0, 0, NULL, NULL),
(108, '110-006', 'BOMBILLO LUZ MIXTA 160W 330 E27 CLASIC LUX', 'UND', '0.0000', '30.0000', '579.3500', 1, 120, 28, 3, 19, 0, NULL, NULL),
(109, '261-001', 'MOLINO  MANUAL DE METAL DIAMOND', 'UND', '0.0000', '30.0000', '2227.5000', 1, 119, 60, 1, 30, 0, NULL, NULL),
(110, '230-004', 'JABON PARA LAVAR BEBE 200GR. GLOBAL', 'UND', '0.0000', '30.0000', '124.2500', 1, 92, 50, 20, 200, 0, NULL, NULL),
(111, '447-004', 'INTERRUPTOR SUPERF. TIPO 52 FERMETAL', 'UND', '0.0000', '30.0000', '115.6000', 1, 27, 58, 12, 0, 0, 1, NULL),
(112, '447-005', 'INTERRUPTOR B TICINO 602G', 'UND', '0.0000', '30.0000', '0.0000', 0, 30, 58, 10, 0, 0, 1, NULL),
(113, '447-006', 'INTERRUPTOR B TICINO 602B', 'UND', '0.0000', '30.0000', '0.0000', 0, 30, 58, 10, 0, 0, 1, NULL),
(114, '110-002', 'BOMBILLO INCANDESCENTE 100W\r\n', 'UND', '0.0000', '30.0000', '53.5500', 0, 30, 28, 10, 0, 0, NULL, ''),
(115, '110-001', 'BOMBILLO ESPIRAL 30W JALITE\r\n', 'UND', '0.0000', '30.0000', '271.2100', 0, 38, 28, 3, 0, 0, NULL, ''),
(116, '201-002', 'LINTERNA PLAST/RECAR 1 LED TIGER\r\n', 'UND', '0.0000', '30.0000', '432.8100', 0, 76, 51, 3, 0, 0, NULL, ''),
(117, '201-003', 'LINTERNA PLAST/RECAR 5 LED TIGER\r\n', 'UND', '0.0000', '30.0000', '385.8600', 0, 76, 51, 3, 0, 0, NULL, ''),
(118, '201-001', 'LINTERNA 1LED * 12 CM RECARGABLE VERT\r\n', 'UND', '0.0000', '30.0000', '442.9200', 0, 100, 51, 3, 0, 0, NULL, ''),
(119, '130-001', 'MASILLA EPOXICA EPOMONT (PEGA CANOA)\r\n', 'UND', '0.0000', '30.0000', '2267.9000', 0, 30, 26, 1, 0, 0, NULL, ''),
(120, '130-003', 'PEGA-MIX NEGRA 24X1 70gr.\r\n', 'UND', '0.0000', '30.0000', '158.9400', 0, 30, 26, 24, 0, 0, NULL, ''),
(121, '130-006', 'PEGA LOKA 3GR (42UNID)\r\n', 'UND', '0.0000', '30.0000', '36.9500', 0, 30, 26, 42, 0, 0, NULL, ''),
(122, '442-004', 'EXTENSION DOMEST. 2X18 4,50 MT FERMETAL', 'UND', '0.0000', '30.0000', '528.7700', 1, 27, 55, 6, 0, 0, NULL, 'EXT-07'),
(123, '130-005', 'PEGA SOLDADURA P/SIST C-PVC 1/32 TUBRICA\r\n', 'UND', '0.0000', '30.0000', '320.0000', 0, 84, 26, 24, 0, 0, NULL, ''),
(124, '341-002', 'MACHETE BOLO C/MANGO PLÁSTICO DE 22" VERT\r\n', 'UND', '0.0000', '30.0000', '500.3100', 0, 100, 39, 3, 0, 0, NULL, ''),
(125, '341-003', 'MACHETE CLASICO C/MANGO PLÁSTICO DE 22" VERT\r\n', 'UND', '0.0000', '30.0000', '539.9400', 0, 100, 39, 3, 0, 0, NULL, ''),
(126, '311-007', 'CANDADO 30MM CISA\r\n', 'UND', '0.0000', '30.0000', '721.8100', 0, 14, 41, 1, 0, 0, NULL, ''),
(127, '311-008', 'CANDADO 40MM CISA\r\n', 'UND', '0.0000', '30.0000', '915.5400', 0, 14, 41, 1, 0, 0, NULL, ''),
(128, '311-009', 'CANDADO 50MM CISA\r\n', 'UND', '0.0000', '30.0000', '1248.5500', 0, 14, 41, 1, 0, 0, NULL, ''),
(129, '311-010', 'CANDADO 60MM CISA\r\n', 'UND', '0.0000', '30.0000', '1885.9600', 0, 14, 41, 1, 0, 0, NULL, ''),
(130, '311-001', 'CANDADO 40MM CASTOR\r\n', 'UND', '0.0000', '30.0000', '191.1300', 0, 122, 41, 1, 0, 0, NULL, ''),
(131, '311-004', 'CANDADO LATONADO EN BRONCE DE 63MM VERT\r\n', 'UND', '0.0000', '30.0000', '493.9300', 0, 100, 41, 1, 0, 0, NULL, ''),
(132, '330-001', 'LIJA 120 PITBULL\r\n', 'PLIEGO', '0.0000', '30.0000', '32.0000', 0, 55, 34, 50, 0, 0, NULL, ''),
(133, '330-004', 'LIJA 120 X 50 UND. M.T.\r\n', 'PLIEGO', '0.0000', '30.0000', '32.0000', 0, 43, 34, 100, 0, 0, NULL, ''),
(134, '341-012', 'LIMA BAHCO PARA MOTOSIERRA 3/16\r\n', 'UND', '0.0000', '30.0000', '140.0000', 0, 103, 39, 6, 0, 0, NULL, ''),
(135, '341-013', 'LIMA BAHCO PARA MOTOSIERRA 5/32\r\n', 'UND', '0.0000', '30.0000', '140.0000', 0, 103, 39, 6, 0, 0, NULL, ''),
(136, '341-014', 'LIMA BAHCO PARA MOTOSIERRA 7/32\r\n', 'UND', '0.0000', '30.0000', '140.0000', 0, 103, 39, 6, 0, 0, NULL, ''),
(137, '102-008', 'FONDO BLANCO 1G  MANPICA\r\n', 'GALON', '0.0000', '30.0000', '2636.3600', 0, 46, 29, 4, 0, 0, NULL, ''),
(138, '102-005', 'FONDO BLANCO 1/4G  MANPICA', 'UND', '0.0000', '30.0000', '842.8500', 0, 46, 29, 12, 0, 0, NULL, ''),
(139, '102-002', 'FONDO NEGRO 1G.  MANPICA', 'GALON', '0.0000', '30.0000', '2092.0000', 0, 46, 29, 4, 0, 0, NULL, ''),
(140, '102-006', 'FONDO NEGRO 1/4G MANPICA', '1/4 GALON', '0.0000', '30.0000', '657.3200', 0, 46, 29, 12, 0, 0, NULL, ''),
(141, '102-004', 'FONDO GRIS 1G  MANPICA', 'GALON', '0.0000', '30.0000', '2227.2700', 0, 46, 29, 4, 0, 0, NULL, ''),
(142, '102-003', 'FONDO GRIS 1/4 G  MANPICA', '1/4 GALON', '0.0000', '30.0000', '728.5700', 0, 46, 29, 12, 0, 0, NULL, ''),
(143, '102-009', 'FONDO MINIO 1G MANPICA', 'GALON', '0.0000', '30.0000', '2717.3300', 0, 46, 29, 4, 0, 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `rif` varchar(20) DEFAULT NULL,
  `razon` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id`, `rif`, `razon`) VALUES
(1, 'J304030012', 'FERRE AGRO EL PILAR C.A.'),
(2, 'J6776776', 'MAXI-FER C.A.'),
(3, 'V213323424', 'FEBECA C.A.'),
(6, 'J000819963', 'PRO-LIFE, C.A'),
(7, 'J000654042', 'TRICAL DE VENEZUELA, C.A.'),
(8, 'j085039970', 'SUPRACAL,  C.A.'),
(9, 'J000384118', 'VICSON, S.A.'),
(10, 'J000472912', 'FERRETERIA EL LLANO, C.A'),
(11, 'J406709247', 'FERRETERIA BELMERY, C.A.'),
(12, 'J303600115', 'DISTRIBUIDORA LOS GAVILANES, C.A.'),
(13, 'J298147733', 'PROTEC C.A.'),
(14, 'J409095185', 'INVERSIONES ICN98 , C.A.');

-- --------------------------------------------------------

--
-- Table structure for table `recepcion`
--

CREATE TABLE `recepcion` (
  `id` int(11) NOT NULL,
  `nfact` varchar(20) DEFAULT NULL,
  `id_prov` int(11) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_recive` datetime NOT NULL,
  `observaciones` varchar(400) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `is_incidencia` int(11) DEFAULT '0',
  `ncontrol` int(11) NOT NULL,
  `tipo` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recepcion`
--

INSERT INTO `recepcion` (`id`, `nfact`, `id_prov`, `date_creation`, `date_recive`, `observaciones`, `status`, `is_incidencia`, `ncontrol`, `tipo`) VALUES
(7, '56656', 1, NULL, '2018-10-02 00:00:00', NULL, 2, 0, 1, 0),
(8, '455455', 6, NULL, '2018-10-04 00:00:00', NULL, 2, 0, 2, 0),
(9, '78788', 3, NULL, '2018-10-02 00:00:00', NULL, 2, 0, 3, 0),
(10, '52168', 8, NULL, '2018-10-05 00:00:00', 'RECEPCION DE 640 SACOS DE CAL HIDRATADA 8 KG.', 1, 0, 4, 0),
(11, '52169', 8, NULL, '2018-10-05 00:00:00', 'RECEPCION DE 200 SACOS DE CAL HIDRATADA 8 KG.', 1, 0, 5, 0),
(12, '8591', 11, NULL, '2018-10-10 00:00:00', 'EN ESPERA DE RECEPCION DE PRODUCTOS', 0, 0, 6, 0),
(13, '81824', 12, NULL, '2018-10-10 00:00:00', 'SIN INCIDENCIAS', 1, 0, 7, 0),
(14, '5738', 13, NULL, '2018-10-10 00:00:00', 'HOJAS DE SEGUETA 18 Y 24 DIENTES 100 C/ARTICULO', 1, 0, 8, 0),
(15, '8712', 14, NULL, '2018-10-11 00:00:00', 'BOMBILLO CLASIC LUX (1) UNIDAD DEFECTUOSA', 1, 1, 9, 0);

--
-- Triggers `recepcion`
--
DELIMITER $$
CREATE TRIGGER `recepcion_BEFORE_INSERT` BEFORE INSERT ON `recepcion` FOR EACH ROW BEGIN
  set new.ncontrol=(select count(id) + 1 from recepcion);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `recepcion_BEFORE_UPDATE` BEFORE UPDATE ON `recepcion` FOR EACH ROW BEGIN
 if (new.status=1) THEN
	CALL  fc_upd_recepciones_detail(new.id);
 END IF;
 
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recepciones_detail`
--

CREATE TABLE `recepciones_detail` (
  `id` int(11) NOT NULL,
  `id_prod` int(11) DEFAULT NULL,
  `cnt_facturada` int(11) NOT NULL,
  `cnt_recibida` int(11) NOT NULL,
  `id_recep` int(11) DEFAULT NULL,
  `cnt_defect` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recepciones_detail`
--

INSERT INTO `recepciones_detail` (`id`, `id_prod`, `cnt_facturada`, `cnt_recibida`, `id_recep`, `cnt_defect`) VALUES
(1, 38, 640, 640, 10, 0),
(3, 38, 200, 200, 11, 0),
(4, 75, 100, 1, 12, 0),
(5, 76, 20, 1, 12, 0),
(7, 96, 72, 72, 13, 0),
(8, 27, 100, 100, 14, 0),
(9, 28, 100, 100, 14, 0),
(10, 108, 20, 20, 15, 1),
(11, 109, 30, 30, 15, 0),
(12, 110, 200, 200, 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id` int(11) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_alm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ubicaciones`
--

INSERT INTO `ubicaciones` (`id`, `ref`, `descripcion`, `id_alm`) VALUES
(1, 'JP1', 'JAULA PANEL 1 ', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_grupos`
--
CREATE TABLE `vw_grupos` (
`id` int(11)
,`grupo` varchar(49)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_lineas`
--
CREATE TABLE `vw_lineas` (
`id` int(11)
,`descripcion` varchar(311)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_productos`
--
CREATE TABLE `vw_productos` (
`id` int(11)
,`ref` varchar(45)
,`descripcion` varchar(400)
,`tostring` varchar(446)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_providers`
--
CREATE TABLE `vw_providers` (
`id` int(11)
,`rif` varchar(20)
,`razon` varchar(200)
,`tostring` varchar(221)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_ubicaciones`
--
CREATE TABLE `vw_ubicaciones` (
`id` int(11)
,`ubicacion` varchar(211)
);

-- --------------------------------------------------------

--
-- Table structure for table `zonas`
--

CREATE TABLE `zonas` (
  `id` int(11) NOT NULL,
  `ref` varchar(3) DEFAULT NULL,
  `denominacion` varchar(100) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `percent` decimal(16,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zonas`
--

INSERT INTO `zonas` (`id`, `ref`, `denominacion`, `descripcion`, `percent`) VALUES
(1, '001', 'COROZO-SANTA-BARBARA', 'EL COROZO SOCOPO-SANTA BARBARA', '0.02'),
(2, '002', 'BARINAS ', 'BARINAS CASCO DE LA CIIUDAD', '0.03'),
(3, '003', 'PORTUGUESA GUANARE', 'GUANARE-GUANARITO', '0.07');

-- --------------------------------------------------------

--
-- Structure for view `vw_grupos`
--
DROP TABLE IF EXISTS `vw_grupos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_grupos`  AS  select `grupos`.`id` AS `id`,concat(`grupos`.`ref`,' ',`grupos`.`descripcion`) AS `grupo` from `grupos` order by concat(`grupos`.`ref`,' ',`grupos`.`descripcion`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_lineas`
--
DROP TABLE IF EXISTS `vw_lineas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_lineas`  AS  select `lineas`.`id` AS `id`,concat(`lineas`.`ref`,' ',`lineas`.`descripcion`) AS `descripcion` from `lineas` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_productos`
--
DROP TABLE IF EXISTS `vw_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_productos`  AS  select `p`.`id` AS `id`,`p`.`ref` AS `ref`,`p`.`descripcion` AS `descripcion`,concat(`p`.`ref`,' ',`p`.`descripcion`) AS `tostring` from `productos` `p` order by concat(`p`.`ref`,' ',`p`.`descripcion`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_providers`
--
DROP TABLE IF EXISTS `vw_providers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_providers`  AS  select `p`.`id` AS `id`,`p`.`rif` AS `rif`,`p`.`razon` AS `razon`,concat(`p`.`rif`,' ',`p`.`razon`) AS `tostring` from `proveedores` `p` order by concat(`p`.`rif`,' ',`p`.`razon`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_ubicaciones`
--
DROP TABLE IF EXISTS `vw_ubicaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_ubicaciones`  AS  select `ubicaciones`.`id` AS `id`,concat(`ubicaciones`.`ref`,' ',`ubicaciones`.`descripcion`) AS `ubicacion` from `ubicaciones` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref` (`ref`);

--
-- Indexes for table `choferes`
--
ALTER TABLE `choferes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedrif_UNIQUE` (`cedrif`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedrif_UNIQUE` (`cedrif`),
  ADD KEY `fk_clientes_1_idx` (`id_zona`);

--
-- Indexes for table `comisiones`
--
ALTER TABLE `comisiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comisiones_1_idx` (`id_chof`);

--
-- Indexes for table `comisiones_dt`
--
ALTER TABLE `comisiones_dt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nfact_UNIQUE` (`nfact`),
  ADD KEY `fk_comisiones_dt_1_idx` (`id_client`),
  ADD KEY `fk_comisiones_dt_2_idx` (`id_com`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_UNIQUE` (`ref`),
  ADD KEY `id_lin` (`id_lin`);

--
-- Indexes for table `inv_detail`
--
ALTER TABLE `inv_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inv_detail_1_idx` (`id_prod`),
  ADD KEY `fk_inv_detail_2_idx` (`id_master`);

--
-- Indexes for table `inv_master`
--
ALTER TABLE `inv_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lineas`
--
ALTER TABLE `lineas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dep` (`id_dep`);

--
-- Indexes for table `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_UNIQUE` (`ref`),
  ADD KEY `fk_productos_1_idx` (`id_marca`),
  ADD KEY `fk_productos_2_idx` (`id_grupo`),
  ADD KEY `fk_productos_3_idx` (`id_ubic`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rif_UNIQUE` (`rif`);

--
-- Indexes for table `recepcion`
--
ALTER TABLE `recepcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recepcion_1_idx` (`id_prov`);

--
-- Indexes for table `recepciones_detail`
--
ALTER TABLE `recepciones_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recepciones_detail_1_idx` (`id_prod`),
  ADD KEY `fk_recepciones_detail_2_idx` (`id_recep`);

--
-- Indexes for table `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ubicaciones_1_idx` (`id_alm`);

--
-- Indexes for table `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_UNIQUE` (`ref`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `choferes`
--
ALTER TABLE `choferes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `comisiones`
--
ALTER TABLE `comisiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `comisiones_dt`
--
ALTER TABLE `comisiones_dt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `inv_detail`
--
ALTER TABLE `inv_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inv_master`
--
ALTER TABLE `inv_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lineas`
--
ALTER TABLE `lineas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `lotes`
--
ALTER TABLE `lotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `recepcion`
--
ALTER TABLE `recepcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `recepciones_detail`
--
ALTER TABLE `recepciones_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_1` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comisiones`
--
ALTER TABLE `comisiones`
  ADD CONSTRAINT `fk_comisiones_1` FOREIGN KEY (`id_chof`) REFERENCES `choferes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comisiones_dt`
--
ALTER TABLE `comisiones_dt`
  ADD CONSTRAINT `fk_comisiones_dt_1` FOREIGN KEY (`id_client`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comisiones_dt_2` FOREIGN KEY (`id_com`) REFERENCES `comisiones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`id_lin`) REFERENCES `lineas` (`id`);

--
-- Constraints for table `inv_detail`
--
ALTER TABLE `inv_detail`
  ADD CONSTRAINT `fk_inv_detail_1` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inv_detail_2` FOREIGN KEY (`id_master`) REFERENCES `inv_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lineas`
--
ALTER TABLE `lineas`
  ADD CONSTRAINT `fk_lineas_1` FOREIGN KEY (`id_dep`) REFERENCES `departamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_3` FOREIGN KEY (`id_ubic`) REFERENCES `ubicaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recepcion`
--
ALTER TABLE `recepcion`
  ADD CONSTRAINT `fk_recepcion_1` FOREIGN KEY (`id_prov`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recepciones_detail`
--
ALTER TABLE `recepciones_detail`
  ADD CONSTRAINT `fk_recepciones_detail_1` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recepciones_detail_2` FOREIGN KEY (`id_recep`) REFERENCES `recepcion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `fk_ubicaciones_1` FOREIGN KEY (`id_alm`) REFERENCES `almacenes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

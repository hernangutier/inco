-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 22, 2018 at 10:00 AM
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
(8, 'J40008128', 'AGROSUMINISTROS DEL LLANO C.A\r\n', NULL, 2, 'AV INDUSTRIAL S/N SECTOR AVENIDA INDUSTRIAL\r\n'),
(9, 'J404232885', 'INVERSIONES & SUMINISTROS OFICAR, C.A', '0.00', 2, 'CARRETERA NACIONAL LOCAL TRONCAL 5 NRO 9 URB. ALTO BARINAS'),
(10, 'J410363703', 'INVERSORA RORAIMA 2021 C.A', '0.00', 2, 'CARRETERA NACIONAL TRONCAL 5 SECTOR PALMA SOLA'),
(11, 'V938286400', 'CARLOS MIGUEL LOPEZ ALARCON', '0.00', 2, 'BARINAS'),
(12, 'V151733730', 'CESAR BASTIDAS', '0.00', 2, 'BARINAS'),
(13, 'V147468810', 'RODOLFO SIERRA', '0.00', 2, 'BARINAS'),
(14, 'J302308135', 'MINIMERCADO POPULAR, C.A', '0.00', 2, 'BARINAS'),
(15, 'J410324066', 'BODEGON LA CASTILLERA, C.A.', '0.00', 2, 'BARRIO EL MOLINO AV. 3 N° 7-56'),
(16, 'V158282484', 'FINCA TEYDE', '0.00', 2, 'OBISPOS BARINAS');

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
-- Table structure for table `list_price_detail`
--

CREATE TABLE `list_price_detail` (
  `id` int(11) NOT NULL,
  `id_list` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `price` decimal(16,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `list_price_master`
--

CREATE TABLE `list_price_master` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `title` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(118, 'CODEFIL'),
(119, 'DIAMOND'),
(120, 'CLASIC LUX'),
(121, 'TICINO'),
(122, 'CASTOR'),
(123, 'BORECA'),
(124, 'GENERICO');

-- --------------------------------------------------------

--
-- Table structure for table `notas_entrega`
--

CREATE TABLE `notas_entrega` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `motivo` varchar(400) NOT NULL,
  `status` int(11) DEFAULT '0',
  `ncontrol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notas_entrega`
--

INSERT INTO `notas_entrega` (`id`, `id_client`, `fecha`, `motivo`, `status`, `ncontrol`) VALUES
(2, 9, '2018-10-15 00:00:00', 'ENTREGA DE MERCANCÍA EN ESPERA DE FACTURACIÓN AL SR. JOSE MONTILLA ', 0, 1),
(3, 10, '2018-10-16 00:00:00', 'ENTREGA DE MERCANCIA S/FACTURA EN ESPERA DE FACTURACIÓN', 0, 2),
(4, 11, '2018-10-16 00:00:00', 'DESPACHO A EMPLEADO LLAVE GRUPO FREGADERO SAM 8 A 4 "', 0, 3),
(5, 12, '2018-10-16 00:00:00', 'ENTREGA SIN FACTURA EN ESPERA DE FACTURACION', 0, 4),
(6, 13, '2018-10-18 00:00:00', 'ENTREGA DE 50 SACOS DE CAL DE 200 FACTURADOS', 0, 5),
(7, 14, '2018-10-18 00:00:00', 'ENTREGA DE 19 PEGA SIST 1/32 POR  DEVOLUCION EN FACTURA ', 0, 6),
(8, 15, '2018-10-19 00:00:00', 'ENTREGA DE PEGA TUBRICA 1/4 PARA FACTURAR', 0, 7),
(9, 12, '2018-10-19 00:00:00', 'ENTREGADO POR JUAN GARRIDO: 3 SILLAS BABY ROMA Y UNA MESA BABY ROMA', 0, 8),
(10, 16, '2018-10-22 00:00:00', 'MATERIALES SOLICITADOS POR EL HUGO JOSE GARRIDO VALDIVIESO', 0, 9);

--
-- Triggers `notas_entrega`
--
DELIMITER $$
CREATE TRIGGER `bi_notas_entrega` BEFORE INSERT ON `notas_entrega` FOR EACH ROW BEGIN
  set new.ncontrol=(select count(id) + 1 from notas_entrega);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notas_entrega_detail`
--

CREATE TABLE `notas_entrega_detail` (
  `id` int(11) NOT NULL,
  `id_not` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `cnt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notas_entrega_detail`
--

INSERT INTO `notas_entrega_detail` (`id`, `id_not`, `id_prod`, `cnt`) VALUES
(3, 3, 65, 1),
(4, 2, 145, 20),
(5, 2, 146, 60),
(6, 4, 214, 1),
(7, 5, 136, 54),
(8, 5, 134, 120),
(9, 6, 38, 50),
(10, 7, 123, 19),
(11, 8, 200, 1),
(12, 9, 148, 3),
(13, 9, 150, 1),
(14, 10, 167, 1),
(15, 10, 76, 1),
(16, 10, 75, 4),
(17, 10, 114, 2);

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
  `min_venta` decimal(16,2) DEFAULT NULL,
  `e_in_inv` int(11) DEFAULT '0',
  `e_out_inv` int(11) DEFAULT '0',
  `id_ubic` int(11) DEFAULT NULL,
  `ref_fab` varchar(10) DEFAULT NULL,
  `is_new` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `ref`, `descripcion`, `und`, `costo`, `percent_utilidad`, `pvp`, `is_public`, `id_marca`, `id_grupo`, `min_venta`, `e_in_inv`, `e_out_inv`, `id_ubic`, `ref_fab`, `is_new`) VALUES
(8, '440-001', 'TUBO PVC 1/2*3MTS CONDUIT BLANCO FESTA\r\n', 'UND', '13455.8900', '30.0000', '292.9500', 1, 28, 17, '25.00', 0, 0, NULL, NULL, 0),
(9, '440-002', 'TUBO PVC 3/4*3MTS CONDUIT BLANCO FESTA\r\n', 'UND', '1345.9000', '30.0000', '439.4300', 1, 28, 17, '25.00', 0, 0, NULL, NULL, 0),
(10, '440-005', 'TUBO PVC 1"*3MTS CONDUIT BLANCO FESTA\r\n', 'UND', '5677.0000', '30.0000', '594.2800', 1, 28, 17, '20.00', 0, 0, NULL, NULL, 0),
(11, '440-006', 'TUBO PVC 1"1/2*3MTS CONDUIT BLANCO FESTA\r\n', NULL, '1230.9800', '30.0000', '683.4200', 1, 28, 17, '20.00', 0, 0, NULL, NULL, 0),
(12, '440-003', 'CURVA PVC 1/2*90 CONDUIT BLANCO FESTA\r\n', 'UND', '345.8900', '30.0000', '39.4900', 1, 28, 17, '100.00', 0, 0, NULL, NULL, 0),
(13, '440-004', 'CURVA PVC 3/4*90 CONDUIT BLANCO FESTA\r\n', NULL, '3456.0000', '30.0000', '63.0900', 1, 28, 17, '50.00', 0, 0, NULL, NULL, 0),
(14, '440-007', 'CURVA PVC 1"*90 CONDUIT BLANCO FESTA\r\n', 'UND', '1459.0900', '30.0000', '110.4200', 1, 28, 17, '30.00', 0, 0, NULL, NULL, 0),
(15, '440-008', 'CURVA PVC 1 1/2*90 CONDUIT BLANCO FESTA\r\n', NULL, '1345.9000', '30.0000', '110.4200', 1, 28, 17, '30.00', 0, 0, NULL, NULL, 0),
(16, '444-006', 'CAJETIN 4*2 PLASTICO TRANSLUCIDO FESTA\r\n', 'UND', '345.0000', '30.0000', '13.3400', 1, 28, 18, '120.00', 0, 0, NULL, NULL, 0),
(17, '444-007', 'CAJETIN OCTOGONAL PLÁSTICO TRASLUCIDO FESTA\r\n', 'UND', '4000.0000', '30.0000', '16.6700', 1, 28, 18, '70.00', 0, 0, NULL, NULL, 0),
(19, '501-002', 'BOMBA DE AGUA 1 HP LINCE\r\n', 'UND', '1345.0000', '30.0000', '10556.0000', 1, 41, 2, '1.00', 0, 0, NULL, NULL, 0),
(20, '341-001', 'MACHETE RULA 22" BELLOTA\r\n', 'UND', '860.0000', '30.0000', '874.8900', 1, 8, 39, '3.00', 0, 0, NULL, NULL, 0),
(21, '301-014', 'GRAPAS GALV 1*9 (24.5KG) VICSON\r\n', 'KG.', '3400.0000', '30.0000', '5075.0000', 0, 89, 36, '24.00', 0, 0, NULL, NULL, 0),
(22, '444-005', 'CAJETIN RECT. 4"*2"COMBINADO 1/2"3/4"INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '13.6600', 1, 36, 18, '100.00', 0, 0, NULL, NULL, 0),
(23, '440-009', 'TUBO PVC CONDUIT 1/2"*3MTS (BLANCO) INPLAVEN\r\n', 'UND', '1300.0000', '30.0000', '292.9500', 1, 36, 17, '20.00', 0, 0, NULL, NULL, 0),
(24, '440-012', 'TUBO PVC CONDUIT 3/4"*3MTS (BLANCO) INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '439.4300', 1, 36, 17, '10.00', 0, 0, NULL, NULL, 0),
(25, '420-005', 'CODO 1/2*45° AGUA BLANCA INPLAVEN', 'UND', '0.0000', '30.0000', '25.3500', 1, 36, 16, '50.00', 0, 0, NULL, NULL, 0),
(26, '430-002', 'CODO 3/4 *45° AGUAS CALIENTES TUBRICA', 'UND', '340.9000', '30.0000', '0.0000', 1, 84, 16, '1.00', 0, 0, NULL, NULL, 0),
(27, '341-017', 'HOJA PARA SEGUETA BAHCO 24 DIENTES', 'UND', '0.0000', '30.0000', '182.8500', 1, 103, 5, '10.00', 100, 0, NULL, NULL, 1),
(28, '341-018', 'HOJA PARA SEGUETA BAHCO 18 DIENTES', 'UND', '0.0000', '30.0000', '182.8500', 1, 103, 5, '10.00', 100, 0, NULL, NULL, 1),
(29, '446-003', 'RECEPTACULO DE BAKELITA 4-1/2" FERMETAL', 'UND', '0.0000', '30.0000', '178.7700', 1, 27, 57, '10.00', 0, 0, 1, NULL, 1),
(30, '448-001', 'ENCHUFE DE GOMA INDS.TIPO 101 FERMETAL', 'UND', '0.0000', '30.0000', '134.6000', 1, 27, 20, '20.00', 0, 0, 1, NULL, 1),
(31, '448-003', 'ENCHUFE S/TIERRA 15A AMAR VINIL', 'UND', '0.0000', '30.0000', '213.3100', 1, 27, 20, '20.00', 0, 0, 1, NULL, 1),
(32, '448-002', 'ENCHUFE S/TIERR METALICO AMARILLO 15', 'UND', '0.0000', '30.0000', '238.3500', 1, 27, 20, '25.00', 0, 0, 1, NULL, 1),
(33, '500-001', 'PULVERIZADOR MANUAL TIP MORRAL CAP 16LTS VERT', 'UND', '0.0000', '30.0000', '2935.0000', 1, 100, 2, '1.00', 0, 0, NULL, NULL, 0),
(34, '501-003', 'BOMBA DE AGUA 1/2 HP MEGA POWER\r\n', 'UND', '0.0000', '30.0000', '6110.5400', 1, 50, 2, '1.00', 0, 0, NULL, NULL, 0),
(35, '450-012', 'TEFLON 1/2 DIESEL TOOLS\r\n', 'UND', '0.0000', '30.0000', '78.1200', 1, 20, 11, '10.00', 0, 0, NULL, NULL, 0),
(36, '451-002', 'LLAVE D/CHORRO PVC 1/2" PLASTICA GENERICA\r\n', 'UND', '0.0000', '30.0000', '90.3300', 1, 30, 12, '10.00', 0, 0, NULL, NULL, 0),
(37, '451-003', 'LLAVE D/CHORRO PVC 1/2 "PLASTICA FERMETAL\r\n', 'UND', '0.0000', '30.0000', '130.3300', 1, 27, 12, '10.00', 0, 0, NULL, NULL, 0),
(38, '403-001', 'CAL HIDRATADA 8 KG SUPRACAL', 'SACO', '0.0000', '30.0000', '337.5000', 1, 117, 21, '10.00', 840, 0, NULL, NULL, 1),
(39, '443-009', 'CUCHILLA DE 2 PASE 3X200 AMP FERMETAL', 'UND.', '0.0000', '30.0000', '8090.4800', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(40, '443-008', 'CUCHILLA DE 2 PASE 3X100 AMP FERMETAL', 'UND', '0.0000', '30.0000', '2539.4500', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(41, '443-007', 'CUCHILLA DE 2 PASE 3X60 AMP FERMETAL', 'UND', '0.0000', '30.0000', '1054.0200', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(42, '443-006', 'CUCHILLA DE 2 PASE 3X30 AMP FERMETAL', 'UND', '0.0000', '30.0000', '780.5200', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(43, '443-005', 'CUCHILLA DE 2 PASES 2X100 AMP FERMETAL', 'UND', '0.0000', '30.0000', '1376.4000', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(44, '443-004', 'CUCHILLA DE 2 PASE 2X60 AMP FERMETAL', 'UND', '0.0000', '30.0000', '673.7200', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(45, '443-003', 'CUCHILLA DE 1 PASE 2X100 AMP FERMETAL', 'UND', '0.0000', '30.0000', '1362.4300', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(46, '443-002', 'CUCHILLA DE 1 PASE 2X60 AMP FERMETAL', 'UND', '0.0000', '30.0000', '710.4500', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(47, '443-001', 'CUCHILLA DE 1 PASE 2X30 AMP FERMETAL', 'UND', '0.0000', '30.0000', '310.1500', 1, 27, 19, '1.00', 0, 0, 1, NULL, 0),
(48, '443-010', 'CUCHILLA 1PASE 3X30 AMP C/FUSIBLE NEW KNIFE', 'UND', '0.0000', '30.0000', '599.5200', 1, 52, 19, '1.00', 0, 0, 1, NULL, 0),
(49, '443-012', 'CUCHILLA DE 1 PASE 2X30 AMP KNIFE', 'UND', '0.0000', '30.0000', '270.8100', 1, 52, 19, '1.00', 0, 0, 1, NULL, 0),
(50, '200-017', 'CAVA 11,35 LT ARTIC AMERICANA DECOCAR\r\n', 'UND', '1564.2000', '30.0000', '2624.4800', 1, 18, 52, '1.00', 0, 0, 1, NULL, 0),
(51, '200-009', 'CAVA 19 LTS (20QT) ARCTIC DECOCAR', 'UND', '2545.4700', '30.0000', '3679.5800', 1, 18, 52, '1.00', 0, 0, 1, NULL, 0),
(52, '200-010', 'CAVA 30 LTS (32QT) ARTIC JUNIOR DECOCAR', 'UND', '2300.0000', '30.0000', '4781.6200', 1, 18, 52, '1.00', 0, 0, 1, NULL, 0),
(53, '200-012', 'CAVA 40 LTS ICE ROLLER PREMIUM DECOCAR', 'UND', '3456.0000', '30.0000', '9520.4100', 1, 18, 52, '1.00', 0, 0, 1, NULL, 0),
(54, '200-013', 'CAVA 40 LTS ICE ROLLER STAN DECOCAR\r\n', 'UND', '3400.0000', '30.0000', '8700.0000', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(55, '200-011', 'CAVA 32LTS (34QT) ARTIC DECOCAR\r\n', 'UND', '3566.0000', '30.0000', '4700.0400', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(56, '200-014', 'CAVA 46 LTS (48QT) ARTIC DECOCAR\r\n', 'UND', '3456.0000', '30.0000', '7714.2800', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(57, '200-016', 'CAVA 46 LTS (48QT) MARYNE ARTIC DECOCAR\r\n', 'UND', '3400.0000', '30.0000', '10422.4400', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(58, '200-004', 'TERMO POPOTAMO 2 LTS DECOCAR\r\n', 'UND', '3400.0000', '30.0000', '668.5700', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(59, '200-005', 'TERMO POPOTAMO 4 TLS DECOCAR\r\n', 'UND', '3400.0000', '30.0000', '1742.8500', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(60, '200-007', 'TERMO POPOTAMO 7 LTS DECOCAR\r\n', 'UND', '3500.0000', '30.0000', '2169.3800', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(61, '200-008', 'TERMO POPOTAMO 8 LTS DECOCAR\r\n', 'UND', '5003.0000', '30.0000', '2595.9100', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(62, '200-001', 'TERMO ARTIC 4,7 LTS DECOCAR\r\n', 'UND', '4000.0000', '30.0000', '1915.0000', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(63, '200-002', 'TERMO POPOTAMO 15LTS DECOCAR\r\n', 'UND', '5666.0000', '30.0000', '3848.0000', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(64, '200-003', 'TERMO POPOTAMO 19 LTS DECOCAR\r\n', 'UND', '3456.0000', '30.0000', '4006.1200', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(65, '200-006', 'TERMO POPOTAMO 44 LTS DECOCAR\r\n', 'UND', '2400.0000', '30.0000', '4360.6500', 1, 18, 52, '1.00', 0, 0, NULL, NULL, 0),
(66, '320-001', 'ELECTRODO 3.32*6013 MAXI-PREMIUM\r\n', 'UND', '0.0000', '30.0000', '515.9400', 1, 49, 38, '20.00', 0, 0, NULL, NULL, 0),
(67, '321-001', 'DISCO P/H 4.1/2x2.0 MM U. FINO PREMIER CARBORUNDUN\r\n', 'UND', '0.0000', '30.0000', '220.9500', 1, 110, 37, '10.00', 0, 0, NULL, NULL, 0),
(68, '321-005', 'DISCO P/HIERRO 7x2.0 MM U. FINO PREMIER CARBORUNDUN\r\n', 'UND', '0.0000', '30.0000', '365.7100', 1, 110, 37, '10.00', 0, 0, NULL, NULL, 0),
(69, '321-003', 'DISCO P/ HIERRO TRONZADORA 14" (6UNI)\r\n', 'UND', '0.0000', '30.0000', '542.3400', 1, 110, 37, '6.00', 0, 0, NULL, NULL, 0),
(70, '446-001', 'SOCATE GOMA/CERAMICA MAXIMETAL.\r\n', 'UND', '0.0000', '30.0000', '51.0100', 1, 49, 57, '10.00', 0, 0, NULL, NULL, 1),
(71, '240-018', 'CAJA P/ HERRAMIENTAS 14" BOSSMAN\r\n', 'UND', '0.0000', '30.0000', '820.0000', 1, 105, 45, '3.00', 0, 0, NULL, NULL, 0),
(72, '240-019', 'CAJA P/ HERRAMIENTAS 19" BOSSMAN\r\n', 'UND', '0.0000', '30.0000', '1055.0000', 1, 105, 45, '3.00', 0, 0, NULL, NULL, 0),
(73, '449-009', 'ALAMBRE GALV G. P/C E. C-14 (2,11M) VICSON\r\n', 'UND', '0.0000', '30.0000', '10308.7500', 0, 89, 53, '1.00', 0, 0, NULL, NULL, 0),
(74, '449-010', 'ALAMBRE GALV G. P/C E. C-12 (2,77M) VICSON\r\n', 'ROLLO', '0.0000', '30.0000', '9817.8500', 0, 89, 53, '1.00', 0, 0, NULL, NULL, 0),
(75, '446-004', 'SOCATE DE PORCELANA C/FORRO GOMA ROSCA E27', 'UND', '0.0000', '30.0000', '32.2000', 1, 100, 57, '1.00', 101, 0, NULL, NULL, 1),
(76, '341-007', 'PALA DRAGA CON MANGO DE MADERA DE 1.5MTS H&H', 'UND', '0.0000', '30.0000', '3769.6200', 1, 101, 5, '1.00', 21, 0, NULL, NULL, 0),
(77, '120-001', 'MANGUERA CULEBRA 1/2"X100M BELL POWER\r\n', 'ROLLO', '0.0000', '30.0000', '6950.9500', 1, 94, 25, '1.00', 0, 0, NULL, NULL, 0),
(78, '450-013', 'TEFLON 3/4 19MM*15M\r\n', 'UND', '0.0000', '30.0000', '105.8700', 1, 30, 11, '10.00', 0, 0, NULL, NULL, 0),
(79, '451-007', 'LLAVE BOLA PVC 1/2" SACO\r\n', 'UND', '0.0000', '30.0000', '98.2000', 1, 64, 12, '10.00', 0, 0, NULL, NULL, 0),
(80, '450-001', 'SIFON 1 1/2" FLEXIBLE SACO\r\n', 'UND', '0.0000', '30.0000', '218.9600', 1, 64, 11, '3.00', 0, 0, NULL, NULL, 0),
(81, '450-003', 'SIFON 1 1/4 P/LAVAMANO PROLIFE\r\n\r\n', 'UND', '0.0000', '30.0000', '66.9500', 1, 59, 11, '6.00', 0, 0, NULL, NULL, 0),
(82, '447-001', 'TOMA CORRIENTE SUPERFIC TRIPLE EXXEL', 'UND', '0.0000', '30.0000', '0.0000', 0, 25, 58, '10.00', 0, 0, 1, NULL, 0),
(83, '447-002', 'TOMA DOBLE POLARIZADA 270 SACO', 'UND', '0.0000', '30.0000', '0.0000', 0, 64, 58, '10.00', 0, 0, 1, NULL, 0),
(84, '447-003', 'TOMA SENC. EMB. C/POLO A TIERRA IV SPIDERELECTRIC', 'UND', '0.0000', '30.0000', '0.0000', 0, 72, 58, '10.00', 0, 0, 1, NULL, 0),
(85, '420-001', 'CODO DE 1/2*90 AGUAS/ BLANCAS INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '28.9700', 1, 36, 16, '50.00', 0, 0, NULL, NULL, 0),
(86, '420-003', 'ANILLO 1/2 AGUA BLANCA INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '20.0500', 1, 36, 16, '50.00', 0, 0, NULL, NULL, 0),
(87, '420-002', 'ANILLO 1" AGUA BLANCA INPLAVEN\r\n', 'UND', '0.0000', '30.0000', '61.4300', 1, 36, 16, '50.00', 0, 0, NULL, NULL, 0),
(88, '420-008', 'TEE 1" AGUA BLANCA P/PEGAR INPLAVEN', 'UND', '0.0000', '30.0000', '71.1800', 1, 36, 16, '50.00', 0, 0, NULL, NULL, 0),
(89, '410-015', 'ANILLO 2" AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '63.2800', 1, 36, 13, '10.00', 0, 0, NULL, NULL, 0),
(90, '410-016', 'ANILLO 3" AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '89.6900', 1, 36, 13, '5.00', 0, 0, NULL, NULL, 0),
(91, '410-017', 'ANILLO 4" AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '168.7500', 1, 36, 13, '3.00', 0, 0, NULL, NULL, 0),
(92, '410-018', 'CODO 2"*90 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '89.4200', 1, 36, 13, '10.00', 0, 0, NULL, NULL, 0),
(93, '410-002', 'CODO 3"*90° AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '196.7300', 1, 36, 13, '5.00', 0, 0, NULL, NULL, 0),
(94, '410-003', 'CODO 4"*90° AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '381.5300', 1, 36, 13, '3.00', 0, 0, NULL, NULL, 0),
(95, '410-004', 'CODO 3"*45° AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '151.2700', 1, 36, 13, '5.00', 0, 0, NULL, NULL, 0),
(96, '300-008', 'CORDEL PP30  X 12 UNID.  CODEFIL', 'UND', '0.0000', '30.0000', '201.8400', 1, 118, 1, '12.00', 72, 0, NULL, NULL, 1),
(97, '410-005', 'TEE 2*2 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '143.0700', 1, 36, 13, '10.00', 0, 0, NULL, NULL, 0),
(98, '410-006', 'TEE 3*3 AGUAS NEGRAS INPLAVEN (40UNID)', 'UND', '0.0000', '30.0000', '312.9800', 1, 36, 13, '5.00', 0, 0, NULL, NULL, 0),
(99, '410-007', 'TEE 4*4 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '501.4200', 1, 36, 13, '3.00', 0, 0, NULL, NULL, 0),
(100, '410-008', 'TEE 4*2 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '445.7100', 1, 36, 13, '3.00', 0, 0, NULL, NULL, 0),
(101, '410-009', 'YEE 2*2 AGUAS NEGRAS INPLAVEN (50UNID)', 'UND', '0.0000', '30.0000', '133.7100', 1, 36, 13, '10.00', 0, 0, NULL, NULL, 0),
(102, '410-010', 'YEE 4*4 AGUAS NEGRAS INPLAVEN (10UNID)', 'UND', '0.0000', '30.0000', '702.0000', 1, 36, 13, '3.00', 0, 0, NULL, NULL, 0),
(103, '410-011', 'YEE 4 A 2 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '445.7100', 1, 36, 13, '3.00', 0, 0, NULL, NULL, 0),
(104, '410-012', 'CODO DE 2*45 PVC AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '161.5700', 1, 36, 13, '10.00', 0, 0, NULL, NULL, 0),
(105, '410-013', 'CODO DE 2*90 AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '83.5700', 1, 36, 13, '10.00', 0, 0, NULL, NULL, 0),
(106, '446-002', 'RECEPTACULO DE PORC. 4" E-27 CLASI LAX', 'UND', '0.0000', '30.0000', '260.0200', 1, 15, 57, '10.00', 0, 0, 1, NULL, 0),
(107, '447-007', 'TOMA STATNDAR RECETACULO SIMPLE FERMETAL', 'UND', '0.0000', '30.0000', '0.0000', 0, 27, 58, '10.00', 0, 0, NULL, NULL, 0),
(108, '110-006', 'BOMBILLO LUZ MIXTA 160W 330 E27 CLASIC LUX', 'UND', '0.0000', '30.0000', '579.3500', 1, 120, 28, '3.00', 19, 0, NULL, NULL, 1),
(109, '261-001', 'MOLINO  MANUAL DE METAL DIAMOND', 'UND', '0.0000', '30.0000', '2227.5000', 1, 119, 60, '1.00', 30, 0, NULL, NULL, 1),
(110, '230-004', 'JABON PARA LAVAR BEBE 200GR. GLOBAL', 'UND', '0.0000', '30.0000', '124.2500', 1, 92, 50, '20.00', 200, 0, NULL, NULL, 1),
(111, '447-004', 'INTERRUPTOR SUPERF. TIPO 52 FERMETAL', 'UND', '0.0000', '30.0000', '115.6000', 1, 27, 58, '12.00', 0, 0, 1, NULL, 1),
(112, '447-005', 'INTERRUPTOR B TICINO 602G', 'UND', '0.0000', '30.0000', '0.0000', 0, 30, 58, '10.00', 0, 0, 1, NULL, 0),
(113, '447-006', 'INTERRUPTOR B TICINO 602B', 'UND', '0.0000', '30.0000', '0.0000', 0, 30, 58, '10.00', 0, 0, 1, NULL, 0),
(114, '110-002', 'BOMBILLO INCANDESCENTE 100W\r\n', 'UND', '0.0000', '30.0000', '65.5200', 1, 30, 28, '10.00', 0, 0, NULL, '', 0),
(115, '110-001', 'BOMBILLO ESPIRAL 30W JALITE\r\n', 'UND', '0.0000', '30.0000', '271.2100', 1, 38, 28, '3.00', 0, 0, NULL, '', 0),
(116, '201-002', 'LINTERNA PLAST/RECAR 1 LED TIGER\r\n', 'UND', '0.0000', '30.0000', '482.2700', 1, 76, 51, '3.00', 0, 0, NULL, '', 0),
(117, '201-003', 'LINTERNA PLAST/RECAR 5 LED TIGER\r\n', 'UND', '0.0000', '30.0000', '501.6100', 1, 76, 51, '3.00', 0, 0, NULL, '', 0),
(118, '201-001', 'LINTERNA 1LED * 12 CM RECARGABLE VERT\r\n', 'UND', '0.0000', '30.0000', '442.9200', 0, 100, 51, '3.00', 0, 0, NULL, '', 0),
(119, '130-001', 'MASILLA EPOXICA EPOMONT (PEGA CANOA)\r\n', 'UND', '0.0000', '30.0000', '2741.7800', 1, 30, 26, '1.00', 0, 0, NULL, '', 0),
(120, '130-003', 'PEGA-MIX NEGRA 24X1 70gr.\r\n', 'UND', '0.0000', '30.0000', '187.1900', 1, 30, 26, '24.00', 0, 0, NULL, '', 0),
(121, '130-006', 'PEGA LOKA 3GR (42UNID)\r\n', 'UND', '0.0000', '30.0000', '45.1700', 1, 30, 26, '42.00', 0, 0, NULL, '', 0),
(122, '442-004', 'EXTENSION DOMEST. 2X18 4,50 MT FERMETAL', 'UND', '0.0000', '30.0000', '528.7700', 1, 27, 55, '6.00', 0, 0, NULL, 'EXT-07', 1),
(123, '130-005', 'PEGA SOLDADURA P/SIST C-PVC 1/32 TUBRICA\r\n', 'UND', '0.0000', '30.0000', '320.0000', 1, 84, 26, '24.00', 0, 0, NULL, '', 0),
(124, '341-002', 'MACHETE BOLO C/MANGO PLÁSTICO DE 22" VERT\r\n', 'UND', '0.0000', '30.0000', '762.0200', 1, 100, 39, '3.00', 0, 0, NULL, '', 0),
(125, '341-003', 'MACHETE CLASICO C/MANGO PLÁSTICO DE 22" VERT\r\n', 'UND', '0.0000', '30.0000', '777.1200', 1, 100, 39, '3.00', 0, 0, NULL, '', 0),
(126, '311-007', 'CANDADO 30MM CISA\r\n', 'UND', '0.0000', '30.0000', '721.8100', 1, 14, 41, '1.00', 0, 0, NULL, '', 0),
(127, '311-008', 'CANDADO 40MM CISA\r\n', 'UND', '0.0000', '30.0000', '915.5400', 1, 14, 41, '1.00', 0, 0, NULL, '', 0),
(128, '311-009', 'CANDADO 50MM CISA\r\n', 'UND', '0.0000', '30.0000', '1248.5500', 1, 14, 41, '1.00', 0, 0, NULL, '', 0),
(129, '311-010', 'CANDADO 60MM CISA\r\n', 'UND', '0.0000', '30.0000', '1885.9600', 1, 14, 41, '1.00', 0, 0, NULL, '', 0),
(130, '311-001', 'CANDADO 40MM CASTOR\r\n', 'UND', '0.0000', '30.0000', '191.1300', 1, 122, 41, '1.00', 0, 0, NULL, '', 0),
(131, '311-004', 'CANDADO LATONADO EN BRONCE DE 63MM VERT\r\n', 'UND', '0.0000', '30.0000', '493.9300', 1, 100, 41, '1.00', 0, 0, NULL, '', 0),
(132, '330-001', 'LIJA 120 PITBULL\r\n', 'PLIEGO', '0.0000', '30.0000', '32.0000', 1, 55, 34, '50.00', 0, 0, NULL, '', 0),
(133, '330-004', 'LIJA 120 X 50 UND. M.T.\r\n', 'PLIEGO', '0.0000', '30.0000', '32.0000', 1, 43, 34, '100.00', 0, 0, NULL, '', 0),
(134, '341-012', 'LIMA BAHCO PARA MOTOSIERRA 3/16\r\n', 'UND', '0.0000', '30.0000', '179.0000', 1, 103, 39, '6.00', 0, 0, NULL, '', 0),
(135, '341-013', 'LIMA BAHCO PARA MOTOSIERRA 5/32\r\n', 'UND', '0.0000', '30.0000', '179.0000', 1, 103, 39, '6.00', 0, 0, NULL, '', 0),
(136, '341-014', 'LIMA BAHCO PARA MOTOSIERRA 7/32\r\n', 'UND', '0.0000', '30.0000', '179.0000', 1, 103, 39, '6.00', 0, 0, NULL, '', 0),
(137, '102-008', 'FONDO BLANCO 1G  MANPICA\r\n', 'GALON', '0.0000', '30.0000', '2900.0000', 1, 46, 29, '4.00', 0, 0, NULL, '', 0),
(138, '102-005', 'FONDO BLANCO 1/4G  MANPICA', '1/4 GALON', '0.0000', '30.0000', '927.1400', 1, 46, 29, '12.00', 0, 0, NULL, '', 0),
(139, '102-002', 'FONDO NEGRO 1G.  MANPICA', 'GALON', '0.0000', '30.0000', '2241.4200', 1, 46, 29, '4.00', 0, 0, NULL, '', 0),
(140, '102-006', 'FONDO NEGRO 1/4G MANPICA', '1/4 GALON', '0.0000', '30.0000', '704.2800', 1, 46, 29, '12.00', 0, 0, NULL, '', 0),
(141, '102-004', 'FONDO GRIS 1G  MANPICA', 'GALON', '0.0000', '30.0000', '2450.0000', 1, 46, 29, '4.00', 0, 0, NULL, '', 0),
(142, '102-003', 'FONDO GRIS 1/4 G  MANPICA', '1/4 GALON', '0.0000', '30.0000', '801.4200', 1, 46, 29, '12.00', 0, 0, NULL, '', 0),
(143, '102-009', 'FONDO MINIO 1G MANPICA', 'GALON', '0.0000', '30.0000', '2911.4200', 1, 46, 29, '4.00', 0, 0, NULL, '', 0),
(144, '260-002', 'COCINA ELECTRICA 2 HORNILLAS\r\n', 'UND', '0.0000', '30.0000', '2160.3200', 1, 64, 43, '1.00', 0, 0, NULL, '', 0),
(145, '240-001', 'OPTIPIPOTE 40 LTS OPTILINE\r\n', 'UND', '0.0000', '30.0000', '581.4400', 1, 53, 45, '6.00', 0, 0, NULL, '', 0),
(146, '240-005', 'SILLA BANCO DEL PUEBLO\r\n', 'UND', '0.0000', '30.0000', '242.0800', 1, 53, 45, '3.00', 0, 0, NULL, '', 0),
(147, '240-006', 'SILLA CARTAGENA\r\n', 'UND', '0.0000', '30.0000', '492.8400', 1, 53, 45, '3.00', 0, 0, NULL, '', 0),
(148, '240-008', 'SILLA BABY MONACO\r\n', 'UND', '0.0000', '30.0000', '212.3100', 1, 53, 45, '3.00', 0, 0, NULL, '', 0),
(149, '240-010', 'SILLA BISTROT\r\n', 'UND', '0.0000', '30.0000', '523.7500', 1, 53, 45, '3.00', 0, 0, NULL, '', 0),
(150, '240-009', 'MESA INFANTIL BABY ROMA OPTILINE\r\n', 'UND', '0.0000', '30.0000', '527.6200', 1, 53, 45, '1.00', 0, 0, NULL, '', 0),
(151, '240-011', 'MESA ROMA (CUADRADA) OPTILINE\r\n', 'UND', '0.0000', '30.0000', '2000.0000', 1, 53, 45, '1.00', 0, 0, NULL, '', 0),
(152, '240-016', 'TAZON MULTIUSO CESTIPLAST\r\n', 'UND', '0.0000', '30.0000', '17.2500', 1, 12, 45, '12.00', 0, 0, NULL, '', 0),
(153, '341-015', 'RASTILLO C/ROSCA C/CABO CESTIPLAST\r\n', 'UND', '0.0000', '30.0000', '62.9500', 1, 12, 39, '12.00', 0, 0, NULL, '', 0),
(154, '341-006', 'PALA GRANDE C/CABO X 1 UND. CESTIPLAST\r\n', 'UND', '0.0000', '30.0000', '73.0700', 1, 12, 39, '12.00', 0, 0, NULL, '', 0),
(155, '341-005', 'PALA DE MANO X 1 UND. CESTIPLAST\r\n', 'UND', '0.0000', '30.0000', '49.8100', 1, 12, 39, '12.00', 0, 0, NULL, '', 0),
(156, '250-002', 'CAJA APILABLE GRANDE\r\n', 'UND', '0.0000', '30.0000', '207.1300', 1, 57, 49, '12.00', 0, 0, NULL, '', 0),
(157, '250-001', 'CAJA APILABLE PEQUEÑA\r\n', 'UND', '0.0000', '30.0000', '59.6800', 1, 57, 49, '12.00', 0, 0, NULL, '', 0),
(158, '445-001', 'PROTECTOR A. (ACON - REFR.) 220VAC PROTEKTOR\r\n', 'UND', '0.0000', '30.0000', '2357.1400', 1, 112, 56, '1.00', 0, 0, NULL, '', 0),
(159, '445-002', 'PROTECTOR NEV. REFRI-DOMEST. 110VAC PROTEKTOR\r\n', 'UND', '0.0000', '30.0000', '852.8500', 0, 112, 56, '1.00', 0, 0, NULL, '', 0),
(160, '510-001', 'BOTA DE GOMA CAÑA LARG BEIGE SEABOOTS 40\r\n', 'UND', '0.0000', '30.0000', '2321.4200', 0, 102, 59, '3.00', 0, 0, NULL, '', 0),
(161, '510-002', 'BOTA DE GOMA CAÑA LARG BEIGE SEABOOTS 43\r\n', 'UND', '0.0000', '30.0000', '2321.4200', 1, 102, 59, '3.00', 0, 0, NULL, '', 0),
(162, '510-003', 'BOTA DE GOMA CAÑA LARG BEIGE SEABOOTS 41\r\n', 'UND', '0.0000', '30.0000', '2321.4200', 0, 102, 59, '3.00', 0, 0, NULL, '', 0),
(163, '510-004', 'BOTA DE GOMA CAÑA LARG BEIGE SEABOOTS 42\r\n', 'UND', '0.0000', '30.0000', '2321.4200', 1, 102, 59, '3.00', 0, 0, NULL, '', 0),
(164, '510-005', 'BOTA DE GOMA CAÑA LARGA NEGRA SEABOOTS 42\r\n', 'UND', '0.0000', '30.0000', '1924.2800', 1, 102, 59, '3.00', 0, 0, NULL, '', 0),
(165, '510-006', 'BOTA DE GOMA CAÑA LARGA NEGRA SEABOOTS 43\r\n', 'UND', '0.0000', '30.0000', '1924.2800', 1, 102, 59, '3.00', 0, 0, NULL, '', 0),
(166, '510-007', 'BOTA DE GOMA CAÑA LARGA NEGRA SEABOOTS 40\r\n', 'UND', '0.0000', '30.0000', '1924.2800', 1, 102, 59, '3.00', 0, 0, NULL, '', 0),
(167, '510-008', 'BOTA DE GOMA CAÑA LARGA NEGRA SEABOOTS 41\r\n', 'UND', '0.0000', '30.0000', '1924.2800', 1, 102, 59, '3.00', 0, 0, NULL, '', 0),
(168, '449-011', 'ALAMBRE GALV P/C E. C-12 (2,51MM) VICSON\r\n', 'UND', '0.0000', '30.0000', '1051.3200', 0, 89, 53, '1.00', 0, 0, NULL, '', 0),
(169, '302-001', 'ALAMBRE GALV C-17,5 (500G) (40*0,50)  VICSON\r\n', 'UND', '0.0000', '30.0000', '119.5500', 0, 89, 35, '40.00', 0, 0, NULL, '', 0),
(170, '302-002', 'ALAMBRE GALV C-17,5 (50KG) VICSON\r\n', 'ROLLO', '0.0000', '30.0000', '12055.0000', 0, 89, 35, '1.00', 0, 0, NULL, '', 0),
(171, '531-001', 'ALAMBRE PUA MOTTO 400MTS C-16,5 VICSON\r\n', 'ROLLO', '0.0000', '30.0000', '3775.3100', 0, 89, 3, '1.00', 0, 0, NULL, '', 0),
(172, '531-002', 'ALAMBRE PUA MOTTO 500MTS C-15 VICSON\r\n', 'ROLLO', '0.0000', '30.0000', '5922.7000', 0, 89, 3, '1.00', 0, 0, NULL, '', 0),
(173, '400-001', 'MALLA VICCLON C-13½ 60 mm 25*1.80 VICSON\r\n', 'ROLLO', '0.0000', '30.0000', '11411.8000', 0, 89, 9, '1.00', 0, 0, NULL, '', 0),
(174, '400-005', 'MALLA GALLINERO 2" 1.65m*30m VICSON\r\n', 'ROLLO', '0.0000', '30.0000', '5030.7700', 0, 89, 9, '1.00', 0, 0, NULL, '', 0),
(175, '301-011', 'GRAPA GALV 1*9 (12 KG) EN TOBO VICSON\r\n', 'KG.', '0.0000', '30.0000', '2659.7100', 0, 89, 36, '1.00', 0, 0, NULL, '', 0),
(176, '300-002', 'MECATE ELEFANTE N° 21 (1/2")\r\n', 'KG.', '0.0000', '30.0000', '7392.5000', 1, 22, 1, '1.00', 0, 0, NULL, '', 0),
(177, '300-001', 'MECATE ELEFANTE N° 6 (1/4")\r\n', 'KG.', '0.0000', '30.0000', '7392.5000', 1, 22, 1, '1.00', 0, 0, NULL, '', 0),
(178, '300-004', 'MECATE ELEFANTE N° 12 (3/8")\r\n', 'KG.', '0.0000', '30.0000', '7392.5000', 1, 22, 1, '1.00', 0, 0, NULL, '', 0),
(179, '300-005', 'MECATE ELEFANTE N° 9 (5/16")\r\n', 'KG.', '0.0000', '30.0000', '7392.5000', 1, 22, 1, '1.00', 0, 0, NULL, '', 0),
(180, '300-003', 'MECATE ELEFANTE N° 15 (7/16")\r\n', 'KG.', '0.0000', '30.0000', '7392.5000', 1, 22, 1, '1.00', 0, 0, NULL, '', 0),
(181, '300-006', 'CORDEL PP30 SISALARA\r\n', 'UND', '0.0000', '30.0000', '291.5500', 1, 68, 1, '12.00', 0, 0, NULL, '', 0),
(182, '300-007', 'CORDEL N°12 (GUARAL) SISALARA*ROLLO\r\n', 'UND', '0.0000', '30.0000', '314.2800', 1, 68, 1, '12.00', 0, 0, NULL, '', 0),
(183, '400-010', 'PLASTICO FERRETERO PLASTICOS DE EMPAQUE NEGRO\r\n', 'ML.', '0.0000', '30.0000', '314.2800', 1, 30, 9, '12.00', 0, 0, NULL, '', 0),
(184, '400-011', 'PLASTICO FERRET NEGRO PLASTICOS BORECA\r\n', 'KG.', '0.0000', '30.0000', '308.0000', 1, 123, 9, '12.00', 0, 0, NULL, '', 0),
(185, '301-003', 'CLAVOS 1 1/2 *14 BLIST LAMINADO\r\n', 'KG.', '0.0000', '30.0000', '115.0000', 1, 39, 36, '0.50', 0, 0, NULL, '', 1),
(186, '101-014', 'PINTURA BLANCO CAUCHO TITAN 1G\r\n', 'GALON', '0.0000', '30.0000', '957.1400', 1, 77, 31, '4.00', 0, 0, NULL, '', 0),
(187, '101-001', 'PINTURA BLANCO CAUCHO CUÑETE 5G TITAN\r\n', 'CUÑETE', '0.0000', '30.0000', '4651.4200', 1, 77, 31, '1.00', 0, 0, NULL, '', 0),
(188, '101-012', 'BARNIZ TRANSP. 1G SEC. RAPIDO MANPICA', 'GALON', '0.0000', '30.0000', '2668.5700', 1, 46, 31, '4.00', 0, 0, NULL, '', 0),
(189, '100-001', 'PASTA PROF. MASTIC-500 CUÑETE MANPICA\r\n', 'CUÑETE', '0.0000', '30.0000', '6330.0000', 1, 46, 31, '1.00', 0, 0, NULL, '', 0),
(190, '101-011', 'ESMALTE GRIS ACERO PREMIUM 1G. MANPICA', 'GALON', '0.0000', '30.0000', '3420.0000', 1, 46, 31, '4.00', 0, 0, NULL, '', 0),
(191, '101-006', 'ESMALTE NEGRO MATE 1/4 G MANPICA', '1/4 GALON', '0.0000', '30.0000', '815.0000', 1, 46, 31, '12.00', 0, 0, NULL, '', 0),
(192, '101-004', 'ESMALTE NEGRO MATE 1G MANPICA\r\n', 'GALON', '0.0000', '30.0000', '2930.0000', 1, 46, 31, '4.00', 0, 0, NULL, '', 0),
(193, '101-007', 'ESMALTE NEGRO BRILLANTE 1/4G MANPICA', '1/4 GALON', '0.0000', '30.0000', '724.2800', 1, 46, 31, '12.00', 0, 0, NULL, '', 0),
(194, '101-005', 'ESMALTE NEGRO BRILLANTE 1G  MANPICA\r\n', 'UND', '0.0000', '30.0000', '2512.8500', 1, 46, 31, '4.00', 0, 0, NULL, '', 0),
(195, '101-010', 'ESMALTE BLANCO MATE 1/4 G  MANPICA\r\n', '1/4 GALON', '0.0000', '30.0000', '1035.7100', 1, 46, 31, '12.00', 0, 0, NULL, '', 0),
(196, '101-003', 'ESMALTE BLANCO MATE 1G  MANPICA\r\n', 'GALON', '0.0000', '30.0000', '3904.2800', 1, 46, 31, '4.00', 0, 0, NULL, '', 0),
(197, '101-009', 'ESMALTE BLANCO BRILLANTE 1/4G  MANPICA\r\n', '1/4 GALON', '0.0000', '30.0000', '1021.4200', 1, 46, 31, '12.00', 0, 0, NULL, '', 0),
(198, '101-002', 'ESMALTE BLANCO BRILLANTE 1G MANPICA\r\n', 'GALON', '0.0000', '30.0000', '3155.7100', 1, 46, 31, '4.00', 0, 0, NULL, '', 0),
(199, '102-010', 'FONDO CROMATO DE ZINC 1G MANPICA\r\n', 'GALON', '0.0000', '30.0000', '3384.2800', 1, 46, 29, '4.00', 0, 0, NULL, '', 0),
(200, '130-002', 'PEGA SOLDADURA PVC 1/4 TUBRICA\r\n', 'UND', '0.0000', '30.0000', '1558.0000', 1, 84, 26, '1.00', 0, 0, NULL, '', 0),
(201, '450-015', 'ASIENTO WC BLANCO PRO-LIFE\r\n', 'UND', '0.0000', '30.0000', '299.7500', 1, 59, 11, '3.00', 0, 0, NULL, '', 0),
(202, '450-011', 'HERRAJE JUNIOR 902 PROLIFE', 'UND', '0.0000', '30.0000', '369.4200', 1, 59, 11, '3.00', 0, 0, NULL, '', 0),
(203, '450-010', 'HERRAJE NEW OASIS VENCERAMICA', 'UND', '0.0000', '30.0000', '452.3300', 1, 106, 11, '3.00', 0, 0, NULL, '', 0),
(204, '450-009', 'HERRAJE ACUARIO 901 PROLIFE', 'UND', '0.0000', '30.0000', '525.1000', 1, 59, 11, '3.00', 0, 0, NULL, '', 0),
(205, '450-005', 'SIFON 1 1/2 PROLIFE P/FREGADERO', 'UND', '0.0000', '30.0000', '82.4200', 1, 59, 11, '6.00', 0, 0, NULL, '', 0),
(206, '501-001', 'BOMBA PERIFERICA DE 1/2HP, BOBINA(50MM) VERT\r\n', 'UND', '0.0000', '30.0000', '6085.3200', 1, 100, 2, '1.00', 0, 0, NULL, '', 0),
(207, '444-003', 'CAJETIN OCTOGONAL PLASTICO BLANCO FESTA', 'UND', '0.0000', '30.0000', '17.6800', 1, 28, 18, '70.00', 0, 0, NULL, '', 0),
(208, '444-001', 'CAJETIN 4*2 PLASTICO BLANCO FESTA\r\n', '120', '0.0000', '30.0000', '14.1400', 1, 28, 18, '120.00', 0, 0, NULL, '', 0),
(209, '444-002', 'CAJETIN 4*4 PLASTICO BLANCO FESTA\r\n', 'UND', '0.0000', '30.0000', '25.9200', 1, 28, 18, '50.00', 0, 0, NULL, '', 0),
(210, '410-022', 'CODO 4"*45° AGUAS NEGRAS INPLAVEN', 'UND', '0.0000', '30.0000', '278.5700', 1, 36, 13, '3.00', 0, 0, NULL, '', 1),
(211, '410-021', 'YEE 3*3 AGUAS NEGRAS INPLAVEN (10UNID)', 'UND', '0.0000', '30.0000', '292.5000', 1, 36, 13, '3.00', 0, 0, NULL, '', 1),
(212, '440-011', 'CURVA PVC 3/4*90° CONDUIT BLANCA INPLAVEN', 'UND', '0.0000', '30.0000', '63.0900', 1, 36, 17, '50.00', 0, 0, NULL, '', 1),
(213, '530-001', 'BIDONES 20 LTS PLASTICO', 'UND', '0.0000', '30.0000', '672.0000', 1, 95, 4, '6.00', 120, 0, NULL, '', 1),
(214, '210-002', 'GRUPO FREGADERO 8" AMERICANO 4" SAM', 'UND', '0.0000', '30.0000', '0.0000', 0, 65, 46, '1.00', 0, 0, NULL, '', 0),
(215, '130-004', 'PEGA-MIX BLANCA 24X1 70gr.', 'UND', '0.0000', '30.0000', '187.1900', 1, 30, 26, '24.00', 0, 0, NULL, '', 1),
(216, '341-009', 'ALICATE GANADERIA FIRM', 'UND', '0.0000', '30.0000', '900.0000', 1, 109, 39, '3.00', 0, 0, NULL, '', 1),
(217, '131-003', 'CINTA EMBALAR 48MM*35M TRANSPARENTE FERMETAL', 'UND', '0.0000', '30.0000', '95.5400', 1, 27, 27, '6.00', 0, 0, NULL, '', 1),
(218, '341-010', 'CEPILLO DE ALAMBRE 4X16', 'UND', '0.0000', '30.0000', '117.2700', 1, 124, 39, '6.00', 0, 0, NULL, '', 1),
(219, '444-008', 'CAJETIN 4*4 PLASTICO TRANSLUCIDO FESTA', 'UND', '0.0000', '30.0000', '0.0000', 0, 28, 18, '40.00', 0, 0, NULL, '', 0);

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
(14, 'J409095185', 'INVERSIONES ICN98 , C.A.'),
(15, 'J404167188', 'VALIM, C.A.');

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
(8, '455455', 6, NULL, '2018-10-04 00:00:00', NULL, 1, 0, 2, 0),
(9, '78788', 3, NULL, '2018-10-02 00:00:00', NULL, 2, 0, 3, 0),
(10, '52168', 8, NULL, '2018-10-05 00:00:00', 'RECEPCION DE 640 SACOS DE CAL HIDRATADA 8 KG.', 1, 0, 4, 0),
(11, '52169', 8, NULL, '2018-10-05 00:00:00', 'RECEPCION DE 200 SACOS DE CAL HIDRATADA 8 KG.', 1, 0, 5, 0),
(12, '8591', 11, NULL, '2018-10-10 00:00:00', 'EN ESPERA DE RECEPCION DE PRODUCTOS', 1, 0, 6, 0),
(13, '81824', 12, NULL, '2018-10-10 00:00:00', 'SIN INCIDENCIAS', 1, 0, 7, 0),
(14, '5738', 13, NULL, '2018-10-10 00:00:00', 'HOJAS DE SEGUETA 18 Y 24 DIENTES 100 C/ARTICULO', 1, 0, 8, 0),
(15, '8712', 14, NULL, '2018-10-11 00:00:00', 'BOMBILLO CLASIC LUX (1) UNIDAD DEFECTUOSA', 1, 1, 9, 0),
(16, '11427', 15, NULL, '2018-10-16 00:00:00', 'SIN OBSERVACIONES: RECEPCION DE 60 BIDONES', 1, 0, 10, 0),
(17, '8642', 11, NULL, '2018-10-17 00:00:00', 'PALASDRAGAS 20 Y SOCATE DE PORCELANA 100', 1, 0, 11, 0);

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
(12, 110, 200, 200, 15, 0),
(13, 213, 60, 60, 16, 0),
(14, 76, 20, 20, 17, 0),
(15, 75, 100, 100, 17, 0);

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
-- Stand-in structure for view `vw_clientes`
--
CREATE TABLE `vw_clientes` (
`id` int(11)
,`tostring` varchar(221)
,`cedrif` varchar(20)
,`razon` varchar(200)
);

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
-- Structure for view `vw_clientes`
--
DROP TABLE IF EXISTS `vw_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_clientes`  AS  select `c`.`id` AS `id`,concat(`c`.`cedrif`,' ',`c`.`razon`) AS `tostring`,`c`.`cedrif` AS `cedrif`,`c`.`razon` AS `razon` from `clientes` `c` ;

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
-- Indexes for table `list_price_detail`
--
ALTER TABLE `list_price_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_list_price_detail_1_idx` (`id_prod`),
  ADD KEY `fk_list_price_detail_2_idx` (`id_list`);

--
-- Indexes for table `list_price_master`
--
ALTER TABLE `list_price_master`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `notas_entrega`
--
ALTER TABLE `notas_entrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notas_entrega_1_idx` (`id_client`);

--
-- Indexes for table `notas_entrega_detail`
--
ALTER TABLE `notas_entrega_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notas_entrega_detail_1_idx` (`id_not`),
  ADD KEY `fk_notas_entrega_detail_2_idx` (`id_prod`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
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
-- AUTO_INCREMENT for table `list_price_detail`
--
ALTER TABLE `list_price_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `list_price_master`
--
ALTER TABLE `list_price_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lotes`
--
ALTER TABLE `lotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `notas_entrega`
--
ALTER TABLE `notas_entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `notas_entrega_detail`
--
ALTER TABLE `notas_entrega_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;
--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `recepcion`
--
ALTER TABLE `recepcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `recepciones_detail`
--
ALTER TABLE `recepciones_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
-- Constraints for table `list_price_detail`
--
ALTER TABLE `list_price_detail`
  ADD CONSTRAINT `fk_list_price_detail_1` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_list_price_detail_2` FOREIGN KEY (`id_list`) REFERENCES `inv_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notas_entrega`
--
ALTER TABLE `notas_entrega`
  ADD CONSTRAINT `fk_notas_entrega_1` FOREIGN KEY (`id_client`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notas_entrega_detail`
--
ALTER TABLE `notas_entrega_detail`
  ADD CONSTRAINT `fk_notas_entrega_detail_1` FOREIGN KEY (`id_not`) REFERENCES `notas_entrega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_notas_entrega_detail_2` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

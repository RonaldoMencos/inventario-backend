CREATE DATABASE  IF NOT EXISTS `bd_inventario` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_inventario`;
-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: bd_inventario
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bodega`
--

DROP TABLE IF EXISTS `bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodega` (
  `id_bodega` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  PRIMARY KEY (`id_bodega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_engreso_producto`
--

DROP TABLE IF EXISTS `control_engreso_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_engreso_producto` (
  `id_control_engreso_producto` int(11) NOT NULL AUTO_INCREMENT,
  `producto` int(11) NOT NULL,
  `bodega` int(11) NOT NULL,
  `factura` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_control_engreso_producto`),
  KEY `fk_control_egreso_producto_factura_idx` (`factura`),
  KEY `fk_control_egreso_producto_producto_idx` (`producto`),
  KEY `fk_control_egreso_producto_bodega_idx` (`bodega`),
  CONSTRAINT `fk_control_egreso_producto_bodega` FOREIGN KEY (`bodega`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_egreso_producto_factura` FOREIGN KEY (`factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_egreso_producto_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_engreso_producto`
--

LOCK TABLES `control_engreso_producto` WRITE;
/*!40000 ALTER TABLE `control_engreso_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_engreso_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_ingreso_producto`
--

DROP TABLE IF EXISTS `control_ingreso_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_ingreso_producto` (
  `id_control_ingreso_producto` int(11) NOT NULL AUTO_INCREMENT,
  `producto` int(11) NOT NULL,
  `orden_compra` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `bodega` int(11) NOT NULL,
  PRIMARY KEY (`id_control_ingreso_producto`),
  KEY `fk_control_ingreso_producto_producto_idx` (`producto`),
  KEY `control_ingreso_producto_orden_compra_idx` (`orden_compra`),
  KEY `control_ingreso_producto_bodega_idx` (`bodega`),
  CONSTRAINT `control_ingreso_producto_bodega` FOREIGN KEY (`bodega`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `control_ingreso_producto_orden_compra` FOREIGN KEY (`orden_compra`) REFERENCES `orden_compra` (`id_orden_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_ingreso_producto_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_ingreso_producto`
--

LOCK TABLES `control_ingreso_producto` WRITE;
/*!40000 ALTER TABLE `control_ingreso_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_ingreso_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_inventario`
--

DROP TABLE IF EXISTS `control_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_inventario` (
  `id_control_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `bodega` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY (`id_control_inventario`),
  KEY `fk_control_inventario_bodega_idx` (`bodega`),
  KEY `fk_control_inventario_producto_idx` (`producto`),
  CONSTRAINT `fk_control_inventario_bodega` FOREIGN KEY (`bodega`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_inventario_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_inventario`
--

LOCK TABLES `control_inventario` WRITE;
/*!40000 ALTER TABLE `control_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion_producto_factura`
--

DROP TABLE IF EXISTS `devolucion_producto_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucion_producto_factura` (
  `id_devolucion_producto_factura` int(11) NOT NULL AUTO_INCREMENT,
  `producto` int(11) NOT NULL,
  `bodega` int(11) NOT NULL,
  `factura` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion_devolucion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_devolucion_producto_factura`),
  KEY `fk_devolucion_producto_factura_producto_idx` (`producto`),
  KEY `fk_devolucion_producto_factura_bodega_idx` (`bodega`),
  KEY `fk_devolucion_producto_factura_factura_idx` (`factura`),
  CONSTRAINT `fk_devolucion_producto_factura_bodega` FOREIGN KEY (`bodega`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_devolucion_producto_factura_factura` FOREIGN KEY (`factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_devolucion_producto_factura_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion_producto_factura`
--

LOCK TABLES `devolucion_producto_factura` WRITE;
/*!40000 ALTER TABLE `devolucion_producto_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion_producto_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion_producto_proveedor`
--

DROP TABLE IF EXISTS `devolucion_producto_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucion_producto_proveedor` (
  `id_devolucion_producto_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `producto` int(11) NOT NULL,
  `orden_compra` int(11) NOT NULL,
  `bodega` int(11) NOT NULL,
  `descripcion_devolucion` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_devolucion_producto_proveedor`),
  KEY `fk_devolucion_producto_proveedor_producto_idx` (`producto`),
  KEY `devolucion_producto_proveedor_bodega_idx` (`bodega`),
  KEY `fk_devolucion_producto_proveedor_orden_compra_idx` (`orden_compra`),
  CONSTRAINT `fk_devolucion_producto_proveedor_bodega` FOREIGN KEY (`bodega`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_devolucion_producto_proveedor_orden_compra` FOREIGN KEY (`orden_compra`) REFERENCES `orden_compra` (`id_orden_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_devolucion_producto_proveedor_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion_producto_proveedor`
--

LOCK TABLES `devolucion_producto_proveedor` WRITE;
/*!40000 ALTER TABLE `devolucion_producto_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion_producto_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `cliente` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `fk_factura_cliente_idx` (`cliente`),
  CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_detalle` (
  `id_factura_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `factura` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_factura_detalle`),
  KEY `fk_factura_detalle_factura_idx` (`factura`),
  KEY `fk_factura_detalle_producto_idx` (`producto`),
  CONSTRAINT `fk_factura_detalle_factura` FOREIGN KEY (`factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_detalle_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_compra` (
  `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(15) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_orden_compra`),
  KEY `fk_orden_compra_proveedor_idx` (`proveedor`),
  CONSTRAINT `fk_orden_compra_proveedor` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra`
--

LOCK TABLES `orden_compra` WRITE;
/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra_detalle`
--

DROP TABLE IF EXISTS `orden_compra_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_compra_detalle` (
  `id_orden_compra_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `orden_compra` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_orden_compra_detalle`),
  KEY `orden_compra_detalle_producto_idx` (`producto`),
  KEY `fk_orden_compra_detalle_orden_idx` (`orden_compra`),
  CONSTRAINT `fk_orden_compra_detalle_orden` FOREIGN KEY (`orden_compra`) REFERENCES `orden_compra` (`id_orden_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orden_compra_detalle_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra_detalle`
--

LOCK TABLES `orden_compra_detalle` WRITE;
/*!40000 ALTER TABLE `orden_compra_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compra_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_categoria_idx` (`categoria`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria`) REFERENCES `producto_categoria` (`id_producto_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_categoria`
--

DROP TABLE IF EXISTS `producto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_categoria` (
  `id_producto_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_producto_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_categoria`
--

LOCK TABLES `producto_categoria` WRITE;
/*!40000 ALTER TABLE `producto_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre_fiscal` varchar(150) NOT NULL,
  `nit` varchar(11) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traslado_producto_bodega`
--

DROP TABLE IF EXISTS `traslado_producto_bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traslado_producto_bodega` (
  `id_traslado_producto_bodega` int(11) NOT NULL AUTO_INCREMENT,
  `bodega_origen` int(11) NOT NULL,
  `bodega_destino` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_traslado_producto_bodega`),
  KEY `fk_traslado_producto_bodega_origen_idx` (`bodega_origen`),
  KEY `fk_traslado_producto_bodega_destino_idx` (`bodega_destino`),
  KEY `fk_traslado_producto_bodega_producto_idx` (`producto`),
  CONSTRAINT `fk_traslado_producto_bodega_destino` FOREIGN KEY (`bodega_destino`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_traslado_producto_bodega_origen` FOREIGN KEY (`bodega_origen`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_traslado_producto_bodega_producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traslado_producto_bodega`
--

LOCK TABLES `traslado_producto_bodega` WRITE;
/*!40000 ALTER TABLE `traslado_producto_bodega` DISABLE KEYS */;
/*!40000 ALTER TABLE `traslado_producto_bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(150) NOT NULL,
  `email` varchar(70) NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `contrasenia` varchar(150) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_rol` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  KEY `fk_usuario_rol_rol_idx` (`rol`),
  KEY `fk_usuario_rol_usuario_idx` (`usuario`),
  CONSTRAINT `fk_usuario_rol_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-18 21:56:27

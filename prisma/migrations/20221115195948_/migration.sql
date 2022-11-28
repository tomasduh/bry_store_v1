-- CreateTable
CREATE TABLE `categoria` (
    `idCategoria` INTEGER NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`idCategoria`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ciudad` (
    `idCiudad` INTEGER NOT NULL,
    `Nombre` VARCHAR(100) NOT NULL,
    `id_Departamento` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NULL,
    `updatedAt` DATETIME(0) NULL,

    INDEX `id_Departamento`(`id_Departamento`),
    PRIMARY KEY (`idCiudad`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `compra` (
    `idCompra` INTEGER NOT NULL AUTO_INCREMENT,
    `Subtotal` DOUBLE NOT NULL,
    `Total` DOUBLE NOT NULL,
    `id_estado` INTEGER NOT NULL,
    `id_usuario` INTEGER NOT NULL,
    `id_Codesc` INTEGER NOT NULL,

    INDEX `id_estado`(`id_estado`),
    INDEX `id_user`(`id_usuario`),
    INDEX `idCompra`(`idCompra`),
    INDEX `id_Codesc`(`id_Codesc`),
    PRIMARY KEY (`idCompra`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `departamento` (
    `idDepartamento` INTEGER NOT NULL,
    `Nombre` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,

    PRIMARY KEY (`idDepartamento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `estadocompra` (
    `IdEstado` INTEGER NOT NULL AUTO_INCREMENT,
    `Estado` TINYINT NOT NULL,

    PRIMARY KEY (`IdEstado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `imagenes` (
    `idImagen` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(100) NOT NULL,
    `id_producto` INTEGER NOT NULL,

    INDEX `id_producto`(`id_producto`),
    PRIMARY KEY (`idImagen`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `itemcompra` (
    `idItem` INTEGER NOT NULL AUTO_INCREMENT,
    `id_producto` INTEGER NOT NULL,
    `id_compra` INTEGER NOT NULL,
    `cantidad` INTEGER NOT NULL,

    INDEX `id_producto`(`id_producto`),
    INDEX `id_compra`(`id_compra`),
    PRIMARY KEY (`idItem`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `marca` (
    `idMarca` INTEGER NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`idMarca`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `producto` (
    `idProducto` INTEGER NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(255) NOT NULL,
    `Precio` DOUBLE NOT NULL,
    `Cantidad` INTEGER NOT NULL,
    `id_marca` INTEGER NOT NULL,
    `id_subcategoria` INTEGER NOT NULL,

    INDEX `id_marca`(`id_marca`),
    INDEX `id_subcategoria`(`id_subcategoria`),
    PRIMARY KEY (`idProducto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subcategoria` (
    `idSubcategoria` INTEGER NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(255) NOT NULL,
    `idCategoria` INTEGER NOT NULL,

    INDEX `idCategoria`(`idCategoria`),
    PRIMARY KEY (`idSubcategoria`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario` (
    `idUsuario` INTEGER NOT NULL AUTO_INCREMENT,
    `Nombre` VARCHAR(50) NOT NULL,
    `Apellido` VARCHAR(50) NOT NULL,
    `Cedula` VARCHAR(10) NOT NULL,
    `Cel` VARCHAR(10) NOT NULL,
    `Email` VARCHAR(50) NOT NULL,
    `Contra` VARCHAR(100) NOT NULL,
    `Direccion` VARCHAR(60) NOT NULL,
    `Fecha_nac` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `id_ciudad` INTEGER NOT NULL,

    UNIQUE INDEX `email`(`Email`),
    INDEX `id_ciudad`(`id_ciudad`),
    PRIMARY KEY (`idUsuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `codigosdesc` (
    `IdCod` INTEGER NOT NULL AUTO_INCREMENT,
    `Codigo` VARCHAR(10) NOT NULL,
    `Descuento` INTEGER NOT NULL,
    `Estado` TINYINT NOT NULL,

    PRIMARY KEY (`IdCod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ciudad` ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`id_Departamento`) REFERENCES `departamento`(`idDepartamento`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `compra` ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `compra` ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estadocompra`(`IdEstado`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `compra` ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`id_Codesc`) REFERENCES `codigosdesc`(`IdCod`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `imagenes` ADD CONSTRAINT `imagenes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto`(`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `itemcompra` ADD CONSTRAINT `itemcompra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra`(`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `itemcompra` ADD CONSTRAINT `itemcompra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto`(`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `producto` ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca`(`idMarca`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `producto` ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategoria`(`idSubcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subcategoria` ADD CONSTRAINT `subcategoria_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria`(`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad`(`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE;

use superDB;
SET GLOBAL time_zone = '-6:00';

-- AGREGAR CARGO --
DELIMITER $$
CREATE PROCEDURE sp_agregarCargo(IN nomCar VARCHAR(30), IN desCar VARCHAR(100))
BEGIN
    INSERT INTO Cargos(nombreCargo, descripcionCargo)
    VALUES (nomCar, desCar);
END$$
DELIMITER ;

-- LISTAR CARGOS --
DELIMITER $$
CREATE PROCEDURE sp_ListarCargos()
BEGIN
    SELECT 
        Cargos.cargoId,
        Cargos.nombreCargo,
        Cargos.descripcionCargo
    FROM Cargos;
END$$
DELIMITER ;

-- ELIMINAR CARGO --
DELIMITER $$
CREATE PROCEDURE sp_EliminarCargo(IN carId INT)
BEGIN
    DELETE FROM Cargos
    WHERE cargoId = carId;
END$$
DELIMITER ;

-- BUSCAR CARGO --
DELIMITER $$
CREATE PROCEDURE sp_BuscarCargo( IN carId INT)
BEGIN
    SELECT
        Cargos.cargoId,
        Cargos.nombreCargo,
        Cargos.descripcionCargo
    FROM Cargos
    WHERE cargoId = carId;
END$$
DELIMITER ;

-- EDITAR CARGO --
DELIMITER $$
CREATE PROCEDURE sp_EditarCargo(IN carId INT, IN nomCar VARCHAR(30), IN desCar VARCHAR(100))
BEGIN
    UPDATE Cargos
    SET
        nombreCargo = nomCar,
        descripcionCargo = desCar
    WHERE cargoId = carId;
END$$
DELIMITER ;

-- =======================================================================================================================
-- AGREGAR CATEGORÍA DE PRODUCTO --
DELIMITER $$
CREATE PROCEDURE sp_agregarCategoriaProducto( IN nomCat VARCHAR(30), IN desCat VARCHAR(100))
BEGIN
    INSERT INTO CategoriaProductos(nombreCategoria, descripcionCategoria)
    VALUES (nomCat, desCat);
END$$
DELIMITER ;

-- LISTAR CATEGORÍAS DE PRODUCTOS --
DELIMITER $$
CREATE PROCEDURE sp_ListarCategoriasProductos()
BEGIN
    SELECT 
        categoriaProductosId,
        nombreCategoria,
        descripcionCategoria
    FROM CategoriaProductos;
END$$
DELIMITER ;

-- ELIMINAR CATEGORÍA DE PRODUCTO --
DELIMITER $$
CREATE PROCEDURE sp_EliminarCategoriaProducto(IN catProdId INT)
BEGIN
    DELETE FROM CategoriaProductos
    WHERE categoriaProductosId = catProdId;
END$$
DELIMITER ;

-- BUSCAR CATEGORÍA DE PRODUCTO --
DELIMITER $$
CREATE PROCEDURE sp_BuscarCategoriaProducto(IN catProdId INT)
BEGIN
    SELECT
        categoriaProductosId,
        nombreCategoria,
        descripcionCategoria
    FROM CategoriaProductos
    WHERE categoriaProductosId = catProdId;
END$$
DELIMITER ;

-- EDITAR CATEGORÍA DE PRODUCTO --
DELIMITER $$
CREATE PROCEDURE sp_EditarCategoriaProducto(IN catProdId INT, IN nomCat VARCHAR(30), IN desCat VARCHAR(100))
BEGIN
    UPDATE CategoriaProductos
    SET
        nombreCategoria = nomCat,
        descripcionCategoria = desCat
    WHERE categoriaProductosId = catProdId;
END$$
DELIMITER ;
-- ========================================================================================================================================================
-- AGREGAR DISTRIBUIDOR --
DELIMITER $$
CREATE PROCEDURE sp_agregarDistribuidor(IN nomDis VARCHAR(30), IN dirDis VARCHAR(200), IN nitDis VARCHAR(15), IN telDis VARCHAR(15), IN p_web VARCHAR(50))
BEGIN
    INSERT INTO Distribuidores(nombreDistribuidor, direccionDistribuidor, nitDistribuidor, telefonoDistribuidor, web)
    VALUES (nomDis, dirDis, nitDis, telDis, p_web);
END$$
DELIMITER ;

-- LISTAR DISTRIBUIDORES --
DELIMITER $$
CREATE PROCEDURE sp_ListarDistribuidores()
BEGIN
    SELECT 
        distribuidorId,
        nombreDistribuidor,
        disreccionDistribuidor,
        nitDistribuidor,
        telefonoDistribuidor,
        web
    FROM Distribuidores;
END$$
DELIMITER ;

-- ELIMINAR DISTRIBUIDOR --
DELIMITER $$
CREATE PROCEDURE sp_EliminarDistribuidor(IN disId INT)
BEGIN
    DELETE FROM Distribuidores
    WHERE distribuidorId = disId;
END$$
DELIMITER ;

-- BUSCAR DISTRIBUIDOR --
DELIMITER $$
CREATE PROCEDURE sp_BuscarDistribuidor(IN disId INT)
BEGIN
    SELECT
        distribuidorId,
        nombreDistribuidor,
        disreccionDistribuidor,
        nitDistribuidor,
        telefonoDistribuidor,
        web
    FROM Distribuidores
    WHERE distribuidorId = disId;
END$$
DELIMITER ;

-- EDITAR DISTRIBUIDOR --
DELIMITER $$
CREATE PROCEDURE sp_EditarDistribuidor(IN disId INT, IN nomDis VARCHAR(30), IN dirDis VARCHAR(200), IN nitDis VARCHAR(15), IN telDis VARCHAR(15), IN p_web VARCHAR(50))
BEGIN
    UPDATE Distribuidores
    SET
        nombreDistribuidor = nomDis,
        disreccionDistribuidor = dirDis,
        nitDistribuidor = nitDis,
        telefonoDistribuidor = telDis,
        web = p_web
    WHERE distribuidorId = disId;
END$$
DELIMITER ;
-- ================================================================================================================================================================================================================================================
-- AGREGAR COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_agregarCompra(IN fecCom DATE, IN totCom DECIMAL(10,2))
BEGIN
    INSERT INTO Compras(fechaCompra, totalCompra)
    VALUES (fecCom, totCom);
END$$
DELIMITER ;

-- LISTAR COMPRAS --
DELIMITER $$
CREATE PROCEDURE sp_ListarCompras()
BEGIN
    SELECT 
        compraId,
        fechaCompra,
        totalCompra
    FROM Compras;
END$$
DELIMITER ;

-- ELIMINAR COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_EliminarCompra(IN comId INT)
BEGIN
    DELETE FROM Compras
    WHERE compraId = comId;
END$$
DELIMITER ;

-- BUSCAR COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_BuscarCompra(IN comId INT)
BEGIN
    SELECT
        compraId,
        fechaCompra,
        totalCompra
    FROM Compras
    WHERE compraId = comId;
END$$
DELIMITER ;

-- EDITAR COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_EditarCompra(IN comId INT, IN fecCom DATE, IN totCom DECIMAL(10.2))
BEGIN
    UPDATE compras
    SET
        p_fechaCompra = fecCom,
        p_totalCompra = totCom
    WHERE compraId = comId;
END$$
DELIMITER ;
-- ==============================================================================================================
-- AGREGAR CLIENTE--
Delimiter $$
Create procedure sp_agregarClientes(nt varchar(30), nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(200))
begin
				insert into Clientes(nit, nombre, apellido, telefono, direccion)
						values (nt, nom, ape, tel, dir);
end$$
Delimiter ;
 
-- LISTAR CLIENTE--
delimiter $$
create procedure sp_ListarClientes()
	begin
		select 
			Clientes.clientesId,
			Clientes.nit,
			Clientes.nombre,
			Clientes.apellido,
            Clientes.telefono,
            Clientes.direccion
				from Clientes;
	end$$
delimiter ;
 
-- ELIMINAR CLIENTE--
delimiter $$
create procedure sp_EliminarClientes(in clidId  int)
	begin
		delete from Clientes
			where clienteId  = clidId;
	end$$
delimiter ;
 
-- BUSCAR CLIENTE--
delimiter $$
create procedure sp_BuscarClientes(in clidId int)
	begin
		select
			Clientes.nit,
			Clientes.nombre,
			Clientes.apellido,
            Clientes.telefono,
            Clientes.direccion
            from Clientes
					where clienteId = clidId;
	end$$
delimiter ;
 
-- EDITAR CLIENTE--
delimiter $$
create procedure sp_EditarClientes(in clidId int, in nt varchar(30), in nom varchar(30), in ape varchar(30), in tel varchar(15), in dir varchar(200))
	begin	
		update Clientes
			set
				nit = nt,
				nombre = nom,
                apellido = ape,
                telefono = tel,
                direccion = dir
					where clienteId = clidId;
	end$$
delimiter ;
-- =========================================================================================================================================================
-- AGREGAR PRODUCTO --
DELIMITER $$
CREATE PROCEDURE sp_agregarProducto(IN nomProd VARCHAR(50), IN desProd VARCHAR(100), IN canSto INT, IN preVenUni DECIMAL(10,2), IN preVenMay DECIMAL(10,2), IN preCom DECIMAL(10,2), IN imaPro BLOB, IN disId INT, IN catProdId INT)
BEGIN
    INSERT INTO Productos(nombreProducto, descripcionProducto, cantidadStack, precioVentaUnitario, precioVentaMayor, precioCompra, imagenProducto, distribuidorId, categoriaProductosId)
    VALUES (nomProd, desProd, canSto, preVenUni, preVenMay, preCom, imaProd, disId, catProdId);
END$$
DELIMITER ;

-- LISTAR PRODUCTOS --
DELIMITER $$
CREATE PROCEDURE sp_ListarProductos()
BEGIN
    SELECT 
        productoId,
        nombreProducto,
        descripcionProducto,
        cantidadStack,
        precioVentaUnitario,
        precioVentaMayor,
        precioCompra,
        imagenProducto,
        distribuidorId,
        categoriaProductosId
    FROM Productos;
END$$
DELIMITER ;

-- ELIMINAR PRODUCTO --
DELIMITER $$
CREATE PROCEDURE sp_EliminarProducto(IN prodId INT)
BEGIN
    DELETE FROM Productos
    WHERE productoId = prodId;
END$$
DELIMITER ;

-- BUSCAR PRODUCTO --
DELIMITER $$
CREATE PROCEDURE sp_BuscarProducto(IN prodId INT)
BEGIN
    SELECT
        productoId,
        nombreProducto,
        descripcionProducto,
        cantidadStack,
        precioVentaUnitario,
        precioVentaMayor,
        precioCompra,
        imagenProducto,
        distribuidorId,
        categoriaProductosId
    FROM Productos
    WHERE productoId = prodId;
END$$
DELIMITER ;

-- EDITAR PRODUCTO --
DELIMITER $$
CREATE PROCEDURE sp_EditarProducto(IN prodId INT, IN nomProd VARCHAR(50), IN desProd VARCHAR(100), IN canSto INT, IN preVenUni DECIMAL(10,2), IN preVenMay DECIMAL(10,2), IN preCom DECIMAL(10,2), IN imaProd BLOB, IN disId INT, IN catProdId INT)
BEGIN
    UPDATE Productos
    SET
        nombreProducto = nomProd,
        descripcionProducto = desProd,
        cantidadStack = canSto,
        precioVentaUnitario = preVenUni,
        precioVentaMayor = preVenMay,
        precioCompra = preCom,
        imagenProducto = imaProd,
        distribuidorId = disId,
        categoriaProductosId = catProdId
    WHERE productoId = prodId;
END$$
DELIMITER ;
-- =======================================================================================================================================================================================================================================================================================================================================================
-- AGREGAR PROMOCIÓN --
DELIMITER $$
CREATE PROCEDURE sp_agregarPromocion(IN preProm DECIMAL(10,2), IN desProm VARCHAR(100), IN fecIni DATE, IN fecFin DATE, IN prodId INT)
BEGIN
    INSERT INTO Promociones(precioPromocio, descripcionPromocion, fechaInicio, fechaFinal, productoId)
    VALUES (preProm, desProm, fecIni, fecFin, prodId);
END$$
DELIMITER ;

-- LISTAR PROMOCIONES --
DELIMITER $$
CREATE PROCEDURE sp_ListarPromociones()
BEGIN
    SELECT 
        promocionId,
        precioPromocio,
        descripcionPromocion,
        fechaInicio,
        fechaFinal,
        productoId
    FROM Promociones;
END$$
DELIMITER ;

-- ELIMINAR PROMOCIÓN --
DELIMITER $$
CREATE PROCEDURE sp_EliminarPromocion(IN promId INT)
BEGIN
    DELETE FROM Promociones
    WHERE promocionId = promId;
END$$
DELIMITER ;

-- BUSCAR PROMOCIÓN --
DELIMITER $$
CREATE PROCEDURE sp_BuscarPromocion(IN promId INT)
BEGIN
    SELECT
        promocionId,
        precioPromocio,
        descripcionPromocion,
        fechaInicio,
        fechaFinal,
        productoId
    FROM Promociones
    WHERE promocionId = promId;
END$$
DELIMITER ;

-- EDITAR PROMOCIÓN --
DELIMITER $$
CREATE PROCEDURE sp_EditarPromocion(IN promId INT, IN preProm DECIMAL(10,2), IN desProm VARCHAR(100), IN fecIni DATE, IN fecFin DATE, IN prodId INT)
BEGIN
    UPDATE Promociones
    SET
        precioPromocio = preProm,
        descripcionPromocion = desProm,
        fechaInicio = fecIni,
        fechaFinal = fecFin,
        productoId = prodId
    WHERE promocionId = promId;
END$$
DELIMITER ;
-- ==========================================================================================================================================================================================================
-- AGREGAR DETALLE DE COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_agregarDetalleCompra(IN cantCom INT, IN prodId INT, IN comId INT)
BEGIN
    INSERT INTO DetalleCompra(cantidadCompra, productoId, compraId)
    VALUES (cantCom, prodId, comId);
END$$
DELIMITER ;

-- LISTAR DETALLES DE COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_ListarDetallesCompra()
BEGIN
    SELECT 
        detalleCompraId,
        cantidadCompra,
        productoId,
        compraId
    FROM DetalleCompra;
END$$
DELIMITER ;

-- ELIMINAR DETALLE DE COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_EliminarDetalleCompra(IN detComId INT)
BEGIN
    DELETE FROM DetalleCompra
    WHERE detalleCompraId = detComId;
END$$
DELIMITER ;

-- BUSCAR DETALLE DE COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_BuscarDetalleCompra(IN detComId INT)
BEGIN
    SELECT
        detalleCompraId,
        cantidadCompra,
        productoId,
        compraId
    FROM DetalleCompra
    WHERE detalleCompraId = detComId;
END$$
DELIMITER ;

-- EDITAR DETALLE DE COMPRA --
DELIMITER $$
CREATE PROCEDURE sp_EditarDetalleCompra(IN detComId INT, IN cantCom INT, IN prodId INT, IN comId INT)
BEGIN
    UPDATE Promociones
    SET
        cantidadCompra = cantCom,
        productoId = prodId,
        compraId = comId
    WHERE detalleCompraId = detComId;
END$$
DELIMITER ;
-- ========================================================================================================================================
-- AGREGAR EMPLEADO --
DELIMITER $$
CREATE PROCEDURE sp_agregarEmpleado(IN nomEmp VARCHAR(30), IN apeEmp VARCHAR(30), IN sue DECIMAL(10,2), IN horEnt TIME, IN horSal TIME, IN carId INT, IN encarId INT)
BEGIN
    INSERT INTO Empleados(nombreEmpleado, apellidoEmpleado, sueldo, horaEntrada, horaSalida, cargoId, encargadoId)
    VALUES (nomEmp, apeEmp, sue, horEnt, horSal, carId, encarId);
END$$
DELIMITER ;

-- LISTAR EMPLEADOS --
DELIMITER $$
CREATE PROCEDURE sp_ListarEmpleados()
BEGIN
    SELECT 
        empleadoId,
        nombreEmpleado,
        apellidoEmpleado,
        sueldo,
        horaEntrada,
        horaSalida,
        cargoId,
        encargadoId
    FROM Empleados;
END$$
DELIMITER ;

-- ELIMINAR EMPLEADO --
DELIMITER $$
CREATE PROCEDURE sp_EliminarEmpleado(IN empId INT)
BEGIN
    DELETE FROM Empleados
    WHERE empleadoId = empId;
END$$
DELIMITER ;

-- BUSCAR EMPLEADO --
DELIMITER $$
CREATE PROCEDURE sp_BuscarEmpleado(IN empId INT)
BEGIN
    SELECT
        empleadoId,
        nombreEmpleado,
        apellidoEmpleado,
        sueldo,
        horaEntrada,
        horaSalida,
        cargoId,
        encargadoId
    FROM Empleados
    WHERE empleadoId = empId;
END$$
DELIMITER ;

-- EDITAR EMPLEADO --
DELIMITER $$
CREATE PROCEDURE sp_EditarEmpleado(IN empId INT, IN nomEmp VARCHAR(30), IN apeEmp VARCHAR(30), IN sue DECIMAL(10,2), IN horEnt TIME, IN horSal TIME,  IN carId INT, IN encarId INT)
BEGIN
    UPDATE Empleados
    SET
        nombreEmpleado = nomEmp,
        apellidoEmpleado = apeEmp,
        sueldo = sue,
        horaEntrada = horEnt,
        horaSalida = horSal,
        cargoId = carId,
        encargadoId = encarId
    WHERE empleadoId = empId;
END$$
DELIMITER ;
-- ==================================================================================================================================================================================================================================================
-- AGREGAR FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_agregarFactura(IN fec DATE, IN cliId INT, IN empId INT, IN tot DECIMAL(10,2))
BEGIN
    INSERT INTO Facturas(fecha, clienteId, empleadoId, total)
    VALUES (fec, cliId, empId, tot);
END$$
DELIMITER ;

-- LISTAR FACTURAS --
DELIMITER $$
CREATE PROCEDURE sp_ListarFacturas()
BEGIN
    SELECT 
        facturaId,
        fecha,
        clienteId,
        empleadoId,
        total
    FROM Facturas;
END$$
DELIMITER ;

-- ELIMINAR FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_EliminarFactura(IN facId INT)
BEGIN
    DELETE FROM Facturas
    WHERE facturaId = facId;
END$$
DELIMITER ;

-- BUSCAR FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_BuscarFactura(IN facId INT)
BEGIN
    SELECT
        facturaId,
        fecha,
        clienteId,
        empleadoId,
        total
    FROM Facturas
    WHERE facturaId = facId;
END$$
DELIMITER ;

-- EDITAR FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_EditarFactura(IN facId INT, IN fec DATE, IN cliId INT, IN empId INT, IN tot DECIMAL(10,2))
BEGIN
    UPDATE Empleados
    SET
        fecha = fec,
        clienteId = cliId,
        empleadoId = empId,
        total = tot
    WHERE facturaId = facId;
END$$
DELIMITER ;
-- =============================================================================================================================================
-- AGREGAR TICKET DE SOPORTE --
DELIMITER $$
CREATE PROCEDURE sp_agregarTicketSoporte(IN desTick VARCHAR(250), IN est VARCHAR(30), IN cliId INT, IN facId INT)
BEGIN
    INSERT INTO ticketSoporte(descripcionTicket, estatus, clienteId, facturaId)
    VALUES (desTick, est, cliId, facId);
END$$
DELIMITER ;

-- LISTAR TICKETS DE SOPORTE --
DELIMITER $$
CREATE PROCEDURE sp_ListarTicketsSoporte()
BEGIN
    SELECT 
        ticketSoporteId,
        descripcionTicket,
        estatus,
        clienteId,
        facturaId
    FROM ticketSporte;
END$$
DELIMITER ;

-- ELIMINAR TICKET DE SOPORTE --
DELIMITER $$
CREATE PROCEDURE sp_EliminarTicketSoporte(IN tickSopId INT)
BEGIN
    DELETE FROM ticketSporte
    WHERE ticketSoporteId = tickSopId;
END$$
DELIMITER ;

-- BUSCAR TICKET DE SOPORTE --
DELIMITER $$
CREATE PROCEDURE sp_BuscarTicketSoporte(IN tickSopId INT)
BEGIN
    SELECT
        ticketSoporteId,
        descripcionTicket,
        estatus,
        clienteId,
        facturaId
    FROM ticketSporte
    WHERE ticketSoporteId = tickSopId;
END$$
DELIMITER ;

-- EDITAR TICKET DE SOPORTE --
DELIMITER $$
CREATE PROCEDURE sp_EditarTicketSoporte(IN tickSopId INT, IN desTick VARCHAR(250), IN est VARCHAR(30), IN cliId INT, IN facId INT)
BEGIN
    UPDATE Empleados
    SET
        descripcionTicket = desTick,
        estatus = est,
        clienteIdId = cliId,
        facturaId = facId
    WHERE ticketSoporteId = tickSopId;
END$$
DELIMITER ;
-- =============================================================================================================================================================================
-- AGREGAR DETALLE DE FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_agregarDetalleFactura(IN facId INT, IN prodId INT)
BEGIN
    INSERT INTO DetalleFactura(facturaId, productoId)
    VALUES (facId, prodId);
END$$
DELIMITER ;

-- LISTAR DETALLES DE FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_ListarDetallesFactura()
BEGIN
    SELECT 
        detalleFacturaId,
        facturaId,
        productoId
    FROM DetalleFactura;
END$$
DELIMITER ;

-- ELIMINAR DETALLE DE FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_EliminarDetalleFactura(IN detFacId INT)
BEGIN
    DELETE FROM DetalleFactura
    WHERE detalleFacturaId = detFacId;
END$$
DELIMITER ;

-- BUSCAR DETALLE DE FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_BuscarDetalleFactura(IN detFacId INT)
BEGIN
    SELECT
        detalleFacturaId,
        facturaId,
        productoId
    FROM DetalleFactura
    WHERE detalleFacturaId = detFacId;
END$$
DELIMITER ;

-- EDITAR DETALLE DE FACTURA --
DELIMITER $$
CREATE PROCEDURE sp_EditarDetalleFactura(IN detFacId INT, IN facId INT, IN prodId INT)
BEGIN
    UPDATE Empleados
    SET
        facturaId = facId,
        productoId = prodId
    WHERE ticketSoporteId = detFacId;
END$$
DELIMITER ;











































































drop database superDB;
create database superDB;
use superDB;
SET GLOBAL time_zone = '-6:00';

create table Cargos(
	cargoId INT not null auto_increment,
    nombreCargo VARCHAR(30),
    descripcionCargo VARCHAR(100),
    primary key pk_cargoId(cargoId)
);
create table CategoriaProductos(
	categoriaProductosId INT NOT NULL AUTO_INCREMENT,
    nombreCategoria VARCHAR(30) NOT NULL,
    descripcionCategoria VARCHAR(100) NOT NULL,
    primary key PK_categoriaProductosId(categoriaProductosId)
);
create table Distribuidores(
	distribuidorId INT NOT NULL AUTO_INCREMENT,
	nombreDistribuidor VARCHAR(30) not null,
    disreccionDistribuidor VARCHAR(200) not null,
    nitDistribuidor VARCHAR(15) not null,
    telefonoDistribuidor VARCHAR(15) not null,
    web varchar(50),
    primary key pk_distribuidorId (distribuidorId)
);
create table compras(
	compraId INT NOT NULL AUTO_INCREMENT,
    fechaCompra DATE not null,
    totalCompra DECIMAL(10,2),
    primary key pk_compraId (compraId)
);
create table Clientes(
	clienteId INT NOT NULL AUTO_INCREMENT,
    nit varchar(30),
    nombre varchar(30) not null,
    apellido varchar(30) not null,
	telefono varchar(15),
    direccion varchar(200) not null,
    primary key pk_clienteId (clienteId)	
);

create table Productos(
    productoId INT NOT NULL AUTO_INCREMENT,
    nombreProducto VARCHAR(50) not null,
    descripcionProducto VARCHAR(100),
    cantidadStack INT not null,
    precioVentaUnitario DECIMAL(10,2) not null,
    precioVentaMayor DECIMAL(10,2) not null,
    precioCompra DECIMAL(10,2)not null,
    imagenProducto BLOB,
    distribuidorId INT not null,
    categoriaProductosId INT,
    primary key PK_productoId(productoId),
    constraint FK_Productos_Distribuidores foreign key Productos(distribuidorId)
        references Distribuidores(distribuidorId),
	constraint FK_Productos_CategoriaProductos foreign key Productos(categoriaProductosId)
        references CategoriaProductos(categoriaProductosId)
);
create table Promociones(
	promocionId INT NOT NULL AUTO_INCREMENT,
    precioPromocio DECIMAL(10,2) NOT NULL,
    descripcionPromocion VARCHAR(100),
    fechaInicio DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    productoId INT,
    primary key promocionId(promocionId),
    constraint FK_Promociones_Productos FOREIGN KEY Promociones(productoId)
		REFERENCES Productos(productoId)
); 
create table DetalleCompra(
	detalleCompraId INT NOT NULL AUTO_INCREMENT,
    cantidadCompra INT NOT NULL,
    productoId INT,
    compraId INT,
    primary key PK_detalleCompraId(detalleCompraId),
    CONSTRAINT FK_DetalleCompra_Producots FOREIGN KEY DetalleCompra(productoId)
		REFERENCES Productos(productoId),
	CONSTRAINT FK_DetalleCompra_Compras FOREIGN KEY DetalleCompra(compraId)
		REFERENCES Compras(compraId)
);
create table Empleados(
    empleadoId INT NOT NULL AUTO_INCREMENT,
    nombreEmpleado varchar(30) not null,
    apellidoEmpleado varchar(30),
    sueldo DECIMAL(10,2),
    horaEntrada TIME,
    horaSalida TIME,
    cargoId INT,
    encargadoId int,
    primary key PK_empleadoId(empleadoId),
    constraint FK_Productos_Cargos foreign key Productos(cargoId)
        references Cargos(cargoId),
    constraint FK_encargadoId foreign key Empleados(encargadoId)
        references Empleados(empleadoId)
);
create table Facturas(
    facturaId INT NOT NULL AUTO_INCREMENT,
    fecha date not null,
    clienteId int not null,
    empleadoId int not null,
    total decimal(10,2),
    primary key PK_facturaId(facturaId),
    constraint FK_Factura_Clientes foreign key Facturas(clienteId)
        references Clientes(clienteId),
    constraint FK_Facturas_Empleados foreign key Facturas(empleadoId)
        references Empleados(empleadoId)
);

create table ticketSporte(
	ticketSoporteId INT NOT NULL AUTO_INCREMENT,
    descripcionTicket VARCHAR(250),
    estatus VARCHAR(30),
    clienteId INT,
    facturaId INT,
    primary key PK_ticketSoporteId(ticketSoporteId),
    constraint FK_ticketSporte_Clientes foreign key ticketSporte(clienteId)
        references Clientes(clienteId),
    constraint FK_ticketSporte_Facturas foreign key ticketSporte(facturaId)
        references Facturas(facturaId)
);
create table DetalleFactura(
    detalleFacturaId INT NOT NULL AUTO_INCREMENT,
    facturaId int not null,
    productoId int not null,
    primary key PK_detalleFacturaId(detalleFacturaId),
    constraint FK_DetalleFactura_Facturas foreign key DetalleFactura(facturaId)
        references Facturas(facturaId),
    constraint FK_DetalleFactura_Productos foreign key DetalleFactura(productoId)
        references Productos(productoId)
);
Insert into Clientes(nombre, apellido, telefono, direccion, nit) values
	('Christian', 'Medrano', '3769-0310', 'Ciudad', '123-456'),
    ('Andre', 'Reyes', '9876-5555', 'Ciudad', '489-123'),
    ('Carlos', 'Jimenez', '7859-1496', 'Ciudad', '456-589');
    
select * from Clientes;








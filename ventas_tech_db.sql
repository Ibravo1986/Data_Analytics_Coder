--1.Crear la Base de datos
CREATE DATABASE Ventas_Tech_DB;
USE Ventas_Tech_DB;

--2.Eliminar Tablas si existen
DROP TABLE IF EXISTs ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

--3.Crear Tabla categorias
CREATE TABLE categorias(
Id_categoria int PRIMARY KEY,
Nombre_categoria varchar(50) not null,
descripcion varchar(200),
);

--4.Crear Tabla clientes
CREATE TABLE clientes(
Id_cliente int primary Key,
nombre varchar(50) not null,
email varchar(100) unique,
ciudad varchar(50),
fecha_registro date not null
);

--5.Crear Tabla productos
CREATE TABLE productos(
Id_productos int primary key,
nombre_producto varchar(100) not null,
Id_categoria int,
precio decimal(10,2) not null,
stock int default 0,
activo tinyint default 1,
foreign key(id_categoria) references categorias(id_categoria)
);

--6.Crear Tabla ventas
CREATE TABLE ventas(
Id_ventas int primary key,
id_cliente int,
id_producto int,
cantidad int not null,
precio_unitario decimal(10,2) not null,
fecha_venta date not null,
foreign key(id_cliente) references clientes(id_cliente),
foreign key(id_producto) references productos(id_productos)
);

--7. Insertar datos en categoria
INSERT INTO categorias values(1,'computacion','Laptos, Pcs y monitores');
INSERT INTO categorias values(2,'accesorios','perifericos y complementos');
INSERT INTO categorias values(3,'audio','auriculares y parlantes');
INSERT INTO categorias values(4,'almacenamiento','discos y memorias')

INSERT INTO clientes VALUES(1,'Maria Lopez', 'maria@mail.com','Buenos Aires','2024-01-05');
insert into clientes values(2,'Carlos Ruiz','carlos@mail.com','Cordoba','2024-01-10');
insert into clientes values(3,'Ana Gomez','ana@mail.com','Rosario','2024-02-02');
insert into clientes values(4,'Pedro Sanz','pedro@mail.com','Mendoza','2024-02-15');
insert into clientes values(5,'Laura Torres','laura@mail.com','Tucuman','2024-03-01')

INSERT INTO productos VALUES(1,'Laptop Pro 15',1,1200.00,15,1);
INSERT INTO productos VALUES(2,'Mouse Inalambrico',2,28.00,80,1);
INSERT INTO productos VALUES(3,'MOnitor 4k 27 pulgadas',1,450.00,12,1);
INSERT INTO productos VALUES(4,'Auriculares BT Pro',3,120.00,35,1);
INSERT INTO productos VALUES(5,'SSD Externo 1tb',4,130.00,18,1);
INSERT INTO productos VALUES(6,'Teclado Mecanico',2,95.00,40,1);

INSERT INTO ventas VALUES(1,1,1,2,1200.00,'2024-03-05');
INSERT INTO ventas VALUES(2,2,2,5,28.00,'2024-03-06');
INSERT INTO ventas VALUES(3,3,3,1,450.00,'2024-03-07');
INSERT INTO ventas VALUES(4,1,4,2,120.00,'2024-03-08');
INSERT INTO ventas VALUES(5,4,5,3,130.00,'2024-03-10');
INSERT INTO ventas VALUES(6,2,6,4,95.00,'2024-03-11');
INSERT INTO ventas VALUES(7,5,1,1,1200.00,'2024-03-12');
INSERT INTO ventas VALUES(8,3,2,8,28.00,'2024-03-13');
INSERT INTO ventas VALUES(9,4,4,1,120.00,'2024-03-14');
INSERT INTO ventas VALUES(10,5,3,2,450.00,'2024-03-15');

--8.Confirmacion de carga de datos
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
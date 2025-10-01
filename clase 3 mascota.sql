CREATE DATABASE tiendaMascotas;
USE tiendaMascotas;

create table cliente (
	cedulacliente int not null,
    telefonocliente varchar(50) unique,
    nombrecliente varchar(50) not null,
    apellidocliente varchar(50),
    direccioncliente varchar(50) not null,
    primary key(cedulacliente)
);

create table mascota (
	idmascota int not null auto_increment,
    tipomascota varchar(50) not null,
    nombremascota varchar(50) not null,
    razamascota varchar(50) not null,
    generomascota varchar(50) not null,
    cedulacliente int not null,
    primary key(idmascota),
    foreign key(cedulacliente) references cliente(cedulacliente)
);

create table vacuna (
	idvacuna int not null auto_increment,
    nombreenf varchar(50) not null,
    nombrevacuna varchar(50) not null,
    dosisvacuna varchar(50) not null,
    primary key(idvacuna)
);

create table aplicacionvacuna (
	idaplicacion int not null auto_increment,
    idmascota int not null,
    idvacuna int not null,
    primary key(idaplicacion),
    foreign key(idmascota) references mascota(idmascota),
    foreign key(idvacuna) references vacuna(idvacuna)
);

create table venta (
	idventa int not null auto_increment,
    primary key(idventa)
);

create table detalleventa (
	iddetalleventa int not null auto_increment,
    fechaventa date not null,
    cedulacliente int not null,
    idventa int not null,
    primary key(iddetalleventa),
    foreign key(cedulacliente) references cliente(cedulacliente),
    foreign key(idventa) references venta(idventa)
);

create table producto (
	codigobarprod int not null,
    precioprod decimal(10,2) not null,
    nombreprod varchar(50) not null,
    marcaprod varchar(50),
    primary key(codigobarprod)
);

create table detalleproducto (
	iddetalleprod int not null auto_increment,
    idventa int not null,
    codigobarprod int not null,
    primary key(iddetalleprod),
    foreign key(idventa) references venta(idventa),
    foreign key(codigobarprod) references producto(codigobarprod)
);



create database TechCorp;
use techCorp;

create table usurio(
idUsuarioFK varchar(20) not null,
nombre varchar(20) not null,
apellido varchar(20)not null,
primary key(idUsuarioFK)
);

create table empleado(
tipoUsuario varchar(50) not null,
idEmpleado varchar(20) not null,
edad int not null,
salario int not null,
ingreso varchar(20),
primary key (tipoUsuario),
foreign key (idEmpleado) references usuario(idUsuario)
);

create table departamento(
departamento varchar(50) not null,
segmentos varchar(50) not null,
primary key(segmentos),
foreign key (departamento) references empleado(tipoUsuario)
);
create database TechCorp;
use techCorp;

create table usuario(
idUsuarioFK varchar(20) not null,
nombre varchar(20) not null,
apellido varchar(20)not null,
primary key(idUsuarioFK)
);

create table empleado(
tipoUsuario varchar(20) not null,
idEmpleado varchar(20) not null,
edad int not null,
salario int not null,
ingreso varchar(20),
primary key (tipoUsuario),
foreign key (idEmpleado) references usuario(idUsuarioFK)
);

create table departamento(
departamento varchar(50) not null,
segmentos varchar(50) not null,
primary key(segmentos),
foreign key (departamento) references empleado(tipoUsuario)
);

insert into usuario 
values
('111', 'Andres', 'Perez'),
('112', 'Daniel', 'Lopez'),
('113', 'Juan', 'Martinez'),
('114', 'David', 'Torres'),
('115', 'Sofia', 'Garcia');

insert into empleado
values
('Gerente', '111', 32, 2300000, '2022-06-05'),
('Analista', '112', 25, 1500000, '2022-10-10'),
('vendedor', '113', 27, 1400000, '2019-12-03'),
('vendedorr', '114', 30, 4000000, '2021-02-05'),
('Asistente', '115', 22, 1500000, '2024-11-30');

insert into departamento
values
('Gerente', 'Finanzas'),
('Analista', 'Marketing'),
('Contador', 'Contabilidad'),
('Supervisor', 'Producción'),
('Asistente', 'Recursos Humanos');

/*
clase 29/09/2025 quiz

*/
create database quiz;
use quiz;

create table empleado(
idUsuarioFK varchar(50) not null,
idEmpleado varchar(50) not null,
nombre varchar(50) not null,
diaDeNacimiento int not null,
salario int not null,
diaContratado varchar(50) not null,
primary key (idUsuarioFK),
foreign key (idEmpleado) references departamento(numDepartamento)
);

create table departamento(
numDepartamento varchar(50) not null,
idDepartamento varchar(50) not null,
primary key (numDepartamento)
);

alter table departamento add nomDepartamento varchar(50) unique;

alter table empleado change idusuariofk idusuariofk int unique;


alter table empleado change diaDeNacimiento diaDeNacimiento varchar(50) unique;


describe empleado;

insert into empleado 
values 
(12345,111,"anegl","2002-02-12",2300000,"2022-06-05"),
(23451,112,"daniel","2000-12-02",1500000,"2022-10-10"),
(32414,113,"juan","1998-01-26",1400000,"2019-12-03"),
(54321,114,"david","1999-10-9-30",4000000,"2021-02-05"),
(54123,115,"garaviz","2006-12-13",1500000,"2024-11-30");


describe departamento;

insert into departamento
values
("12345","v2001","ventas"),
("23451","c2050","call"),
("32414","a3000","analista"),
("54321","v2001","ventas"),
("54123","j1111","jefe de area");

select*from departament for count(nomDepartamento = ventas);


# 1empleadoa que pertenecen al deprtamento de ventas
#empleados 
#2 encuentre el nombre del empleado con el segundo salario mas alto
#3tilisando left join muestre los departamentos que no tienen empleado asignados
#muestre el total de empleado por cada departamento 

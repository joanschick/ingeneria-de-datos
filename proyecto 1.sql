create database solactive_price_validation;

use solactive_price_validation;

create table activo(
	idActivo int auto_increment primary key,
    precioActivo float,
    timestampRecepcion timestamp,
    divisaActivo varchar(5) not null,
    tickerUniversal varchar(10) not null,
    regionActivo varchar(25) not null,
    claseActivo varchar(50) not null
);

create table vendor(
	idVendor int not null auto_increment primary key,
    nombreVendor varchar(50) not null,
    emailSoporte varchar(255) not null
);

create table detalleRecepcion(
	idRecepcion int not null auto_increment primary key,
    idVendorFK int not null,
    idActivoFK int not null,
    foreign key (idVendorFK) references vendor(idVendor),
    foreign key (idActivoFK) references activo(idActivo)
);

create table resultado(
	idActivoFK int not null unique,
	idResultado int auto_increment primary key,
    observacionResultado varchar(255),
    foreign key (idActivoFK) references activo(idActivo)
);

create table division(
	idDivision int auto_increment primary key,
    nombreDivision varchar(25) not null
);

create table usuario(
	idUsuario int auto_increment primary key,
    idDivisionFK int not null,
	nombreUsuario varchar(50) not null,
    emailCorporativo varchar(100) not null,
    contraseñaUsuario varchar(25) not null,
    idResultadoFK int not null,
    foreign key (idDivisionFK) references division(idDivision),
    foreign key (idResultadoFK) references resultado(idResultado)
);

/*Insert de activos*/
describe activo;

/* Insert XKUW */
insert into activo 
values 
("", 0.337, "2025-08-14 10:00:02.3197", "KWD", "XKUW", "ASIA", "SHARE");

insert into activo 
values 
("", 0.337, "2025-08-14 22:15:46.859085", "KWD", "XKUW", "ASIA", "SHARE"), 
("", 0.337, "2025-08-15 22:04:34.880061", "KWD", "XKUW", "ASIA", "SHARE");

/* Insert XAMS */
insert into activo 
values 
("", 0.9318, "2025-01-06 17:00:01.219813", "EUR", "XAMS", "EUROPE", "SHARE"), 
("", 0.9318, "2025-01-06 23:15:55.605843", "EUR", "XAMS", "EUROPE", "SHARE"), 
("", 0.9309, "2025-01-08 23:01:57.681922", "EUR", "XAMS", "EUROPE", "SHARE");

/* Insert XSGO */
insert into activo 
values 
("", 3140, "2025-06-17 20:02:07.214827", "CLP", "XSGO", "AMERICA", "SHARE"),
("", 3140, "2025-06-19 22:01:48.787615", "CLP", "XSGO", "AMERICA", "SHARE"),
("", 3140, "2025-06-17 22:15:45.956838", "CLP", "XSGO", "AMERICA", "SHARE");

/*Insert de vendor y detalleRecepcion*/
describe detalleRecepcion;

/*Insert vendor*/
insert into vendor 
values 
("","ICE","iceacciones@theice.com,"),
("","FactSet","support@factset.com"),
("","EDI","rrhh@edicomgroup.com");

/*Insert detalle recepcion*/
insert into detalleRecepcion 
values 
("",1,1), 
("",2,2), 
("",3,3), 
("",1,4), 
("",2,5), 
("",3,6), 
("",1,7), 
("",2,8), 
("",3,9);

/*Insert de division*/
insert into division 
values 
(" ", "equity core"), 
(" ", "price data");

/*Insert de Resultado*/
insert into resultado 
values 
(1,"",""),
(4,"",""),
(7,"","");

alter table resultado add tickerResultado varchar(15);

update resultado set tickerResultado = "XKUW" where idResultado = 1;

update resultado set tickerResultado = "XAMS" where idResultado = 2;

update resultado set tickerResultado = "XSGO" where idResultado = 3;

alter table resultado add estadoValidacion varchar(20);

update resultado set estadoValidacion = "Validated" where idResultado = 1;

update resultado set estadoValidacion = "semiValidated" where idResultado = 2;

update resultado set estadoValidacion = "Validated" where idResultado = 3;

describe resultado;

select * from resultado;

/*No insert pero no se como almacenarlo*/
/*select
    r.idResultado,
    a.tickerUniversal,
    a.precioActivo,
    case
        WHEN COUNT(DISTINCT a.precioActivo) = 3 AND COUNT(a.tickerUniversal) = 3 THEN 'Unvalidated'
        WHEN COUNT(DISTINCT a.precioActivo) = 2 AND COUNT(a.tickerUniversal) = 3 THEN 'Semi-Validated'
        ELSE 'Validated'
    END AS estado
FROM resultado r
JOIN activo a ON r.tickerResultado = a.tickerUniversal;
*/
 
/*Insert de usuario*/
insert into usuario 
(idUsuario, idDivisionFK, nombreUsuario, emailCorporativo, contraseñaUsuario, idResultadoFK) 
values 
(null, 1, "sara pastrosa", "sarap@solactiveequity.com", "sa.solequitycore2",1), 
(null, 2, "aitor tilla", "a.tilla@solactiveprice.data.com", "a.tpricesol_",1), 
(null, 1, "armando bulla", "ar_bu@solactiveequity.com", "armandoequity",2), 
(null, 2, "ines esario", "ines.es@solactiveprice.data.com", "inesolactivep",2), 
(null, 1, "alan brito", "alan_b@solactiveequity.com", "alanbr.equity",3), 
(null, 2, "elba calao", "elbaca@solactiveprice.data.com", "elbitacapricedata*",3);

create view vistaResultados as select r.tickerResultado as "Ticker de validacion", 
r.estadoValidacion as "Estado de la validacion" from resultado r;

select * from vistaResultados;

describe resultado;

select * from usuario
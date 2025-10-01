
CREATE DATABASE Solactive_PriceValidation;
USE Solactive_PriceValidation;


create table extraccion (
    id_extraccion int auto_increment primary key,
    vendor varchar(50),
    precio float,
    emisor varchar(50),
    timestamp datetime,
    security varchar(50),
    ticker varchar(50),
    ticker_universal varchar(50)
);

create table dv (
    id_dv int auto_increment primary key,
    consulta_bd varchar(50),
    mostrar_excel varchar(50),
    editar_bd varchar(50),
    mostrar_metricas varchar(50),
    generar_reporte varchar(50),
    generar_alerta varchar(50)
);

create table gdv (
    id_gdv int auto_increment primary key,
    reglavol varchar(50),
    metricavendan varchar(50),
    crear_regla varchar(50),
    calcmetrica varchar(50),
    hacer_val varchar(50),
    confeqpta varchar(50),
    csv varchar(50),
    enviarnoti varchar(50),
    volmanual varchar(50),
    nueva varchar(50)
);

create database ventaTienda;

use ventaTienda;

CREATE TABLE Cliente(
  idCliente INT AUTO_INCREMENT PRIMARY KEY,
  documentoCliente VARCHAR(50) NOT NULL,
  nombreCliente VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE,
  telefono VARCHAR(50),
  fechaRegistro timestamp default current_timestamp
);
alter table cleinte add foreign key (idCliente) references usuario(idUsuario);

alter table cliente add direccionCLiente varchar(50);
alter table cliente modify telefono varchar(15) not null;
describe cliente;
alter table cliente drop column direccionCliente;
describe cliente;
alter table cliente change email emailCliente varchar(50) unique;

create table pedido(
idPedido int auto_increment primary key,
idClienteFK int,
fechaPedido date,
totalPedido decimal (10,2)
);

alter table pedido   #que va a cambiar la tabla 
add constraint FKclientepedido #le estas añadiendo una restriciion
foreign key(idClienteFK)  # difinie la clave forania 
references cliente(idCliente);    #se relaciona 

create table usuario(
idUsuario int auto_increment primary key,
tipo varchar(30)
);

create table detalleproducto(
idDetalleprodcuto int not null,
idProductoFK int not null,
idPedidoFK int not null,
primary key (idDetalleprodcuto),
foreign key (idPedidoFK) references pedido(idPedido),
foreign key (idProductoFK) references producto(idProducto)
);

create table producto (
    idProducto int not null,
    tipoProducto int not null,
    primary key (idProducto)
);

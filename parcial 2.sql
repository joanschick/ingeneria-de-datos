create database TechNova;
use TechNova;
CREATE TABLE Departamento (
id_departamento INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DECIMAL(12,2) CHECK (presupuesto > 0)
);
CREATE TABLE Empleado (
id_empleado INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
cargo VARCHAR(50),
salario DECIMAL(10,2) CHECK (salario > 0),
id_departamento INT,
fecha_ingreso DATE,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);
CREATE TABLE Proyecto (
id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
fecha_inicio DATE,
presupuesto DECIMAL(12,2),
id_departamento INT,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);
CREATE TABLE Asignacion (
id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
id_empleado INT,
id_proyecto INT,
horas_trabajadas INT CHECK (horas_trabajadas >= 0),
FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

#Reto 5 – Reasignación de empleados
/*Mueve todos los empleados de un departamento a otro, siempre que el destino tenga más
presupuesto.
• Procedimiento: ReasignarEmpleados(dep_origen, dep_destino)
• Función: PresupuestoDepartamento(id)
• Trigger: registrar cada cambio de departamento.
• Transacción: si el destino no tiene más presupuesto → ROLLBACK.*/

insert into Departamento(id_departamento,nombre,presupuesto)
values 
("","paginasWeb",1000000.00),
("","dataAnalitic",2500000),
("","software",2000000)
;
select * from Departamento;
insert into Empleado(id_empleado,nombre,cargo,salario,id_departamento,fecha_ingreso)
values
("","pepe","jefe",20000,"2","2023/05/02"),
("","juan","analista",6000,"2","2020/05/29"),
("","nicol","diseñador",1000,"1","2024/12/01"),
("","sebastian","analista",6500,"2","2020/06/31"),
("","daniel","ingSofware",5500,"3","2021/01/10")
;
update Empleado set nombre="pepa"
where id_empleado=1;
select * from Empleado;

#1

update Empleado set id_departamento=3
where id_departamento=1;
select*from Departamento;
#2
DELIMITER $$
create function consultaPresupuesto(presupuesto int)
returns int
deterministic
begin
declare resultado varchar(255);
select d.presupuesto 
into resultado from presupuesto d inner join departament d on d.nombre where d.presupuesto = presupuesto; 
return resultado;
end $$
DELIMITER ;

#3
DELIMITER $$
create trigger regDepar
before insert
on Empleado
for each row 
begin
	if salario<D.presupuesto then
        set message_text='no podemos pagar tu salario';
	end if;
end $$
DELIMITER ;

show triggers;

#4
create function presupuestoDep(departpre varchar(50))
 returns int
deterministic
begin
update Empleado set id_departamento=3
where id_departamento=1;
	if id_departamento,presupuesto<E.salario;
select*from Departamento;
rollback
end $$

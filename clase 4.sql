# consulta especificas
#alias
describe estudiantes;
select idEstudiantes as "codigo estudiante", nomEstudiante as "nombre estudiante" from estudiantes;
#condicionadores logicos and, or y no otros son <,>,=
# "*" sirve para coger todo las lineas de una tabla especifica

#igual
select * from estudantes where nomEstudiante="paula vargas";

#diferente != <>
select * from estudantes where semestre<>"4";
select * from estudantes where nomEstudiante!="paula vargas";

#between
select * from estudantes where semestre between 2 and 5;

/*patron like patrones de texto campos varchar 
% -> representa cero, uno o muchos caracter
se usa "like" ya que es la forma de busacar 
empiece por cierto caracteres   xxxxx%
termine con ciertos caracteres   xxxxx%
que contega ciertos caracteres   %xxxx%
un caracter like x-X
*/

select * from estudiantes where carrera like "in%";
select * from estudiantes where carrera like "%generia";
select * from estudiantes where carrera like "%a%";
select * from estudiantes where carrera not like "%generia";


#in algo que etsa listo de una tabla
select * from estudiantes where semestre in (3,4,5,6);
select * from estudiantes where carrera in ("veterinaria","economia");

#ad or not
select * from estudiantes where semestre=5 and carrera="veterinaria";
select * from estudiantes where semestre=5 or carrera="veterinaria";
select * from estudiantes where not semestre=5 and carrera="veterinaria";
select * from estudiantes where semestre=5 or not carrera="veterinaria";

#organizar de mayo a menos y visebersa 
#asc = asendente y desc = desendente
select * from estudantes order by nomEstuante asc;
select * from estudantes order by nomEstuante desc;

/*agrupar  normalemnete se acompañan de funciones calculadas o de agregacion 
count() contarregistro
sum() sumar
avg() promedio
max(int) maximo
min(int) minimo
select * from columna funcionagregacion() from tabla group by camp
*/
select * from estudiantes group by semestre
/*
****UNIONES*****
*/

select * from alumnos;
select * from carrera;
SELECT * FROM datos;

/*
Toma como referencia los valores que tengan concidencia en ambas tablas
*/
SELECT * FROM datos dat
join alumnos al on 
	dat.id_alumno = al.id_alumno
join carrera carr on 
	al.id_carrera = carr.id_carrera 

SELECT * FROM alumnos al join datos dat on dat.id_alumno = al.id_alumno WHERE al.id_carrera = 12;

/*
LEFT JOIN // toma com referencia los valores de la tbal izquierda
*/

SELECT * FROM alumnos al left join datos dat on al.id_alumno = dat.id_alumno WHERE al.id_carrera = 12;
/*
RIGHT JOIN // Toma com referencia los registros de la tabla derecha
*/
SELECT * FROM datos dat RIGHT JOIN alumnos al on dat.id_alumno = al.id_alumno WHERE al.id_carrera = 12;


/*
JOIN CON GROUP BY
*/

SELECT al.nombre, carr.carrera FROM datos dat 
LEFT JOIN
	alumnos al ON dat.id_alumno = al.id_alumno 
LEFT JOIN
	carrera carr ON al.id_carrera = carr.id_carrera
WHERE dat.edad > 18
GROUP BY al.nombre, carr.carrera; 

use escuela;
/*JOIN AND UPDATE*/
UPDATE alumnos SET nombre = 'Cambio'
FROM 
	alumnos al
JOIN carrera carr on al.id_carrera = carr.id_carrera
WHERE carr.id_carrera = 12;


/*JOIN DELETE */

DELETE alumnos 
FROM 
	alumnos al
JOIN carrera carr on al.id_carrera = carr.id_carrera
WHERE
	carr.id_carrera = 12;


/*
*******ALTER TABLE ***********
*/
SELECT * FROM carrera;


ALTER TABLE carrera
add cupo_limitado int

ALTER TABLE carrera
DROP COLUMN cupo_limitado

/*CAMPOS CALCULADOS*/
ALTER TABLE carrera
ADD cupo_minimo int

ALTER TABLE carrera
ADD cupo_maximo int

 

ALTER TABLE carrera
DROP COLUMN suma;

ALTER TABLE carrera
ADD suma as (cupo_minimo + 100 );

ALTER TABLE carrera
ADD resta as (cupo_minimo - 100);

/*
Los campos que intervienen en campos calculados no se pueden eliminar
*/

ALTER TABLE carrera
DROP COLUMN cupo_minimo;


/*
SUBCONSULTAS
*/

use escuela;

SELECT * FROM carrera WHERE carrera.id_carrera = ( SELECT id_carrera FROM carrera carr WHERE id_carrera = 12 );

/*
	Subconsultas con in y not in
*/

use libreria;

SELECT * FROM libros;

SELECT * FROM libros WHERE id_libro in (2,4,6);

SELECT * FROM libros WHERE id_libro not in (2,4,6);

SELECT * FROM libros WHERE id_libro in ( SELECT id_libro FROM libros WHERE precio_venta >300 );

SELECT * FROM libros WHERE id_libro not in ( SELECT id_libro FROM libros WHERE precio_venta >300 );
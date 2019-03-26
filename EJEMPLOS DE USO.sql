/*Funciones de agregado*/
SELECT * FROM libros;
/*COUNT*/
SELECT COUNT(titulo) from libros WHERE precio_venta > 200;

/*SUM*/
SELECT SUM(precio_venta) FROM libros;


/*MAX*/
SELECT MAX(precio_compra) as caro from libros;
SELECT MAX(precio_venta) as caro from libros;
SELECT MIN(precio_compra) as barato from libros;
SELECT MIN(precio_venta) as barato from libros;




use libreria2;
SELECT * FROM libros;
/*Concatenacion*/

SELECT 'libro: '+ titulo FROM libros; 

/*ALIAS*/
SELECT precio_venta AS ESTE_ES_EL_PRECIO_DE_VENTA ,precio_compra from libros;



/*************Funciones***************/
/*Substring*/
/*Hola a todos(Obtiene partes de un string)
	Se indica la posicion inicial y cauntos caracters a tomar apartir de esa posicion
*/
SELECT SUBSTRING('Hola a todos',8,5);


/*Convertir numero a string*/
SELECT STR(123);

/*Remplazar una frase de un string+
	Paametros(Frase,posicion inicial, Numero de caracteres)
*/
select STUFF('Tutoriales hackro',12,6,'Mexico');

/*Lomfigutd de cadena*/
SELECT LEN('Tutoriales Mexico');

/*Conversion de digito a ascii*/
SELECT CHAR(69);

/*Conversion de MAyusculas a Minusculas*/
SELECT LOWER('MEXICO');

/*Conversion de minusculas a MAYUSCULAS*/
SELECT UPPER('tutoriales mexico');

/*Eliminar espacios de la izquierda*/
SELECT LTRIM('   Tutoriales Mexico          ');

/*Eliminar espacios de la derecha*/
SELECT RTRIM('         Tutoriales Mexico        ');

/*buscar y remplazar cadena*/

SELECT REPLACE('Hola a atodos saludos','todos','a ti');

/*Inertir una palabra*/
SELECT REVERSE('Jose');

/*Buscar concidencias*/
SELECT PATINDEX('%todos%','Hola a todos desde mexico');


/*Repeticion de cadenas*/
SELECT REPLICATE('HOOla',100);

/*Poner espacio en tre las cadenas*/
SELECT('Tutoriales'+SPACE(10)+'Mexico');

/*Ordenamiento ORder BY*/

USE libreria2;

SELECT * FROm libros;

/*ORDER BY*/
SELECT precio_venta FROM libros ORDER BY titulo ASC;
SELECT titulo FROM libros ORDER BY titulo DESC;
SELECT * FROM libros 
ORDER BY titulo DESC, precio_venta ASC;


/*Operadores logicos
NOT
AND
OR
*/
use libreria;
SELECT * FROM libros;

/* muestra todos excepto el id 1*/
SELECT * FROM libros WHERE not id_libro = 1;


/*Anidando WHERE con AND todas las condicones debe cumplirse*/
SELECT * FROM libros WHERE precio_venta = 236 AND precio_compra = 189.25;

/*Anidando condiciones con el WHERE*/
SELECT * FROM libros WHERE id_libro = 1 OR id_libro = 6;


SELECT * FROM libros WHERE not id_libro = 1 OR nombre = 'aura';


/*Operadores 
is null
is not null( Esta opcion no s nada recome3ndable, pueden usars otras convinaciones del not con el campo)

between (Resultados en tre los valores indicados)

*/
SELECT * FROM libros;
SELECT * FROM libros WHERE nombre is null;
SELECT * FROM libros WHERE nombre is not null;

/*Buscando rango de resultados*/
SELECT * FROM libros WHERE precio_venta > 200 and precio_venta < 300;

/*la mejor opcion para busqueda de rango de resultados*/
SELECT * FROM libros WHERE precio_venta BETWEEN 200 and 300;


/*Operadores para cadenas
LIKE
NOT LIKE->negacion del like


*/
SELECT * FROM libros WHERE nombre LIKE '%de%';/*Los libros que tengan esa palabra*/

SELECT * FROM libros WHERE nombre NOT LIKE '%de%';/*Obtiene todoes excepto los que contengan 'de'*/
SELECT * FROM libros WHERE NOT nombre LIKE '%de%';

SELECT * FROM libros WHERE nombre LIKE 'el%';/*Busca los libros que empiecen con la palabra 'el'*/ 

/*Busca los libros que terminen con 'da'*/
SELECT * FROM libros WHERE nombre LIKE '%da';

/*Uso de comodin* '_'(buscara la palabra con las concidencias que puedan entrar en el comidin)*/
SELECT * FROM libros WHERE nombre LIKE '%la ma_ia de las matematicas%';


/**
COUNT( ) cuenta registros
el count no cuenta datos NULL
*/

SELECT *FROM libros;

SELECT COUNT(*) FROM libros;

SELECT COUNT(id_libro) as cantidad FROM libros WHERE id_libro > 10;

/*METODOS
COUNT ->cuenta
****solo funciona con numeros****
SUM -> suma(solo numeros)
AVG -> saca el promedio
*/

SELECT * FROM usuarios;

SELECT COUNT(*) FROM usaurios;

SELECT sum(edad) FROM usuarios WHERE sexo = 'F'; /* suma edades del sexo femeninno*/
SELECT AVG( edad ) FROM usuarios WHERE sexo = 'M';


/*	
****Cadenas y numeros*******
	count -> cuenta los registros diferentes de null
	MIN -> obtiene el valro minimo
	MAX -> obtiene el valor maximo
*/

SELECT MIN(edad) FROM usuarios WHERE sexo = 'M';

SELECT MAX(edad) FROM usuarios WHERE sexo = 'F';

SELECT min(nombre) FROM usuarios; /* El primer nombre en orden alfabetico*/

SELECT MAX(nombre) FROM usuarios;/* El ultimo nombre en orden alfabetico*/
SELECT * FROM usuarios ORDER BY nombre;



/*
	WHERE realiza filtro por registro
	HAVING filtra por grupo de registros
*/

SELECT nombre, AVG(edad) FROM usuarios WHERE sexo = 'F' 
GROUP BY nombre
HAVING AVG(edad) > 20;


/*
COMPUTE depreciado en sqlserver 2012 +
*/
SELECT * FROM usuarios;

SELECT MIN(edad) FROM usuarios WHERE sexo = 'F';

SELECT nombre, edad FROM usuarios WHERE sexo = 'F' compute MIN(nombre), SUM( edad);


/*
Distinct->disinto = eliminara repeticiones de la consulta

*/

SELECT * FROM usuarios;
SELECT DISTINCT nombre FROM usuarios ORDER BY nombre;
SELECT DISTINCT edad FROM usuarios ORDER BY edad;

SELECT SUM(edad) FROM usuarios;
SELECT SUM( DISTINCT edad) FROM usuarios;

/*
TOP
*/

SELECT * FROM usuarios;
/*Muestra el numero de registros indicados en el TOP */
SELECT TOP 4 * FROM usuarios;

/*Los primeros 4*/
SELECT TOP 4 * FROM usuarios ORDER BY id_usuario;

/* Los ultimos 4*/
SELECT TOP 4 * FROM usuarios ORDER BY id_usuario DESC;









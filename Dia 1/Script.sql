create table fabricante (
    codigo int primary key,
    nombre varchar(100) not null
);


create table producto (
codigo int primary key,
    nombre varchar(100) not null,
    precio double precision not null,
    codigo_fabricante int not null,
    foreign key (codigo_fabricante) references fabricante (codigo)
); 

select * from fabricante;

insert into fabricante (codigo, nombre) values
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');

select * from fabricante;


insert into producto (codigo, nombre, precio, codigo_fabricante) values
(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185, 7),
(5, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 'Monitor 24 LED Full HD', 202, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portátil Yoga 520', 559, 2),
(9, 'Portátil Ideapad 320', 444, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- Consultas sobre UNA TABLA 

-- Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.

select nombre , precio from producto;

-- Lista todas las columnas de la tabla producto.
select * from producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares
-- estadounidenses (USD).
select nombre, precio, precio * 1.1 as precio_usd from producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares
-- estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre
-- de producto, euros, dólares.
select nombre as "nombre de producyto",
precio as euros,
(precio  * 1.1) as dolares 
from producto; 

-- Lista los nombres y los precios de todos los productos de la tabla producto,
-- convirtiendo los nombres a mayúscula.
select upper(nombre) as "nombre de producto",
precio
from producto; 

-- Lista los nombres y los precios de todos los productos de la tabla producto,
-- convirtiendo los nombres a minúscula.
select lower(nombre) as "nombre de producto",
precio
from producto; 

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna
-- obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select  nombre as "nombre del fabricante",
    upper(substring(nombre, 1, 2)) as "primeros dos caracteres"
from fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto,
-- redondeando el valor del precio.
select nombre as "nombre del producto",
    round(precio) as precio_redondeado
from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto,
-- truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre AS "nombre del producto",
    floor(precio) AS precio_truncado
from producto;

-- Lista el identificador de los fabricantes que tienen productos en la
-- tabla producto. eliminando los identificadores que aparecen repetidos
select distinct codigo_fabricante
from producto;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante 
order by nombre asc;

-- Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante
order by nombre desc;

-- Lista los nombres de los productos ordenados en primer lugar por el
-- nombre de forma ascendente y en segundo lugar por el precio de forma
-- descendente.
select nombre, precio from producto;
order by 
nombre asc,
precio desc;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante 
limit 5; 

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante.
-- La cuarta fila también se debe incluir en la respuesta.
select * from fabricante 
limit 2 offset 3;

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las
-- cláusulas ORDER BY y LIMIT)
select nombre, precio 
from producto 
order by 
precio asc 
limit 1;

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las
-- cláusulas ORDER BY y LIMIT)
select nombre, precio 
from producto 
order by 
precio desc 
limit 1;

-- Lista el nombre de todos los productos del fabricante cuyo identificador de
-- fabricante es igual a 2.
select nombre from producto 
where codigo_fabricante = 2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre from producto 
where precio <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre from producto 
where precio >= 400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a
-- 400€.
select nombre from producto 
where precio <= 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar
-- el operador BETWEEN.
select nombre, precio from producto 
where precio >= 80 and precio <= 300;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando
-- el operador BETWEEN.
select nombre, precio from producto 
where precio between 60 and 200;

--  Lista todos los productos que tengan un precio mayor que 200€ y que el
-- identificador de fabricante sea igual a 6.
select nombre, precio from producto 
where precio > 200 and codigo_fabricante = 6;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5.
-- Sin utilizar el operador IN.
select nombre, precio from producto 
where codigo_fabricante = 1 
or codigo_fabricante = 3 
or codigo_fabricante = 5;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5.
-- Utilizando el operador IN.
select nombre, precio from producto 
where codigo_fabricante in (1, 3, 5); 

-- Lista el nombre y el precio de los productos en céntimos (Habrá que
-- multiplicar por 100 el valor del precio). Cree un alias para la columna que
-- contiene el precio que se llame céntimos.
select nombre, precio * 100 as céntimos from producto;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante 
where nombre like 'S%';

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante 
where nombre like '%e';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante 
where nombre like '%w%';

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante 
where length(nombre) = 4;

-- Devuelve una lista con el nombre de todos los productos que contienen la
-- cadena Portátil en el nombre.
select nombre from producto 
where nombre like '%Portátil%';

-- Devuelve una lista con el nombre de todos los productos que contienen la
-- cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto 
where nombre like '%Monitor%' and precio < 215; 

-- 36. Lista el nombre y el precio de todos los productos que tengan un precio
-- mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en
-- orden descendente) y en segundo lugar por el nombre (en orden
-- ascendente).
select nombre, precio from producto 
where precio >= 180 
order by precio desc,
nombre asc;


-- CONSULTAS MULTITABLA

-- Devuelve una lista con el nombre del producto, precio y nombre de
-- fabricante de todos los productos de la base de datos.
select producto.nombre as nombre_producto, producto.precio,
fabricante.nombre as nombre_fabricante 
from producto 
join fabricante on producto.codigo_fabricante = fabricante.codigo;

-- Devuelve una lista con el nombre del producto, precio y nombre de
-- fabricante de todos los productos de la base de datos. Ordene el resultado
-- por el nombre del fabricante, por orden alfabético.
select producto.nombre as nombre_producto, 
       producto.precio, 
       fabricante.nombre as nombre_fabricante
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
order by fabricante.nombre asc; 

-- Devuelve una lista con el identificador del producto, nombre del producto,
-- identificador del fabricante y nombre del fabricante, de todos los productos
-- de la base de datos.
select 
    p.codigo as product_id, 
    p.nombre as product_name, 
    m.codigo as manufacturer_id, 
    m.nombre as manufacturer_name
from producto p
join fabricante m on p.codigo_fabricante = m.codigo; 

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante,
-- del producto más barato.
SELECT producto.nombre AS nombre_producto, 
       producto.precio, 
       fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC
LIMIT 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante,
-- del producto más caro.
SELECT producto.nombre AS nombre_producto, 
       producto.precio, 
       fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT producto.nombre AS nombre_producto, 
       producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan
-- un precio mayor que 200€. 
SELECT producto.nombre AS nombre_producto, 
       producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial' 
  AND producto.precio > 200;

 -- Devuelve un listado con todos los productos de los
-- fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT producto.nombre AS nombre_producto, 
       producto.precio, 
       fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
   OR fabricante.nombre = 'Hewlett-Packard'
   OR fabricante.nombre = 'Seagate';

-- Devuelve un listado con todos los productos de los
-- fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT producto.nombre AS nombre_producto, 
       producto.precio, 
       fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- Devuelve un listado con el nombre y el precio de todos los productos de los
-- fabricantes cuyo nombre termine por la vocal e.
SELECT producto.nombre AS nombre_producto, 
       producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%e';

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo
-- nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre AS nombre_producto, 
       producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%w%';

-- Devuelve un listado con el nombre de producto, precio y nombre de
-- fabricante, de todos los productos que tengan un precio mayor o igual a
-- 180€. Ordene el resultado en primer lugar por el precio (en orden
-- descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.nombre AS nombre_producto, 
       producto.precio, 
       fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, 
         producto.nombre ASC;

-- Devuelve un listado con el identificador y el nombre de fabricante,
-- solamente de aquellos fabricantes que tienen productos asociados en la
-- base de datos.
SELECT DISTINCT fabricante.codigo AS fabricante_id, 
                fabricante.nombre AS nombre_fabricante
FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante;



-- Desarrollado por Jorge Mozo C.C 1.099.738.869 




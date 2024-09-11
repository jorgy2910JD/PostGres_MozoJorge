create database opeAdvance;

-- TABLA MUNICIPIO
create table municipio (
	region varchar (100),
	departamento varchar (100),
	codigo_departamento int,
	municipio varchar (100),
	codigo_municipio int
)

-- TABLA PERSONAS 
create  table personas (
	nombre varchar (100),
	apellido varchar (100),
	municipio_nacimiento varchar (100),
	municipio_domicilio varchar (100)
) 

-- Ver las tablas  creadas 
select table_name 
from information_schema.tables 
where table_schema = 'public'; 



-- importar archivos txt

-- inserciones de los municipios 
copy municipio (region, departamento, codigo_departamento, municipio, codigo_municipio) from '/home/p4student/lab_regiones_municipios_departamentos.txt' delimiter ';' csv header;

-- Inserciones de Personas 
 copy personas (nombre, apellido, municipio_nacimiento, municipio_domicilio) from  '/home/p4student/lab_personas.txt' delimiter ';' csv header; 


-- #### CONSULTAS #####

-- Crear una vista que muestre las regiones con sus respectivos departamentos. 
-- En esta vista generar una columna que muestre la cantidad de municipios por cada departamento 

create view ver_regiones_departamentos as 
select region, departamento, codigo_departamento, 
count(municipio) as cantidad_municipios 
from municipio
group by region, departamento, codigo_departamento; 

-- Crear una vista que muestre  los departamentos con sus respectivos municipios,
-- En esta vista generar la columna de código de municipio completo, esto es, 
-- codigo de dpto concatenado con el codigo de municipio, ejemplo: 
-- Código Santander = 68
-- Código Girón = 307 
-- Código de municipio completo = 68307 

create view ver_departamentos_municipios as 
select departamento, municipio,
concat (LPAD(codigo_departamento::text, 2, '0'),LPAD(codigo_municipio::text, 3,'0')) as codigo_municipio_completo 
from municipio;

-- Agregar dos columnas a la tabla municipios que permitan llevar el conteo de personas que viven y trabajan
-- en cada municipio , y con base  en esas columnas, implementar un disparador  que actualice esos conteos toda 
-- vez  que se agregue, modifique o elimine un dato de municipio de naciomiento y/o domicilio.
--Agregar las columnas de conteos a la vista que muestra la lista  de departamentos y municipios(modificar vista).

ALTER TABLE municipio
ADD COLUMN conteo_viven INT DEFAULT 0,
ADD COLUMN conteo_trabajan INT DEFAULT 0; 

-- Trigger al momento de actualizar

create or replace fuction actualizar_conteo_insert() returns trigger as $$ 
begin 
	update municipios
	set conteo_viven = conteo_viven + 1
	where municipio = new.municipio_domicilio; 
return new;
end; 













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

CREATE DATABASE logistica; -- crea la bbdd
DROP DATABASE logistica; -- elimina la bbdd
USE logistica; -- selecciona la bbd

CREATE TABLE camion ( -- crea la tabla
	idCamion integer not null auto_increment primary key,
    matricula varchar(10) not null,
    modelo varchar(45),
    tipo varchar(45),
    potencia varchar(10)
);

ALTER TABLE camion ADD COLUMN `year` year; -- modifica la tabla (añade nueva columna)
ALTER TABLE camion MODIFY COLUMN modelo varchar(15); -- modifica la tabla (modifica columna)
describe camion; -- muestra la estructura de la tabla
ALTER TABLE camion DROP COLUMN `year`; -- modifica la tabla (elimina columna)
ALTER TABLE RENAME COLUMN original to nuevo -- modifica el nombre de la columna

CREATE TABLE camionero (
	idCamionero int(5) not null auto_increment,
    dni varchar(10) not null,
    nombre varchar(20),
    telefono varchar(10) unique,
    direccion varchar(100),
    salario float(8,2),
    poblacion varchar(30),
    primary key(idCamionero)
);

CREATE TABLE camionero_camion (
	idCamion_camionero integer not null auto_increment primary key,
	fk_camionero int,
    fk_camion int,
    foreign key(fk_camionero) references camionero(idCamionero),
    foreign key(fk_camion) references camion(idCamion)
);

CREATE TABLE provincia (
	idProvincia integer not null auto_increment primary key,
    nombre varchar(45) not null
);

CREATE TABLE paquete (
	idPaquete integer not null auto_increment primary key,
    codigo varchar(20) not null,
    descripcion varchar(150),
    destinatario varchar(45),
    direccionDestinatario varchar(45),
    fk_camionero int,
    fk_provincia int,
    foreign key(fk_camionero) references camionero(idCamionero),
    foreign key(fk_provincia) references provincia(idProvincia)
);

-- CRUD = INSERT, UPDATE, DELETE, SELECT

INSERT INTO provincia(nombre) values('madrid'), ('barcelona'),('toledo'),('valencia'),('la coruña');

SELECT * FROM provincia;

INSERT INTO camionero(dni, nombre, telefono, direccion, salario, poblacion) values
('12345678A', 'Pepe', '606123123', 'calle ancha', 30000, 'madrid'),
('12345678B', 'Jose', '606222333', 'calle estrecha', 25000, 'valencia');

SELECT * FROM camionero;

describe paquete;

INSERT INTO paquete(codigo, descripcion, destinatario, direccionDestinatario, fk_camionero, fk_provincia) values
('222C', 'fragil', 'Luis', 'vigo', 1, 5),
('444D', 'duro', 'Ramon', 'alicante', 2, 4);

SELECT * FROM paquete;

UPDATE paquete SET descripcion='blando', destinatario='Roberto' -- modifica todas las filas
WHERE idPaquete=1; -- modifica unicamente las filas que coincidan con la condicion

-- operadores logicos = AND, OR, NOT

UPDATE paquete SET descripcion='paquete inflamable'
WHERE destinatario='Ramon' AND direccionDestinatario='alicante';


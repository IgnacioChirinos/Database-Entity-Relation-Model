CREATE TABLE "Proyecto".Volquete (
	Placa VARCHAR (10) PRIMARY KEY,
	marca VARCHAR(20) NOT NULL,
	modelo VARCHAR(20) NOT NULL
);
CREATE TABLE "Proyecto".Trabajador (
	DNI VARCHAR (10) ,
	nombre VARCHAR(60) ,
	apellidos VARCHAR(60),
	correo VARCHAR(60) ,
	clave VARCHAR(60) ,
	licencia VARCHAR(10),
	PRIMARY KEY (dni,nombre,apellidos,correo,clave)
);

CREATE TABLE "Proyecto".Conductor (
	"T.DNI" VARCHAR (10) PRIMARY KEY,
	"T.nombre" VARCHAR(60) NOT NULL,
	"T.apellidos" VARCHAR(60) NOT NULL,
	"T.correo" VARCHAR(60) NOT NULL,
	"T.clave" VARCHAR(60) NOT NULL
    );

ALTER TABLE "Proyecto".Conductor
ADD CONSTRAINT FK_Conductor 
FOREIGN KEY  ("T.DNI","T.nombre","T.apellidos","T.correo","T.clave")
REFERENCES "Proyecto".trabajador(dni,nombre,apellidos,correo,clave);

CREATE TABLE "Proyecto".Administrador (
	"T.DNI" VARCHAR (10) PRIMARY KEY,
	"T.nombre" VARCHAR(60) NOT NULL,
	"T.apellidos" VARCHAR(60) NOT NULL,
	"T.correo" VARCHAR(60) NOT NULL,
	"T.clave" VARCHAR(60) NOT NULL
    );
ALTER TABLE "Proyecto".Administrador
ADD CONSTRAINT FK_Administra
FOREIGN KEY  ("T.DNI","T.nombre","T.apellidos","T.correo","T.clave")
REFERENCES "Proyecto".trabajador(dni,nombre,apellidos,correo,clave);


--CREATE TABLE "Proyecto".Unidad (
--	Nombre_unidad VARCHAR (20) PRIMARY KEY
--);

CREATE TABLE "Proyecto".Contrato (
	"Nombre_unidad" VARCHAR (20),
	Fecha_ingreso DATE ,
	RUC_empresa VARCHAR(11),
	"V.placa" VARCHAR (10) NOT NULL,
	Fecha_inicio DATE NOT NULL,
	Fecha_fin DATE NOT NULL,
	precio_unidad FLOAT NOT NULL,
	precio_combustible FLOAT NOT NULL,
	"C.DNI" VARCHAR (10) NOT NULL,
	PRIMARY KEY ("Nombre_unidad",RUC_empresa,Fecha_ingreso)
);

ALTER TABLE "Proyecto".Contrato
ADD CONSTRAINT FK_conduce
FOREIGN KEY  ("C.DNI")
REFERENCES "Proyecto".Conductor("T.DNI");
ALTER TABLE "Proyecto".Contrato
ADD CONSTRAINT FK_camion
FOREIGN KEY  ("V.placa")
REFERENCES "Proyecto".Volquete(Placa);


CREATE TABLE "Proyecto".Reporte_carga (
	NroGuia VARCHAR (10) PRIMARY KEY,
	ticket_mina VARCHAR(10) NOT NULL,
	fecha_reporte DATE NOT NULL,
	carga FLOAT NOT NULL,
	"C.unidad" VARCHAR(20) NOT NULL,
	"C.Fecha_ingreso" DATE NOT NULL,
	"C.RUC_empresa" VARCHAR(11) NOT NULL
    );
ALTER TABLE "Proyecto".Reporte_carga
ADD CONSTRAINT FK_reportecarga
FOREIGN KEY  ("C.unidad","C.Fecha_ingreso","C.RUC_empresa")
REFERENCES "Proyecto".Contrato("Nombre_unidad",Fecha_ingreso,RUC_empresa);


CREATE TABLE "Proyecto".Reporte_horas (
	Parte_diario VARCHAR (11) PRIMARY KEY,
	horas TIME NOT NULL,
	descripcion VARCHAR (100) NOT NULL,
	fecha_reporte DATE NOT NULL,
	"C.unidad" VARCHAR(20) NOT NULL,
	"C.Fecha_ingreso" DATE NOT NULL,
	"C.RUC_empresa" VARCHAR(11) NOT NULL
    );

ALTER TABLE "Proyecto".Reporte_horas
ADD CONSTRAINT FK_reportehoras
FOREIGN KEY  ("C.unidad","C.Fecha_ingreso","C.RUC_empresa")
REFERENCES "Proyecto".Contrato("Nombre_unidad",Fecha_ingreso,RUC_empresa);

CREATE TABLE "Proyecto".Reporte_combustible (
	Nro_vale VARCHAR (11) PRIMARY KEY,
	cantidad_agregada FLOAT NOT NULL,
	kilometraje VARCHAR (11) NOT NULL,
	horometro VARCHAR (11) NOT NULL,
	fecha_reporte DATE NOT NULL,
	"C.unidad" VARCHAR(20) NOT NULL,
	"C.Fecha_ingreso" DATE NOT NULL,
	"C.RUC_empresa" VARCHAR(11) NOT NULL
    );

ALTER TABLE "Proyecto".Reporte_combustible
ADD CONSTRAINT FK_reportecomb
FOREIGN KEY  ("C.unidad","C.Fecha_ingreso","C.RUC_empresa")
REFERENCES "Proyecto".Contrato("Nombre_unidad",Fecha_ingreso,RUC_empresa);

CREATE TABLE "Proyecto".Repuestos (
	"V.placa" VARCHAR (10) ,
	NroSerie VARCHAR(11) ,
	pieza VARCHAR(60) NOT NULL,
	precio FLOAT NOT NULL,
	fecha_compra DATE NOT NULL,
	PRIMARY KEY("V.placa",NroSerie)
    );

ALTER TABLE "Proyecto".Repuestos
ADD CONSTRAINT FK_repuestos
FOREIGN KEY  ("V.placa")
REFERENCES "Proyecto".Volquete(Placa);

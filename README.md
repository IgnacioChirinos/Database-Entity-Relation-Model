# Database-Entity-Relation-Model
# Bases de datos I

# Proyecto final del curso

# Profesor: Te ́ofilo Chambilla Aquino

# Integrantes:

# Ignacio Chirinos 100 %


### 1.4. ¿C ́omo resuelve el problema hoy?

#### 1.4.1. ¿C ́omo se almacenan/procesan los datos hoy?

Ahora mismo el almacenamiento de la informaci ́on necesaria para la empresa se hace en Microsoft
Access. Este software es un sistema de gesti ́on de base de datos. Sin embargo, y al no contar con los
conocimientos de base de datos, no se est ́a haciendo el uso adecuado de esta herramienta. Debido
a que buscando el modelo entidad-relaci ́on y el modelo relacional del mismo, se puede observar la
ausencia de estos.

Adem ́as, los datos no se procesan de manera autom ́atica ya que quien se encarga de esto es el
administrador a parte que lo hace de manera manual.

#### 1.4.2. Flujo de datos

La fuente de informaci ́on m ́as importante para la empresa son los reportes, ya que con estos se
obtienen los ingresos (reporte de carga y horas) y gastos (reporte combustible). Esta informaci ́on es
generada cada vez que un volquete realiza viajes, pero no es ingresada a la base de datos hasta que
el chofer que realizo el viaje la env ́ıe al administrador, ya que este ́ultimo es quien tiene acceso a la
base de datos.

Con respecto a los otros datos, estos son ingresados de manera manual por el administrador y no
depende de terceros como es el caso de los reportes.


### 1.5. Descripci ́on detallada del sistema

#### 1.5.1. Objetos de informaci ́on actuales

Los objetos importantes de informaci ́on actuales son los reportes de carga, horas y combustible.
Por otro lado se tiene la informaci ́on de los contratos, en este se establece el precio unitario por gal ́on
de comustible y el precio unitario ya sea por carga(Toneladas, Kg, etc) o por horas adem ́as de la
fecha de inicio y fin del servicio.

#### 1.5.2. Caracter ́ısticas y funcionalidades esperadas

Se espera que ”Transportes Franco”pueda generar las facturas a partir de los resltados de las
consultas a la base de datos. Adem ́as de generar los gastos de la empresa.

#### 1.5.3. Tipos de usuarios existentes/necesarios

```
Administrador: Tiene acceso a todas las tablas adem ́as de tener los permisos de escritura y
lectura.
```
```
Conductor: Tiene solo acceso a las tablas asociadas a los reportea y tiene permisos de escritura
y escritura en las mismas.
```
#### 1.5.4. Tipos de consulta, actualizaciones

Las principales consultas que podr ́ıa hacer la empresa y los trabajadores en la base de datos para
un mejor entendimiento del contexto de las operaciones que se est ́an realizando

1. Consultas:

```
¿Cu ́ales es la cantidad de repuestos que se han necesitado para una operaci ́on?
¿Cuantos litros de combustible se consume en un a ̃no de operaciones?
¿Cu ́al es la carga de operaciones que han tenido cada conductor en el ́ultimo a ̃no?
¿Cu ́antos volquetes han estado en un lapso mayor a dos semanas en contrato?
¿Cu ́al es el costo promedio de combustible que tiene que pagar la empresa por a ̃no?
```

#### 1.5.5. Tama ̃no estimado de la base de datos

Las tablas con m ́as concurrencia de ingreso de datos son las tablas de reportes. La cantidad de
bytes por tupla de cada una de estas tablas es:

```
Tabla Longitud de los atributos Longitud de losregistros
Trabajador 10+60+60+60+60+10 260
Administrador 10+60+60+60+60 250
Conductor 10+60+60+60+60 250
Volquete 10+20+20 50
Contrato 20+4+11+4+4+4+4+10+10 71
Carga 10+10+4+4+20+4+11 63
Horas 11+4+100+4+20+4+11 154
Combustible 11+11+11+4+20+4+11 72
Repuestos 10+11+60+4+4 89
```
```
Cuadro 1: Estimacion de Datos
```
En total la concurrencia estimada para cada tabla es de 30 tuplas mensuales, seg ́un la empresa,
lo que anualmente nos da 360 tuplas para cada tabla. Finalmente se estima que la base de datos
tenga 360 (1259 Bytes) 453 240 bytes al a ̃no.

### 1.6. Objetivos del proyecto

```
Generar una base de datos que cumpla los requerimientos mencionados
```
```
Cumplir con las consultas para la obtenci ́on de los ingresos y los gastos.
```
### 1.7. Referencias del proyecto

La base de datos est ́a basado en la estructura y requerimientos de la base de datos que la empresa
tiene Microsoft Access. Adem ́as de las conversaciones que se tuvo con el administrador de la misma.


### 1.8. Eventualidades

#### 1.8.1. Problemas que pudieran encontrarse en el proyecto

Durante los a ̃nos de actividad que tiene ”Transportes Franco”, ha ocurrido situaciones donde,
por ejemplo, un volquete necesita una revisi ́on t ́ecnica o se necesita de alg ́un cambio de repuesto por
lo que en su tiempo de ausencia lo cubre otro volquete. Lo mismo ocurre con los conductores. Por
otro lado, el ingreso de datos err ́oneos a los reportes son muy frecuentes.

#### 1.8.2. Limites y alcances del proyecto

En el estado actual de Transportes Franco el tama ̃no de la base de datos es simple de manejar
ya que no genera gran cantidad de informaci ́on al a ̃no. Sin embargo, esto va a cambiar a lo largo
del tiempo, lo que involucrar ́a rehacer la estructura de la base datos para moldearse a las nuevas
necesidades.

## 2. Modelo Entidad-Relaci ́on

Para el dise ̃no del modelo ER se tendr ́an en cuenta las siguientes reglas sem ́anticas implementadas
para el dise ̃no de la estructura de la Base de Datos:

### 2.1. Reglas sem ́anticas

```
Los trabajadores pueden ser conductores o administradores, tambi ́en ha ocurrido casos donde el
administrador ha hecho de conductor. Todo trabajador se identifica por su DNI. Las entidades
Conductor y Administrador heredan de la entidad Trabajadores.
```
```
Los volquetes se identifican por la marca que lo produce y el modelo dentro de esta marca
```
```
Los volquetes y el conductor se asocian a un contrato donde est ́an participando. El volquete y
el conductor pueden estar asociados a contratos diferentes al mismo tiempo.
```
```
Los Contratos se identifican por el ruc de la empresa que contrata y la fecha en la que se ha
ingresado el contrato a la base de datos. Adem ́as, de la unidad en la que se pagara este contrato.
Por otro lado, sus atributos son la fecha de inicio y fin del servicio, la unidad por la que se va
a remunerar el servicio y el precio del combustible.
```

```
Los reportes de carga se identifican por su n ́umero de gu ́ıa y est ́a asociado a un contrato,
volquete y conductor.
```
```
Los reportes de horas se identifican por su parte diario y est ́a asociado a un contrato, volquete
y conductor.
```
```
Los reportes de combustible se identifican por su n ́umero de vale y est ́a asociado a un contrato,
volquete y conductor.
```
```
Los repuestos est ́an asociados a un volquete y se identifican por el n ́umero de serie de la pieza
y la placa del volquete asociado.
```
### 2.2. Modelo Entidad-Relaci ́on

### 2.3. Especificaciones y consideraciones sobre el modelo

```
En esta secci ́on se explicar ́a cada parte del modelo relacional.
```
1. Conductor


```
DNI: Todos los conductores se identifican por un DNI que es ́unico.
Nombre: Nombre del conductor.
Apellidos: Apellido del conductor.
Correo: Correo asignado al conductor.
Clave: Clave de acceso para la base de datos
```
2. Volquete

```
Placa: Todos los volquetes se identifican por una placa ́unica.
Marca: Una forma de identificar un grupo de volquetes es mediante su marca.
Modelo: El modelo de un volquete lo distingue de otros aunque sean de la misma marca.
```
3. Repuestos

```
V.Placa: Cada repuesto se asigna a un Volquete identificado por su placa.
N ́umero de Serie: Es un c ́odigo ́unico que permite identificar al repuesto.
Pieza: Se especifica qu ́e repuesto es (llanta, tornillo, etc).
Precio: Cada repuesto tiene un valor por el cual fue adquirido.
Fecha de compra: Se sabe la fecha en la que se compr ́o dicho repuesto.
```
4. Reporte de carga

```
N ́umero de gu ́ıa: El numero con el que se tiene informaci ́on sobre el transporte de la car-
ga.
Ticket Mina: La mina entrega un ticket al conductor que traslada la carga.
Fecha del reporte: Fecha en la que se realiz ́o el reporte.
Carga: Cantidad en toneladas de carga que se traslada.
V.Placa: La placa del volquete asociado al servicio.
T.DNI: DNI del chofer asociado al servicio.
Fecha de inicio: La fecha de inicio del contrato.
Fecha de fin: La fecha de finalizaci ́on del contrato.
U.Nombre de unidad: El tipo de unidad en el que se cobrar ́a el traslado de la carga.
Fecha de ingreso: Fecha en la que se ingresa el contrato a la base de datos.
Precio de unidad: El precio de la unidad acordada que contrata el servicio.
RUC empresa: RUC de la empresa que contrata el servicio.
```
5. Contrato

```
Nombre de unidad: El tipo de unidad en el que se cobrar ́a el servicio.
Fecha de inicio: La fecha de inicio del servicio.
Fecha fin: La fecha de finalizaci ́on del servicio.
Fecha de ingreso: Fecha en la que se ingresa el contrato a la base de datos.
RUC de empresa: Ruc de la empresa que contrata el servicio.
Precio de unidad: El precio de la unidad acordada que contrata el servicio.
Precio de combustible: El precio del combustible.
```
6. Trabajador


```
DNI: Cada trabajador se identifica por un ́unido n ́umero de DNI.
Nombre: Nombre del trabajador.
Apellidos: Apellidos del trabajador.
Correo: Correo asignado al trabajador para ingresar a la web.
Clave: Clave de acceso a la base de datos.
Licencia: Licencia de conducir del trabajador.
```
7. Administrador

```
DNI: Cada administrador se identifica por un ́unido n ́umero de DNI.
Nombre: Nombre del administradorr.
Apellidos: Apellidos del administrador.
Correo: Correo asignado al administrador para ingresar a la web.
Clave: Clave de acceso a la base de datos
```
8. Reporte de horas

```
Parte diario: Permite llevar un registro de las actividades realizadas diariamente.
Horas: Indica la cantidad de horas que demora un volquete en realizar el traslado del material.
Descripci ́on: Descripci ́on sobre el trabajo realizado en dichas horas.
Fecha de reporte: Fecha en la que se crea el reporte.
V.Placa: La placa del volquete asociado al servicio.
T.DNI: DNI del chofer asociado al servicio.
Fecha de inicio: La fecha de inicio del servicio.
Fecha fin: La fecha de finalizaci ́on del servicio.
U.Nombre de unidad: El tipo de unidad en el que se cobrar ́a el servicio.
Fecha de ingreso: Fecha en la que se ingresa el contrato a la base de datos.
Precio de unidad: El precio de la unidad acordada que contrata el servicio.
RUC de empresa: RUC de la empresa que contrata el servicio.
```
9. Reporte de combustible

```
N ́umero de vale: C ́odigo con el que se identifica el llenado de combustible de un volquete.
Cantidad agregada: Indica la cantidad de combustible agragada al volquete.
Kilometraje: Muestra el kilometraje del volquete.
Horometro: Muestra el tiempo de vida del volquete en horas.
Fecha de reporte: Fecha de la creaci ́on del reporte.
V.Placa: La placa del volquete asociado al servicio.
T.DNI: DNI del chofer asociado al servicio.
Fecha de inicio: La fecha de inicio del servicio.
Fecha fin: La fecha de finalizaci ́on del servicio.
U.Nombre de unidad: Tipo de unidad en la que se realizar ́a la paga de los servicios.
Fecha de ingreso: Fecha en la que se ingresa el contrato a la base de datos.
Precio de unidad: El precio de la unidad acordada que contrata el servicio.
RUC de empresa: RUC de la empresa que contrata el servicio.
```

## 3. Modelo Relacional

### 3.1. Modelo Relacional

1. Volquete (Placavarchar(10), marca varchar(20), modelo varchar(20))
2. Trabajador (DNIvarchar(10), nombre varchar(60), apellidosvarchar(60),correovarchar(60),clave
    varchar(60), licencia varchar(10))
3. Conductor (Trabajador.DNIvarchar(10),T.nombre varchar(60) , T.apellidos varchar(60), T.correo
    varchar(60), T.clave varchar(60))
4. Administrador (Trabajador.DNI varchar(10),T.nombre varchar(60), T.apellidos varchar(60),
    T.correo varchar(60), T.clave varchar(60))
5. Contrato (Nombreunidad varchar(20), Fechaingreso date, RUCempresa varchar(11) , Fe-
    chainicio date, Fechafin date, preciounidad float, preciocombustible float, Volquete.Placa
    varchar(10), Conductor.DNI varchar(10))
6. Reportecarga (NroGuiavarchar(10), ticketmina varchar(10), fechaReporte date, carga float,
    Contrato.unidad varchar(20), Contrato.Fechaingreso date, Contrato.RUCempresa varchar(11))
7. Reportehoras (Partediariovarchar(11), horas time, descripci ́on varchar(100), fechaReporte
    date, Contrato.unidad varchar(20), Contrato.Fechaingreso date, Contrato.RUCempresa var-
    char(11))
8. Reporte en combustible (Nrovalevarchar(11), cantidadAgregada float, kilometraje varchar(11),
    horometro varchar(11), fechareporte date, Contrato.unidad varchar(20), Contrato.Fechaingreso
    date, Contrato.RUCempresa varchar(11))
9. Repuestos (Volquete.Placavarchar(10),NroSerievarchar(11), pieza varchar(60), precio float,
    fechacompra date)

### 3.2. Especificaciones de transformaci ́on

#### 3.2.1. Entidades

```
Tabla Volquete
Llave primaria Placa
Llave for ́anea
```
```
Cuadro 2: Tabla Volquete
```

```
Tabla Contrato
```
```
Llave primaria
```
```
Nombreunidad,
Fechaingreso,
RUCempresa
Llave heredada
```
```
Cuadro 3: Tabla Contrato
```
#### 3.2.2. Entidades d ́ebiles

```
Tabla Repuestos
Entidad d ́ebil Repuestos
Entidad fuerte Volquete
Llave primaria V.Placa, Nro-Serie
Llave heredada V.Placa
```
```
Cuadro 4: Tabla Repuestos
```
#### 3.2.3. Entidades superclase/subclases

```
Tabla Trabajador
Superclase Trabajador
Subclases Conductor, Admi-
nistrador
Llave primaria DNI
```
```
Cuadro 5: Superclase Trabajador
```

#### 3.2.4. Relaciones binarias

```
Tabla Reportecarga
Entidades Reportecarga, Contrato
Nombre relaci ́on Tiene
Atributos rela-
ci ́on
Llave primaria RCar.Nrogu ́ıa
```
```
Llaves for ́anea
```
```
Ctr.Fechaingreso,
Ctr.RUCempresa,
Ctr.Nombreunidad
```
```
Cuadro 6: Tabla Reportecarga
```
```
Tabla Reportehoras
Entidades Reportehoras, Per ́ıodo
Nombre relaci ́on Tiene
Atributos rela-
ci ́on
Llave primaria RH.Partediario
```
```
Llaves for ́anea
```
```
Ctr.Fechaingreso,
Ctr.RUCempresa,
Ctr.Nombreunidad
```
```
Cuadro 7: Tabla Reportehoras
```
```
Tabla Reportecombustible
Entidades ReportePer ́ıodo combustible,
Nombre relaci ́on Tiene
Atributos rela-
ci ́on
Llave primaria RCom.Nrovale
```
```
Llaves for ́anea
```
```
Ctr.Fechaingreso,
Ctr.RUCempresa,
Ctr.Nombreunidad
```
```
Cuadro 8: Tabla Reportecombustible
```

```
Volquete
Nombre
del campo
```
```
Dominio PK FK Descripci ́on
```
```
Placa varchar(10) ✓ Placa del volquete
Marca varchar(20) Marca del volquete
Modelo varchar(20) Modelo del volquete
```
```
Cuadro 9: Tabla Volquete
```
```
Repuestos
Nombre del campo Dominio PK FK Descripci ́on
Volquete.Placa varchar(10) ✓ ✓ Placa del volquete
NroSerie varchar(11) ✓ N°serie del Repuesto
pieza varchar(60) nombre del repuesto
precio float Precio del repuesto
fechacompra date Fecha de compra del repues-to
```
```
Cuadro 10: Tabla Repuestos
```
### 3.3. Diccionario de datos

```
Trabajador
Nombre
del campo
```
```
Dominio PK FK Descripci ́on
```
```
DNI varchar(10) ✓ DNI del trabajador
Nombre varchar(60) Nombre del trabajador
Apellidos varchar(60) Apellidos del trabajador
Correo varchar(60) correo del trabajador
Clave varchar(60) Clave de acceso del trabaja-
dor
Licencia varchar(60) licencia de conducior deltrabajador
```
```
Cuadro 11: Tabla Trabajador
```

Conductor
Nombre del campo Dominio PK FK Descripci ́on

(Trabajador) T.DNI varchar(10) ✓ DNI del trabajador
(Trabajador) T.Nombre varchar(60) Nombre del trabajador
(Trabajador) T.Apellidos varchar(60) Apellidos del trabajadorr
(Trabajador) T.Correo varchar(60) correo del trabajador

(Trabajador) T.Clave varchar(60) Clave de acceso del trabaja-dor

(Trabajador) T.Licencia varchar(60) licencia de conducior del
trabajador

```
Cuadro 12: Tabla Conductor
```
Administrador
Nombre del campo Dominio PK FK Descripci ́on

(Trabajador) T.DNI varchar(10) ✓ DNI del trabajador
(Trabajador) T.Nombre varchar(60) Nombre del trabajador
(Trabajador) T.Apellidos varchar(60) Apellidos del trabajador
(Trabajador) T.Correo varchar(60) Correo del trabajador

(Trabajador) T.Clave varchar(60) Clave de acceso del trabaja-dor

(Trabajador) T.Licencia varchar(60) Licencia de conducir del tra-bajador

```
Cuadro 13: Tabla Administrador
```
```
Contrato
Nombre del campo Dominio PK FK Descripci ́on
Nombreunidad varchar(20) ✓ Tipo de unidad a cobrar
Fechaingreso date ✓ Ingreso del contrato
RUCempresa varchar(11) ✓ RUC de empresa
Fechainicio date Ingreso del contrato
Fechafin date Ingreso del contrato
preciounidad float Precio acordado
preciocombustible float Precio acordado
V.placa varchar(20) ✓ Precio acordado
C.DNI varchar(10) ✓ Precio acordado
```
```
Cuadro 14: Tabla Contrato
```

Reportecarga
Nombre del campo Dominio PK FK Descripci ́on

NroGuia varchar(10) ✓

Numero del transporte de la
carga
ticketmina varchar(10) ticket que entrega la mina
fechaReporte date fecha del reporte

carga float

Cantidad en toneladas tras-
ladada
Contrato.Nombreunidad varchar(20) ✓ Tipo de unidad a cobrar

Contrato.Fechaingreso date ✓

Fecha en la que se ingresa el
contrato a la base de datos.
Contrato.RUCempresa varchar(11) ✓ Ruc de la empresa

```
Cuadro 15: Tabla Reportecarga
```
Reportehoras
Nombre del campo Dominio PK FK Descripci ́on

Partediario varchar(11) ✓ Registro de actividades
horas time Horas del traslado

descripci ́on varchar(100) Descripcion del trabajo rea-lizado

fechaReporte date Fecha de crecion del reporte
Contrato.Nombreunidad varchar(20) ✓ Tipo de unidad a cobrar

Contrato.Fechaingreso date ✓ Fecha en la que se ingresa elcontrato a la base de datos.

Contrato.RUCempresa varchar(11) ✓ RUC de la empresa

```
Cuadro 16: Tabla Reportehoras
```
Reportecombustible
Nombre del campo Dominio PK FK Descripci ́on

Nrovale varchar(11) ✓ N ́umero del vale

cantidadAgregada float

Indica la cantidad de com-
bustible agragada al volque-
te
kilometraje varchar(11) Kilometraje del volquete
horometro varchar(11) vida del volquete
fechareporte date fecha de creacion del reporte
Contrato.Nombreunidad varchar(20) ✓ Tipo de unidad a cobrar

Contrato.Fechaingreso date ✓ Fecha en la que se ingresa elcontrato a la base de datos

Contrato.RUCempresa varchar(11) ✓ RUC de la empresa

```
Cuadro 17: Tabla Reportecombustible
```

## 4. Implementaci ́on de la Base de Datos

### 4.1. Creaci ́on de la base de datos

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
FOREIGN KEY ("T.DNI","T.nombre","T.apellidos","T.correo","T.clave")
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
FOREIGN KEY ("T.DNI","T.nombre","T.apellidos","T.correo","T.clave")
REFERENCES "Proyecto".trabajador(dni,nombre,apellidos,correo,clave);


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
FOREIGN KEY ("C.DNI")
REFERENCES "Proyecto".Conductor("T.DNI");
ALTER TABLE "Proyecto".Contrato
ADD CONSTRAINT FK_camion
FOREIGN KEY ("V.placa")
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
FOREIGN KEY ("C.unidad","C.Fecha_ingreso","C.RUC_empresa")
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
FOREIGN KEY ("C.unidad","C.Fecha_ingreso","C.RUC_empresa")
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
FOREIGN KEY ("C.unidad","C.Fecha_ingreso","C.RUC_empresa")
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
FOREIGN KEY ("V.placa")
REFERENCES "Proyecto".Volquete(Placa);

### 4.2. Carga de datos

La carga de datos se realiz ́o por el uso de archivos .csv. Estos se cargaron con el uso de COPY
en sql dando la direcci ́on de los archivos y como est ́an delimitados estos.


### 4.3. Simulaci ́on de datos

Debido a que los datos reales de la empresa contienen informaci ́on confidencial sobre los contratos
que tiene que puede exponerla frente a la competencia. Adem ́as, para respetar la privacidad de los
trabajadores. Se ha determinado el uso de data aleatoria generado por funciones en Exel que permiten
generar tanto n ́umeros como palabra, fechas y horas aleatorias con lo que se pudieron generar hasta
el mill ́on de datos requerido por el proyecto.

COPY "Proyecto".volquete(
placa, marca, modelo)
FROM ’F:\DATA\Volquete1000000.csv’
DELIMITER ’,’
CSV HEADER;

COPY "Proyecto".trabajador(
dni, nombre, apellidos, correo, clave, licencia)
FROM ’F:\DATA\trabajador1000000.csv’
DELIMITER ’,’
CSV HEADER;

COPY "Proyecto".conductor(
"T.DNI", "T.nombre", "T.apellidos", "T.correo", "T.clave")
FROM ’F:\DATA\conductor1000000.csv’
DELIMITER ’,’
CSV HEADER;

COPY "Proyecto".contrato(
"Nombre_unidad", fecha_ingreso, ruc_empresa, "V.placa", fecha_inicio, fecha_fin, precio_unidad, precio_combustible, "C.DNI")
FROM ’F:\DATA\contrato1000000.csv’
DELIMITER ’,’
CSV HEADER;

COPY "Proyecto".reporte_carga(
nroguia, ticket_mina, fecha_reporte, carga, "C.unidad", "C.Fecha_ingreso", "C.RUC_empresa")
FROM ’F:\DATA\reportecarga1000000.csv’
DELIMITER ’,’
CSV HEADER;

COPY "Proyecto".reporte_horas(
parte_diario, horas, descripcion, fecha_reporte, "C.unidad", "C.Fecha_ingreso", "C.RUC_empresa")


FROM ’F:\DATA\Reportehoras1000000.csv’
DELIMITER ’,’
CSV HEADER;

COPY"Proyecto".reporte_combustible(
nro_vale, cantidad_agregada, kilometraje, horometro, fecha_reporte, "C.unidad", "C.Fecha_ingreso", "C.RUC_empresa")
FROM ’F:\DATA\reportecombustible1000000.csv’
DELIMITER ’,’
CSV HEADER;

COPY "Proyecto".repuestos(
"V.placa", nroserie, pieza, precio, fecha_compra)
FROM ’F:\DATA\repuestos1000000.csv’
DELIMITER ’,’
CSV HEADER;

## 5. Optimizaci ́on y Experimentaci ́on

En esta parte se realizar ́a sobre una consulta que represente interese de la empresa. Esto para
medir la eficacia de la base de datos. La consulta se realizar ́a en cuatro vol ́umenes de datos (1k, 10k,
100k, 1M), con y sin indicies con lo que se busca medir que tan efectivo es en el impacto del tiempo
y ver si la propuesta es efectiva.

### 5.1. Consulta SQL para el experimento

#### 5.1.1. Descripci ́on del tipo de consultas seleccionadas

Consulta:
¿Cu ́ales son los repuestos y los trabajadores que los requirieron, en los contratos donde se especifica
que el volquete se le agreg ́o mas de 200 litros de combustible, viajo entre 300 y 400 kil ́ometros y
contaban con una carga mayor a las 20 toneladas?
Justificaci ́on:
Esta consulta le permite a la empresa saber exactamente cu ́anto esta siendo afectada la flota de
camiones en un cierto margen de kilometraje y carga, ya que el combustible se considera como carga
agregada. Con esta informaci ́on, que es tomada en margen temporal desde el inicio de los contratos,
permite a la empresa generar diferentes correlaciones para poder aumentar la eficiencia con la que se
repara los camiones, ya que con esta informaci ́on se puede obtener cuales son las piezas que m ́as fallan


en este margen de kilometrajes y pueden tenerlas de antemano en el taller. Con esto los camiones
pasar ́ıan menos tiempo parados y podr ́ıa realizar m ́as contratos lo cual significara mayor ganancia
para la empresa.

#### 5.1.2. Implementan de consultas en SQL

SELECT DISTINCT pieza,fecha_compra,"C.DNI"
FROM "Proyecto1000".contrato AS T1
LEFT JOIN "Proyecto1000".repuestos AS t2
ON t1."V.placa"=t2."V.placa"
WHERE t1."V.placa" IN (
SELECT "V.placa"
FROM "Proyecto1000".contrato
WHERE ruc_empresa IN(
SELECT t2."C.RUC_empresa"
FROM "Proyecto1000".reporte_combustible AS T1
LEFT JOIN "Proyecto1000".reporte_carga AS t2
ON t1."C.RUC_empresa"=t2."C.RUC_empresa"
WHERE cantidad_agregada>’200’
AND kilometraje BETWEEN ’300’ AND ’400’
AND carga >’20’ ))

### 5.2. Metodologia del experimento

```
Para la experimentaci ́on se seguir ́a los siguientes pasos
```
```
Crear una base de datos que contenga los cuatro esquemas para cada volumen de datos (1k,
10k, 100k, 1M)
```
```
Se desactivar ́a los ́ındices que el programa tiene por defecto para poder probar y comparar
tiempos.
```
```
SET enable_mergejoin to OFF
SET enable_hashjoin to OFF
SET enable_bitmapscan to OFF
SET enable_sort to OFF
```
```
Se utilizar ́a el comando EXPLAIN ANALYZE en la consulta dentro de cada esquema para
poder obtener la informaci ́on.
```

```
Se guardar ́a la data para poder generar gr ́aficos comparativos y cuadros para presentarlo en el
presente documento
```
```
Despu ́es de cada consulta se usar ́a el comando VACUUM FULL para limpiar la cache y tener
una experimentaci ́on que sea afectada por muchas variables
```
```
Por ́ultimos se implementar ́a los ́ındices que requiera la consulta para optimizarla
```
### 5.3. Optimizacion de la consulta

#### 5.3.1. Indices para consulta

CREATE INDEX idex_contrvol ON "Proyecto1000".contrato
USING hash("V.placa")

#### 5.3.2. Planes de indices para consulta 1:

```
Ejecuci ́on para 1K sin ́ındices
```


Ejecuci ́on para 10K sin ́ındices


Ejecuci ́on para 100K sin ́ındices


```
Ejecuci ́on para 1M sin ́ındices
```
El programa PgAdmin debido a un posible cuello de botella debido al procesador no puedo computar
la consulta sin el uso de ́ındices pero se entiende una ineficiencia total.

```
Ejecuci ́on para 1K con ́ındices
```

Ejecuci ́on para 10K con ́ındices


Ejecuci ́on para 100K con ́ındices


Ejecuci ́on para 1M con ́ındices


```
Explicaci ́on de la consulta
```
Sin ́Indices:
Los esquemas en 1k,10k y 100k no muestran diferencias los tres usan dos nested loop inner join
(NLIJ), un nested loop left join y un nested loop semi join. Pero el esquema del 1M no logro gene-
rarse debido a que el CPU ten ́ıa alguna clase de cullo de botella para ejecutarlo
El primer NLIJ une el RUC de las empresas contratistas de las tablas reportecarga y reportecom-
bustible despu ́es pasas para juntarse en un Aggregate. Posteriormente, se realiza el segundo NLIJ
con contratopkey, materializando estoy uni ́endolo con un semi join con la entidad contrato para por
́ultimo hacer un NLIJ con repuestopkey y poder mostrar tanto los conductores como los repuestos.
Este algoritmo es altamente ineficiente porque utiliza JOINs que necesitan una computaci ́on de O(nˆ
2).
Con ́ındices:
Recordar que se hico el uso de un ́ındice (indexcontrato) ya que se realizara b ́usquedas exactas. Los
esquemas de 1k,10k son igual mientras que el esquema de 100k y 1M son diferentes principalmente
en el uso del Gather. Al usar indicies pasa implementar el hash inner join, cuando se conecata las
tablas de combustible, y una hash inner semi join con la tabla contrato lo que significa un costo
computacional de considerablemente menor al de que tiene el NLIJ O(N+M). Finalmente se usa en
NLIJ, pero unirse con nuestro idexcontraro pero para este punto por la cantidad de tulpas que tiene
y por el uso del idexcontrato es altamente eficiente su uso. Por ́ultimo, en la tabla de 1M se usa un
Gather ya que permite el procesamiento en paralelo.

### 5.4. Plataforma de pruebas

```
Sistema Operativo Windows 10 Home
Procesador Intel Core i5 7300hq
RAM 16 GB ddr4 3200 MGHz
PostgresSQL 13.4
pgAdmin 5.7
```
```
Cuadro 18: Tabla de plataforma de pruebas
```

### 5.5. Medicion de tiempos

```
Tiempo de ejecuci ́on sin ́ındices en ms
Ejecuciones 1K 10K 100K 1M
1 11.7 104.86 89305
2 10.8 90 90819
3 11 91.93 89485
4 10 71 91263
5 12.04 95.041 89052
Promedio 11.108 90.5662 89984.8
Desviaci ́on 0.7989 12.34 988.9
```
```
Cuadro 19: Tabla de ejecuci ́on sin ́ındices
```
```
Tiempo de ejecuci ́on con ́ındices en ms
Ejecuciones 1K 10K 100K 1M
1 1.422 10.43 154.418 809.093
2 1.14 15.09 138.894 807.757
3 1.7 19.57 155.55 764.477
4 2.06 15.539 126.45 770.503
5 1.4 11.07 171.242 775.651
Promedio 1.5444 14.3398 149.3108 785.4962
desviacion 0.3497 3.719 17.15 21.30658915
```
```
Cuadro 20: Tabla de ejecuci ́on con ́ındices
```

### 5.6. Resultados y analisis

```
Figura 1: Gr ́afica Query 1
```
```
Se observa como el crecimiento de la gr ́afica sin ́ındices es exponencial a comparaci ́on de cuando
se usan ́ındices que el crecimiento se observa como uno relativamente lineal. De manera anal ́ıtica
se puede decir que la base de datos con ́ındices incluso puede soportar una carga mayor del
mill ́on de datos y que sin ellos esto no es posible.
```

## 6. Concluciones

Para el entendimiento de las necesidades de la empresa en su base de datos primero se tuvo que
entender en que posici ́on se encontraba en la actualidad, que gesti ́on estaban usando y que posibles
problemas les estaban generando. Con el conocimiento inicial y con lo aprendido en el proyecto con-
cluimos que:

```
Los resultados nos llevan a pensar que nuestro modelo relaci ́on es efectivo ya que no presenta
redundancia en los datos e incluso soporto la parte m ́as intensa de las pruebas.
```
```
El nivel de complejidad de la consulta fue el requerido para demostrar la optimizaci ́on de esta,
incluso llevando a la imposibilidad de ver los datos cuando no se usaban ́ındices en la prueba
de 1M, posiblemente por un tema del equipo.
```
```
La base de datos tiene la estabilidad requerida para el tama ̃no de la empresa y con un margen
de crecimiento mayor al imaginable por esta. Esto lograra poder mantener la conexi ́on entre los
conductores y los administradores de manera m ́as efectiva adem ́as de poder realizar constantes
an ́alisis de lo que esta ocurriendo en la flota y como se tiene que actuar para optimizar los
viajes y la carga sobre los conductores.
```

## 7. Anexos

Drive con los 4 dumps de datos
https://drive.google.com/drive/folders/1ekV1yH6uf2HCpEfZfqMqOtiyttQTkWOJ?usp=sharing

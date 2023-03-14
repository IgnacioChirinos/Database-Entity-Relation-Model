# Database-Entity-Relation-Model


En este repositorio se darán los pasos para poder crear una base de datos sql. Usando el método de entidad-relación. Se usará un ejemplo imaginario de una empresa transportista, que cuenta con una base de datos sin ningún desarrollo y solo tienen los datos guardados. Se verá paso a paso cómo se desarrolla el modelo y cómo se implementa la creación de la tablas y como los datos van a ser manejados.

Para ejecutar el código solo se debe descargar el repositorio y descargar los archivos csv con la cantidad de datos que se quiera probar. Ingresar todos los archivos dentro de PostgreSQL en una base de datos que tenga por nombre "Proyecto", en caso de llamarlo de diferente manera se tendra que cambiar el codigo, y proceder a ejecutar los códigos (DataBaseCreation, LoadData, Consulta) en el respectivo orden. El archivo IndexImprovment se usa para el desarrollo experimental.

Link de archivos csv: https://drive.google.com/drive/folders/1ekV1yH6uf2HCpEfZfqMqOtiyttQTkWOJ?usp=sharing

Debemos construir quienes serán los usuarios que usarán la base de datos. A partir de esto podemos formar la funcionalidad de esta

Administrador: Tiene acceso a todas las tablas además de tener los permisos de escritura y lectura.

Conductor: Tiene sólo acceso a las tablas asociadas a los reportes y tiene permisos de escritura y escritura en las mismas.

La base de datos tendrá la capacidad de responder algunas tipos de consultas como las siguientes:

¿Cuales es la cantidad de repuestos que se han necesitado para una operación? ¿Cuántos litros de combustible se consume en un año de operaciones?

¿Cuál es la carga de operaciones que ha tenido cada conductor en el último año? ¿Cuántos volquetes han estado en un lapso mayor a dos semanas en contrato? ¿Cuál es el costo promedio de combustible que tiene que pagar la empresa por año?

**Objetivo del Proyecto**

Generar una base de datos que cumpla los requerimientos mencionados Cumplir con las consultas para la obtención de los ingresos y los gastos.

**Modelo Entidad Relación**

Debemos definir las reglas semánticas con las que trabajaremos en el proyecto.

Los trabajadores pueden ser conductores o administradores, también ha ocurrido casos donde el administrador ha hecho de conductor.

Todo trabajador se identifica por su DNI. Las entidades Conductor y Administrador heredan de la entidad Trabajadores.

Los volquetes se identifican por la marca que lo produce y el modelo dentro de esta marca Los volquetes y el conductor se asocian a un contrato donde están participando.

El volquete y el conductor pueden estar asociados a contratos diferentes al mismo tiempo. Los Contratos se identifican por el ruc de la empresa que contrata y la fecha en la que se ha ingresado el contrato a la base de datos. Además, de la unidad en la que se pagará este contrato.

Por otro lado, sus atributos son la fecha de inicio y fin del servicio, la unidad por la que se va a remunerar el servicio y el precio del combustible.

Los reportes de carga se identifican por su número de guía y está asociado a un contrato, volquete y conductor.

Los reportes de horas se identifican por su parte diario y está asociado a un contrato, volquete y conductor. Los reportes de combustible se identifican por su número de vale y está asociado a un contrato, volquete y conductor.

Los repuestos están asociados a un volquete y se identifican por el número de serie de la pieza y la placa del volquete asociado.

En la carpeta se podrá encontrar el esquemático del modelo entidad relación 

**Modelo relacional**

1. Volquete (Placa varchar(10), marca varchar(20), modelo varchar(20))
1. Trabajador (DNI varchar(10), nombre varchar(60), apellidos varchar(60),correo varchar(60),clave varchar(60), licencia varchar(10))
1. Conductor (Trabajador.DNI varchar(10),T.nombre varchar(60) , T.apellidos varchar(60), T.correo varchar(60), T.clave varchar(60))
1. Administrador (Trabajador.DNI varchar(10),T.nombre varchar(60), T.apellidos varchar(60), T.correo varchar(60), T.clave varchar(60))
1. Contrato (Nombre unidad varchar(20), Fecha ingreso date, RUC empresa varchar(11) , Fecha inicio date, Fecha fin date, precio unidad float, precio combustible float, Volquete.Placa varchar(10), Conductor.DNI varchar(10))
1. Reporte carga (NroGuia varchar(10), ticket mina varchar(10), fecha Reporte date, carga float, Contrato.unidad varchar(20), Contrato.Fecha ingreso date, Contrato.RUC empresa varchar(11))
1. Reporte horas (Parte diario varchar(11), horas time, descripcion varchar(100), fecha Reporte date, Contrato.unidad varchar(20), Contrato.Fecha ingreso date, Contrato.RUC empresa varchar(11))
1. Reporte en combustible (Nro vale varchar(11), cantidad Agregada float, kilometraje varchar(11), horometro varchar(11), fecha reporte date, Contrato.unidad varchar(20), Contrato.Fecha ingreso date, Contrato.RUC empresa varchar(11))
1. Repuestos (Volquete.Placa varchar(10),NroSerie varchar(11), pieza varchar(60), precio float, fecha compra date)

**Carga de datos**

La carga de datos se realiza por el uso de archivos .csv. Estos se cargaron con el uso de COPY en sql dando la dirección de los archivos y como están delimitados estos.

Consulta con la que se probara la base de datos

¿Cuales son los repuestos y los trabajadores que los requirieron, en los contratos donde se especifica que el volquete se le agregó más de 200 litros de combustible, viajó entre 300 y 400 kilómetros y contaban con una carga mayor a las 20 toneladas?

La consulta en sql se encuentra en el archivo Consulta.sql




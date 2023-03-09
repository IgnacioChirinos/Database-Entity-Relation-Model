# Database-Entity-Relation-Model

### 1.4. ¿Como resuelve el problema hoy?

#### 1.4.1. ¿Como se almacenan/procesan los datos hoy?

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

### 4.2. Carga de datos

La carga de datos se realiz ́o por el uso de archivos .csv. Estos se cargaron con el uso de COPY
en sql dando la direcci ́on de los archivos y como est ́an delimitados estos.


### 4.3. Simulaci ́on de datos

Debido a que los datos reales de la empresa contienen informaci ́on confidencial sobre los contratos
que tiene que puede exponerla frente a la competencia. Adem ́as, para respetar la privacidad de los
trabajadores. Se ha determinado el uso de data aleatoria generado por funciones en Exel que permiten
generar tanto n ́umeros como palabra, fechas y horas aleatorias con lo que se pudieron generar hasta
el mill ́on de datos requerido por el proyecto.


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

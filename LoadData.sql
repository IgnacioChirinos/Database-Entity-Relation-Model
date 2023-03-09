COPY "Proyecto".volquete(
	placa, marca, modelo)
FROM 'F:\DATA\Volquete1000000.csv'
DELIMITER ','
CSV HEADER;

COPY "Proyecto".trabajador(
	dni, nombre, apellidos, correo, clave, licencia)
FROM 'F:\DATA\trabajador1000000.csv'
DELIMITER ','
CSV HEADER;

COPY "Proyecto".conductor(
	"T.DNI", "T.nombre", "T.apellidos", "T.correo", "T.clave")
FROM 'F:\DATA\conductor1000000.csv'
DELIMITER ','
CSV HEADER;

	COPY "Proyecto".contrato(
	"Nombre_unidad", fecha_ingreso, ruc_empresa, "V.placa", fecha_inicio, fecha_fin, precio_unidad, precio_combustible, "C.DNI")
FROM 'F:\DATA\contrato1000000.csv'
DELIMITER ','
CSV HEADER;
	
		COPY "Proyecto".reporte_carga(
	nroguia, ticket_mina, fecha_reporte, carga, "C.unidad", "C.Fecha_ingreso", "C.RUC_empresa")
FROM 'F:\DATA\reportecarga1000000.csv'
DELIMITER ','
CSV HEADER;




COPY "Proyecto".reporte_horas(
	parte_diario, horas, descripcion, fecha_reporte, "C.unidad", "C.Fecha_ingreso", "C.RUC_empresa")
FROM 'F:\DATA\Reportehoras1000000.csv'
DELIMITER ','
CSV HEADER;



COPY"Proyecto".reporte_combustible(
	nro_vale, cantidad_agregada, kilometraje, horometro, fecha_reporte, "C.unidad", "C.Fecha_ingreso", "C.RUC_empresa")
FROM 'F:\DATA\reportecombustible1000000.csv'
DELIMITER ','
CSV HEADER;

COPY "Proyecto".repuestos(
	"V.placa", nroserie, pieza, precio, fecha_compra)
FROM 'F:\DATA\repuestos1000000.csv'
DELIMITER ','
CSV HEADER;


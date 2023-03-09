
SELECT DISTINCT pieza,fecha_compra,"C.DNI"
FROM "Proyecto1000".contrato AS T1 LEFT JOIN "Proyecto1000".repuestos AS t2 ON t1."V.placa"=t2."V.placa"
WHERE t1."V.placa" IN (SELECT "V.placa" FROM "Proyecto1000".contrato WHERE ruc_empresa IN(SELECT t2."C.RUC_empresa" FROM "Proyecto1000".reporte_combustible AS T1 LEFT JOIN "Proyecto1000".reporte_carga AS t2 ON t1."C.RUC_empresa"=t2."C.RUC_empresa" WHERE cantidad_agregada>'200' AND kilometraje BETWEEN '300' AND '400' AND carga >'20' ))


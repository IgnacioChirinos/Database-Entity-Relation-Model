CREATE INDEX idex_contrvol ON "Proyecto1000".contrato
USING hash("V.placa")
CREATE INDEX idex_comb ON "Proyecto1000".reporte_combustible
USING btree("C.RUC_empresa")
CREATE INDEX idex_carg ON "Proyecto1000".reporte_carga
USING btree("C.RUC_empresa")
CREATE INDEX idex_rep ON "Proyecto1000".repuestos
USING btree(pieza,fecha_compra)



SET enable_mergejoin to OFF ;
SET enable_hashjoin to OFF ;
SET enable_bitmapscan to OFF ;
SET enable_sort to OFF


-- DB prd1 y prd2

-------------------------------------------------------------------------

-- Exploro tablas del proyecto
select * from public.product_product;
select * from public.product_template;
select * from public.account_account;
select * from public.account_account where id in (167,168,169,166,666,668);
select * from public.account_invoice_line;
select * from public.account_invoice;
select * from public.sale_order_line_invoice_rel;
select * from public.sale_order_line;

-------------------------------------------------------------------------

-- Exploro tablas del proyecto FINANCIAL 

select * from public.res_currency_rate;
select * from public.res_company;
select * from public.account_payment;

-------------------------------------------------------------------------
-- Exploro tablas del proyecto STOCK 

select * from public.account_payment;
select * from public.res_company;
select * from public.res_currency_rate;

select * from public.stock_quant;
select * from public.stock_quant_move_rel;
select * from public.stock_production_lot;
select * from public.stock_location;

SELECT * FROM public.stock_move ORDER BY id DESC;

-- Una vez corrido el script de BI
select * from bi.stock_history;

-------------------------------------------------------------------------

-- Una vez corrido el script de BI
-- Exploro tablas finales generadas de BI
select * from bi.d06_maestro_productos;
select * from bi.d00_maestro_clientes;
select * from bi.d06_account_invoice_line LIMIT 100;
select * from bi.r00_ventas LIMIT 100;
select * from bi.r00_ventas_mensuales;
select * from bi.r01_ventas_mensuales_naive ORDER BY date_periodo;
select * from bi.r00_ventas_mensuales_sin_cancelar;
select * from bi.r01_ventas_mensuales_sin_cancelar_naive;
select * from bi.r00_ventas_fix LIMIT 20;
select * from bi.r00_ventas_fix_sin_outliers LIMIT 20;
select * from bi.r00_ventas_fix_sin_outliers_mensual ORDER BY periodo;
select * from bi.r01_ventas_fix_sin_outliers_mensual_naive ORDER BY date_periodo;

select * from bi.r01_ventas_fix_sin_outliers_mensual_naive WHERE periodo >= '201809' ORDER BY date_periodo;

-------------------------------------------------------------------------

----- Exploro estados de transacciones
SELECT DISTINCT invoice_state FROM bi.r00_ventas;
-- paid
-- draft
-- open
-- cancel

----- Cuento cantidad de canceladas
SELECT COUNT(invoice_id) FROM bi.r00_ventas WHERE invoice_state ='cancel';
-- 20

SELECT COUNT(invoice_id) FROM bi.r00_ventas_fix WHERE invoice_state ='cancel';
-- 0

-------------------------------------------------------------------------

----- Exploro Ingresos totales
SELECT SUM(price_subtotal_signed) FROM bi.r00_ventas;
-- 19.3419.691

SELECT SUM(price_subtotal_signed) FROM bi.r00_ventas;
-- 19.3419.691

----- Exploro totales de price_subtotal
SELECT SUM(price_subtotal) FROM bi.r00_ventas;
-- 216906743.13

SELECT SUM(price_subtotal) FROM bi.r00_ventas;
-- 216906743.13

-------------------------------------------------------------------------

----- Exploro ingresos negativos
SELECT price_subtotal_signed, invoice_state  FROM bi.r00_ventas WHERE price_subtotal_signed < 1;
SELECT * FROM bi.r00_ventas WHERE price_subtotal_signed < 0;

SELECT * FROM bi.r00_ventas_fix WHERE price_subtotal_signed < 0 ORDER BY ingresos DESC;
SELECT invoice_state, price_unit, quantity, price_subtotal_signed, ingresos FROM bi.r00_ventas_fix WHERE price_subtotal_signed < 0 ORDER BY ingresos DESC;

SELECT invoice_state, count(*) FROM bi.r00_ventas_fix WHERE price_subtotal_signed < 0 GROUP BY invoice_state;
SELECT invoice_state, count(*) FROM bi.r00_ventas WHERE price_subtotal_signed < 0 GROUP BY invoice_state;
SELECT invoice_state, count(*) FROM bi.r00_ventas GROUP BY invoice_state;
SELECT invoice_state, count(*) FROM bi.r00_ventas_fix GROUP BY invoice_state;


-------------------------------------------------------------------------

----- Exploro ingresos sin invoice_date_invoice
SELECT DISTINCT invoice_date_invoice FROM bi.d06_account_invoice_line;
SELECT invoice_date_invoice, count(*) FROM bi.r00_ventas GROUP BY invoice_date_invoice ORDER BY invoice_date_invoice;
-- 167 no tienen fecha
SELECT DISTINCT invoice_date_invoice, count(*) FROM bi.r00_ventas_fix GROUP BY invoice_date_invoice ORDER BY invoice_date_invoice;
-- Todos los items tienen fecha

----- Exploro ingresos sin date_periodo
SELECT DISTINCT date_periodo FROM bi.r00_ventas;
SELECT date_periodo, count(*) FROM bi.r00_ventas GROUP BY date_periodo ORDER BY date_periodo;
-- 167 no tienen fecha
SELECT date_periodo, count(*) FROM bi.r00_ventas_fix GROUP BY date_periodo ORDER BY date_periodo;
SELECT DISTINCT date_periodo, count(*) FROM bi.r00_ventas_fix GROUP BY date_periodo ORDER BY date_periodo;
-- Todos los items tienen fecha

-------------------------------------------------------------------------

----- Exploro outliers
SELECT price_subtotal_signed FROM bi.r00_ventas ORDER BY price_subtotal_signed LIMIT 10;
SELECT price_subtotal_signed FROM bi.r00_ventas ORDER BY price_subtotal_signed DESC LIMIT 10;

SELECT * from bi.r00_ventas_fix ORDER BY ingresos DESC LIMIT 20;
SELECT * from bi.r00_ventas_fix ORDER BY ingresos ASC LIMIT 20;
SELECT ingresos, count(*) FROM bi.r00_ventas_fix WHERE ingresos < 2000 GROUP BY ingresos;
SELECT ingresos, count(*) FROM bi.r00_ventas_fix WHERE ingresos > 1000000 GROUP BY ingresos;
SELECT ingresos, count(*) FROM bi.r00_ventas_fix WHERE ingresos > 500000 GROUP BY ingresos;
SELECT ingresos, count(*) FROM bi.r00_ventas_fix WHERE ingresos > 400000 GROUP BY ingresos;
SELECT ingresos, count(*) FROM bi.r00_ventas_fix WHERE ingresos > 300000 GROUP BY ingresos;
SELECT ingresos, count(*) FROM bi.r00_ventas_fix WHERE ingresos > 200000 GROUP BY ingresos;
SELECT ingresos, count(*) FROM bi.r00_ventas_fix WHERE ingresos > 100000 GROUP BY ingresos;
SELECT ingresos, count(*) FROM bi.r00_ventas_fix WHERE ingresos > 90000 GROUP BY ingresos;

-- Evalúo cantidad de transacciones totales VS a eliminar o tratar
SELECT count(*) FROM bi.r00_ventas_fix;
-- 50142
SELECT count(*) FROM bi.r00_ventas_fix WHERE ingresos > 400000;
-- 11

-- Visualizo distribución sobre fechas de transacciones a ser eliminadas
SELECT date_periodo, count(*) FROM bi.r00_ventas_fix WHERE ingresos > 400000 GROUP BY date_periodo ORDER BY date_periodo;

-- Visualizo distribución sobre fechas de transacciones a ser contempladas
SELECT date_periodo, count(*) FROM bi.r00_ventas GROUP BY date_periodo ORDER BY date_periodo;

-- Visualizo distribución sobre fechas de transacciones a ser contempladas
SELECT date_periodo, count(*) FROM bi.r00_ventas_fix GROUP BY date_periodo ORDER BY date_periodo;

-- Visualizo distribución sobre fechas de transacciones a ser contempladas
SELECT date_periodo, count(*) FROM bi.r00_ventas_fix WHERE ingresos <= 400000 GROUP BY date_periodo ORDER BY date_periodo;

-- Visualizo distribución sobre fechas de transacciones en r00_ventas_fix
SELECT date_periodo, ingresos, invoice_state, count(*) FROM bi.r00_ventas_fix GROUP BY date_periodo, ingresos, invoice_state ORDER BY date_periodo;

-- Visualizo distribución sobre fechas de transacciones a ser contempladas
SELECT date_periodo, count(*) FROM bi.r00_ventas_fix_sin_outliers GROUP BY date_periodo ORDER BY date_periodo;


SELECT periodo, invoice_state FROM bi.r00_ventas_fix GROUP BY periodo, invoice_state ORDER BY periodo;
SELECT * FROM bi.r00_ventas_fix_sin_outliers_mensual ORDER BY periodo;
SELECT * FROM bi.r01_ventas_fix_sin_outliers_mensual_naive ORDER BY periodo;

SELECT periodo, SUM(ingresos) AS ingresos FROM bi.r00_ventas_fix_sin_outliers GROUP BY periodo ORDER BY periodo;


-------------------------------------------------------------------------

SELECT * FROM bi.r00_ventas_fix LIMIT 10;
SELECT count(*) FROM bi.r00_ventas_fix;
-- 49977


-- Exploro transacciones sin localidad
SELECT partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_city IS NULL GROUP BY partner_city;
-- 8.719
-- Transacciones con localidad
SELECT partner_city, partner_state_id, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_city IS NOT NULL GROUP BY partner_city, partner_state_id ORDER BY count DESC;
-- 822 diferentes. Errores sobre naming y concatenación: Ej. 5 tipos de "Bahía Blanca".


-- Exploro transacciones sin partner_zip
SELECT partner_zip, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_zip IS NULL GROUP BY partner_zip ORDER BY partner_zip;
-- 20893 transacciones sobre un total de 49977. 
-- Transacciones con partner_zip
SELECT partner_zip, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_zip IS NOT NULL GROUP BY partner_zip ORDER BY partner_zip;
-- 474 valores diferentes


-- Exploro transacciones sin partner_country_id
SELECT partner_country_id, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_country_id IS NULL GROUP BY partner_country_id ORDER BY partner_country_id;
-- 4261
-- Transacciones con partner_country_id
SELECT partner_country_id, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_country_id IS NOT NULL GROUP BY partner_country_id ORDER BY partner_country_id;
-- Dos valores diferentes: 11 (45530) y 6 (24).

-- Exploro transacciones sin partner_state_id
SELECT partner_state_id, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IS NULL GROUP BY partner_state_id ORDER BY partner_state_id;
-- 4555
-- Transacciones con partner_state_id
SELECT partner_state_id, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IS NOT NULL GROUP BY partner_state_id ORDER BY count DESC;
-- 27 valores diferentes

-- Sumo la cantidad de registros que abarcan las 4 provincias con más incidencia
SELECT count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (553,552,572,557);
-- 41390 sobre un total de 49977.


-- Procedo a explorar ocularmente para identificar criterios de resolución

SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (553) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (552) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (572) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (557) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (566) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (562) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (564) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (646) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (567) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (556) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (574) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (568) GROUP BY partner_state_id, partner_city ORDER BY count DESC;

SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (575) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (555) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (559) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (571) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (563) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (554) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (565) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (573) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (561) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (570) GROUP BY partner_state_id, partner_city ORDER BY count DESC;

SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (558) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (647) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (569) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (560) GROUP BY partner_state_id, partner_city ORDER BY count DESC;
SELECT partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_state_id IN (433) GROUP BY partner_state_id, partner_city ORDER BY count DESC;


-- Conclusiones: 
-- Según los datos observados se puede inferir que

-- 553 es Provincia de Buenos Aires.
-- 552 es Ciudad Autónoma de Buenos Aires.
-- 572 es Provincia de Santa Fe.
-- 557 es Provincia de Córdoba.
-- 566 es Provincia de Neuquén.
-- 562 es Provincia de La Pampa.
-- 564 es Provincia de Mendoza.
-- 646 es Provincia de Chubut.
-- 567 es Provincia de San Carlos de Bariloche.
-- 556 es Provincia de Chubut (hay dos id para la misma provincia).
-- 574 es Provincia de Usuahia.
-- 568 es Provincia de Salta.
-- 575 es Provincia de Tucumán.
-- 555 es Provincia de Chaco.
-- 559 es Provincia de Entre Ríos.
-- 571 es Provincia de Santa Cruz.
-- 563 es Provincia de La Rioja.
-- 554 es Provincia de Catamarca.
-- 565 es Provincia de Misiones.
-- 573 es Provincia de Santiago del Estero.
-- 561 es Provincia de Jujuy.
-- 570 es Provincia de San Luis.
-- 558 es Provincia de Corrientes.
-- 647 es Provincia de Entre Ríos (hay dos id para la misma provincia).
-- 569 es Provincia de San Juan.

SELECT partner_country_id, partner_state_id, partner_city, count(*) FROM bi.r00_ventas_fix_sin_outliers WHERE partner_country_id IN (6) GROUP BY partner_country_id, partner_state_id, partner_city ORDER BY count DESC;
-- Conclusiones: Ciudad Beccar. Debido al estado de los datos, no es posible aseverar ninguna hipótesis. Es posible que 
-- esté incorrecto el id del pais. De hecho existe una localidad en Argentina llamada Beccar perteneciente 
-- a la ciudad de San Isidro de la provincia de Buenos Aires. 


--Sobre la localización
--TODO: Ciudad, Provincia, Pais.
--Se requiere unificar criterios de naming para localidad. A su vez, no se dispone el nombre del pais ni de la provincia.
--Se procede a mejorar el naming de los items que abarcan mayor cantidad de casos.

SELECT provincia, count(*) FROM bi.r01_ventas_fix_sin_outliers GROUP BY provincia ORDER BY count DESC;

SELECT provincia, partner_city, count(*) FROM bi.r01_ventas_fix_sin_outliers GROUP BY provincia, partner_city ORDER BY count DESC;

SELECT provincia, partner_city, ciudad, count(*) FROM bi.r02_ventas_fix_sin_outliers GROUP BY provincia, partner_city, ciudad ORDER BY count DESC;
-- donde diga 'caba', 'CABA', 'Caba', 'Buenos Aires', 'Capital Federal', 'ciudad de buenos aires' en partner_city es 'Ciudad Autónoma de Buenos Aires'.
-- donde diga 'Ciudad Autónoma de Buenos Aires' en Ciudad, entonces provincia es 'Ciudad Autónoma de Buenos Aires'

SELECT provincia, ciudad, count(*) FROM bi.r02_ventas_fix_sin_outliers GROUP BY provincia, ciudad ORDER BY count DESC;


-------------------------------------------------------------------------


-- Exploro periodo 2020
SELECT * FROM bi.r00_ventas_fix_sin_outliers WHERE left(periodo,4) = '2020';

-------------------------------------------------------------------------


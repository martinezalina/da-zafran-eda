-- DB prd1 y prd2

---------------- CREO EL ESQUEMA ----------------
CREATE SCHEMA IF NOT EXISTS bi;

---------------- GENERO DIMENSIÓN PRODUCTO ----------------

------ 00. Unifico product_product con product_template
DROP TABLE IF EXISTS bi.d00_maestro_productos;
CREATE TABLE bi.d00_maestro_productos AS(
	SELECT 
		a.id AS product_id, a.active, a.product_tmpl_id, a.weight, a.default_code, a.barcode, a.volume,
		b.uom_id, b.name, b.type, b.product_brand_id, b.pack_cat, b.categ_id, b.flavor_id, b.sale_ok
	FROM
		public.product_product as a
	LEFT JOIN
		public.product_template as b
	ON a.product_tmpl_id = b.id
);

------ 01. Agrego UOM a maestro_productos
DROP TABLE IF EXISTS bi.d01_maestro_productos;
CREATE TABLE bi.d01_maestro_productos AS (
	SELECT 
		a.*,
		b.name AS uom,
		b.factor AS uom_factor
	FROM
		bi.d00_maestro_productos AS a
	LEFT JOIN
		public.product_uom AS b
	ON a.uom_id = id
);

------ 02. Agrego Product Brand a maestro_productos
DROP TABLE IF EXISTS bi.d02_maestro_productos;
CREATE TABLE bi.d02_maestro_productos AS (
	SELECT 
		a.*,
		b.name AS product_brand
	FROM
		bi.d01_maestro_productos AS a
	LEFT JOIN
		public.product_brand AS b
	ON a.product_brand_id = b.id
);

------ 03. Agrego Product Pack Category a maestro_productos
DROP TABLE IF EXISTS bi.d03_maestro_productos;
CREATE TABLE bi.d03_maestro_productos AS (
	SELECT
		a.*,
		b.name AS product_pack_cat_name, b.cat_qty AS product_pack_cat_qty
	FROM
		bi.d02_maestro_productos AS a
	LEFT JOIN
		public.product_pack_cat AS b
	ON a.pack_cat = b.id
);

------ 04. Agrego Product Category a maestro_productos
DROP TABLE IF EXISTS bi.d04_maestro_productos;
CREATE TABLE bi.d04_maestro_productos AS (
	SELECT
		a.*,
		b.parent_id AS product_parent_id, b.name AS product_category
	FROM
		bi.d03_maestro_productos AS a
	LEFT JOIN
		public.product_category AS b
	ON a.categ_id = b.id
);

------ 05. Agrego Product Parent Category a maestro_productos
DROP TABLE IF EXISTS bi.d05_maestro_productos;
CREATE TABLE bi.d05_maestro_productos AS (
	SELECT
		a.*,
		b.name AS product_category_parent
	FROM
		bi.d04_maestro_productos AS a
	LEFT JOIN
		public.product_category AS b
	ON a.product_parent_id = b.id
);


------ 06. Agrego Product Flavor a maestro_productos
DROP TABLE IF EXISTS bi.d06_maestro_productos;
CREATE TABLE bi.d06_maestro_productos AS (
	SELECT
		a.*,
		b.name AS product_flavor
	FROM
		bi.d05_maestro_productos AS a
	LEFT JOIN
		public.product_flavor AS b
	ON a.flavor_id = b.id
);

------ libero espacio en disco
DROP TABLE IF EXISTS bi.d00_maestro_productos;
DROP TABLE IF EXISTS bi.d01_maestro_productos;
DROP TABLE IF EXISTS bi.d02_maestro_productos;
DROP TABLE IF EXISTS bi.d03_maestro_productos;
DROP TABLE IF EXISTS bi.d04_maestro_productos;
DROP TABLE IF EXISTS bi.d05_maestro_productos;

---------------- GENERO DIMENSIÓN CLIENTE ----------------

------ 00. Agrego res_partner y res_partner_market
DROP TABLE IF EXISTS bi.d00_maestro_clientes;
CREATE TABLE bi.d00_maestro_clientes AS(
	SELECT 
		a.id AS partner_id, a.name AS partner_name, 
		a.city AS partner_city, a.zip AS partner_zip, a.country_id AS partner_country_id,
		a.customer, a.state_id AS partner_state_id, a.market_id AS partner_market_id,
		b.name AS partner_market_category
	FROM
		public.res_partner AS a
	LEFT JOIN
		public.res_partner_market AS b
	ON a.market_id = b.id
);

---------------- GENERO DIMENSIÓN VENTAS ----------------

------ 00. Tomo account_invoice_line y le agrego el nombre de la cuenta
DROP TABLE IF EXISTS bi.d00_account_invoice_line;
CREATE TABLE bi.d00_account_invoice_line AS(
	SELECT 
		a.id AS invoice_line_id, a.origin AS invoice_line_origin, a.price_unit,
		a.price_subtotal, a.currency_id, a.partner_id, a.account_id, a.discount,
		a.price_subtotal_signed, a.name AS invoice_line_name, a.product_id,
		a.invoice_id, a.quantity,
		b.id AS account_id_account, b.code AS account_code, b.name AS account_name 
	FROM
		public.account_invoice_line AS a
	LEFT JOIN
		public.account_account AS b 
	ON 
		a.account_id = b.id
	WHERE a.account_id in (166,167,168,169,666,668)
);

-- SELECT COUNT(invoice_line_id) FROM bi.d00_account_invoice_line;
-- 50.292

-- SELECT * FROM bi.d00_account_invoice_line LIMIT 20;


------ 01. Tomo account_invoice_line y le agrego datos del invoice
DROP TABLE IF EXISTS bi.d01_account_invoice_line;
CREATE TABLE bi.d01_account_invoice_line AS(
	SELECT 
		a.*,
		b.date_invoice AS invoice_date_invoice, b.state AS invoice_state
	FROM
		bi.d00_account_invoice_line AS a
	LEFT JOIN
		public.account_invoice AS b
	ON a.invoice_id = b.id
);

------ 02. Tomo account_invoice_line y le agrego datos del cliente
DROP TABLE IF EXISTS bi.d02_account_invoice_line;
CREATE TABLE bi.d02_account_invoice_line AS(
	SELECT 
		a.*,
		b.partner_name, b.partner_city, b.partner_zip, b.partner_country_id,b.partner_state_id,
		b.customer, b.partner_market_category
	FROM
		bi.d01_account_invoice_line AS a
	LEFT JOIN
		bi.d00_maestro_clientes AS b
	ON a.partner_id = b.partner_id
	WHERE b.customer = TRUE
);

------ 03. Tomo account_invoice_line y le agrego datos del producto
DROP TABLE IF EXISTS bi.d03_account_invoice_line;
CREATE TABLE bi.d03_account_invoice_line AS(
	SELECT 
		a.*,
		b.weight AS product_weight, b.default_code AS product_default_code,
		b.barcode AS product_barcode, b.volume AS product_volume,
		b.sale_ok AS product_sale_ok, b.uom AS product_uom, b.uom_factor AS product_uom_factor,
		b.product_brand, b.product_pack_cat_name, b.product_pack_cat_qty, 
		b.product_category, b.product_flavor
	FROM
		bi.d02_account_invoice_line AS a
	LEFT JOIN
		bi.d06_maestro_productos AS b
	ON a.product_id = b.product_id
	WHERE b.sale_ok = TRUE AND b.active = TRUE AND b.type = 'product'
);

------ 04. Tomo account_invoice_line y le agrego sale_order_line_invoice_rel
DROP TABLE IF EXISTS bi.d04_account_invoice_line;
CREATE TABLE bi.d04_account_invoice_line AS(
	SELECT 
		a.*,
		b.order_line_id 
	FROM
		bi.d03_account_invoice_line AS a
	LEFT JOIN
		public.sale_order_line_invoice_rel AS b
	ON a.invoice_line_id = b.invoice_line_id
);

------ 05. Tomo account_invoice_line y le agrego sale_order_line
DROP TABLE IF EXISTS bi.d05_account_invoice_line;
CREATE TABLE bi.d05_account_invoice_line AS(
	SELECT 
		a.*,
		b.salesman_id 
	FROM
		bi.d04_account_invoice_line AS a
	LEFT JOIN
		public.sale_order_line AS b
	ON a.order_line_id = b.id
);

------ libero espacio en disco
DROP TABLE IF EXISTS bi.d00_account_invoice_line;
DROP TABLE IF EXISTS bi.d01_account_invoice_line;
DROP TABLE IF EXISTS bi.d02_account_invoice_line;
DROP TABLE IF EXISTS bi.d03_account_invoice_line;
DROP TABLE IF EXISTS bi.d04_account_invoice_line;

------ 06. Agrego la dimencion periodo
DROP TABLE IF EXISTS bi.d06_account_invoice_line;
CREATE TABLE bi.d06_account_invoice_line AS(
	SELECT 
		*,
	CASE WHEN date_part('month',invoice_date_invoice) > 9 THEN
	concat(date_part('year',invoice_date_invoice), date_part('month',invoice_date_invoice))
	ELSE concat(date_part('year',invoice_date_invoice),'0', date_part('month',invoice_date_invoice))
	END periodo
	FROM bi.d05_account_invoice_line
);

------ libero espacio en disco
DROP TABLE IF EXISTS bi.d05_account_invoice_line;


------ VARIANTES DE TABLA VENTAS

------ Variante (1)
-- Cruda. Sin intervenciones.

------ 00. Creo la tabla final de ventas
DROP TABLE IF EXISTS bi.r00_ventas;
CREATE TABLE bi.r00_ventas AS(
	SELECT 
		*,
		CASE WHEN LENGTH(periodo) > 5 THEN TO_DATE(periodo, 'YYYYMM') 
		END AS date_periodo
	FROM bi.d06_account_invoice_line
);

------ 00. Creo la tabla final de ventas mensuales
DROP TABLE IF EXISTS bi.r00_ventas_mensuales;
CREATE TABLE bi.r00_ventas_mensuales AS(
	SELECT 
		periodo, SUM(price_subtotal_signed) AS ingresos
	FROM bi.r00_ventas 
	GROUP BY periodo
);

------ 00. Creo la tabla final de ventas mensuales con comparación de periodo anterior
DROP TABLE IF EXISTS bi.r00_ventas_mensuales_naive;
CREATE TABLE bi.r00_ventas_mensuales_naive AS(
	SELECT 
		periodo, ingresos, LAG(ingresos,12) OVER (ORDER BY periodo) naive_ly
	FROM bi.r00_ventas_mensuales
);

------ 01. Agrego periodo tipo datetime 
DROP TABLE IF EXISTS bi.r01_ventas_mensuales_naive;
CREATE TABLE bi.r01_ventas_mensuales_naive AS(
	SELECT 
		*,
		CASE WHEN LENGTH(periodo) > 5 THEN TO_DATE(periodo, 'YYYYMM') 
		END AS date_periodo
	FROM bi.r00_ventas_mensuales_naive
);


------ Variante (2)
-- Con intervención:
-- Elimino canceladas.

------ 00. Creo la tabla final de ventas mensuales sin canceladas
DROP TABLE IF EXISTS bi.r00_ventas_mensuales_sin_cancelar;
CREATE TABLE bi.r00_ventas_mensuales_sin_cancelar AS(
	SELECT 
		periodo, SUM(price_subtotal_signed) AS ingresos
	FROM bi.r00_ventas 
	WHERE invoice_state !='cancel'
	GROUP BY periodo
);

------ 00. Creo la tabla final de ventas mensuales sin canceladas con comparación de periodo anterior
-- Me quedo sólo con la información de 201809 en adelante, dado que no poseo los datos del 201807
DROP TABLE IF EXISTS bi.r00_ventas_mensuales_sin_cancelar_naive;
CREATE TABLE bi.r00_ventas_mensuales_sin_cancelar_naive AS(
	SELECT 
		periodo, ingresos, LAG(ingresos,12) OVER (ORDER BY periodo) naive_ly
	FROM bi.r00_ventas_mensuales_sin_cancelar
	WHERE periodo >= '201809'
);

-- SELECT * FROM bi.r00_ventas_mensuales_sin_cancelar_naive ORDER BY periodo;

------ 01. Agrego periodo tipo datetime 
DROP TABLE IF EXISTS bi.r01_ventas_mensuales_sin_cancelar_naive;
CREATE TABLE bi.r01_ventas_mensuales_sin_cancelar_naive AS(
	SELECT 
		*,
		CASE WHEN LENGTH(periodo) > 5 THEN TO_DATE(periodo, 'YYYYMM') 
		END AS date_periodo
	FROM bi.r00_ventas_mensuales_sin_cancelar_naive
);

------ Variante (3)
-- Con intervenciones: 
---- Corrijo valores negativos.
---- Elimino ingresos sin fecha.
---- Elimino outliers de ingresos.
---- Agrego Naming de Estado.

-- 00. Creo la tabla final de ventas_fix interviniendo ingresos
-- Trato los ingresos negativos y descarto los cancelados
DROP TABLE IF EXISTS bi.r00_ventas_fix;
CREATE TABLE bi.r00_ventas_fix AS(
	SELECT 
		*,
		CASE WHEN price_subtotal_signed < 0 THEN ABS(price_subtotal_signed) 
		ELSE price_subtotal_signed
		END AS ingresos
	FROM bi.r00_ventas
	WHERE (invoice_state != 'cancel') AND (invoice_date_invoice IS NOT NULL)
);

-- 00. Creo la tabla final de ventas_fix sin outliers
-- Elimino outliers que filtro con el 'where'
-- Se eliminan 81 registros de un total de 50142
DROP TABLE IF EXISTS bi.r00_ventas_fix_sin_outliers;
CREATE TABLE bi.r00_ventas_fix_sin_outliers AS(
	SELECT 
		*
	FROM bi.r00_ventas_fix
	WHERE ingresos < 400000
);




-- 01. Mejoro los datos de provincia
-- Trato los datos de provincia según lo observado
-- 553 es Provincia de Buenos Aires.
-- 552 es Ciudad Autónoma de Buenos Aires
-- 572 es Provincia de Santa Fe
-- 557 es Provincia de Córdoba
-- 566 es Provincia de Neuquén
-- 562 es Provincia de La Pampa
-- 564 es Provincia de Mendoza
-- 646 es Provincia de Chubut
-- 567 es Provincia de San Carlos de Bariloche
-- 556 es Provincia de Chubut (hay dos id para la misma provincia)
-- 574 es Provincia de Usuahia
-- 568 es Provincia de Salta
DROP TABLE IF EXISTS bi.r01_ventas_fix_sin_outliers;
CREATE TABLE bi.r01_ventas_fix_sin_outliers AS(
	SELECT 
		*,
		CASE 
			WHEN partner_state_id = 553 THEN 'Buenos Aires'
		 	WHEN partner_state_id = 552 THEN 'Ciudad Autónoma de Buenos Aires'
		 	WHEN partner_state_id = 572 THEN 'Santa Fé'
		 	WHEN partner_state_id = 557 THEN 'Córdoba'
		 	WHEN partner_state_id = 566 THEN 'Neuquén'
		 	WHEN partner_state_id = 562 THEN 'La Pampa'
		 	WHEN partner_state_id = 564 THEN 'Mendoza'
		 	WHEN partner_state_id = 646 THEN 'Chubut'
		 	WHEN partner_state_id = 567 THEN 'San Carlos de Bariloche'
		 	WHEN partner_state_id = 556 THEN 'Chubut'
		 	WHEN partner_state_id = 574 THEN 'Usuahia'
		 	WHEN partner_state_id = 568 THEN 'Salta'
			WHEN partner_state_id = 575 THEN 'Tucumán'
			WHEN partner_state_id = 555 THEN 'Chaco'
			WHEN partner_state_id = 559 THEN 'Entre Ríos'
			WHEN partner_state_id = 571 THEN 'Santa Cruz'
			WHEN partner_state_id = 563 THEN 'La Rioja'
			WHEN partner_state_id = 554 THEN 'Catamarca'
			WHEN partner_state_id = 565 THEN 'Misiones'
			WHEN partner_state_id = 573 THEN 'Santiago del Estero'
			WHEN partner_state_id = 561 THEN 'Jujuy'
			WHEN partner_state_id = 570 THEN 'San Luis'
			WHEN partner_state_id = 558 THEN 'Corrientes'
			WHEN partner_state_id = 647 THEN 'Entre Ríos'
			WHEN partner_state_id = 569 THEN 'San Juan'
			ELSE NULL
		END AS provincia
	FROM bi.r00_ventas_fix_sin_outliers
);

-- 02. Mejoro los datos de ciudad
-- Incorporo el campo ciudad.
-- Genero un tratamieto de datos para limpiar los casos de mayor 
-- relevancia de acuerdo a la exploración ocular realizada.

-- donde diga 'caba', 'CABA', 'Caba', 'Buenos Aires', 'Capital Federal', 'ciudad de buenos aires' en partner_city es 'Ciudad Autónoma de Buenos Aires'.
-- donde diga 'Ciudad Autónoma de Buenos Aires' en Ciudad, entonces provincia es 'Ciudad Autónoma de Buenos Aires'
DROP TABLE IF EXISTS bi.r02_ventas_fix_sin_outliers;
DROP TABLE IF EXISTS bi.r02_ventas_fix_sin_outliers;

CREATE TABLE bi.r02_ventas_fix_sin_outliers AS(
	SELECT 
		*,
		CASE 
			WHEN partner_state_id = 552 THEN 'Ciudad Autónoma de Buenos Aires'
			WHEN partner_city = 'caba' THEN 'Ciudad Autónoma de Buenos Aires'
			WHEN partner_city = 'CABA' THEN 'Ciudad Autónoma de Buenos Aires'
			WHEN partner_city = 'Caba' THEN 'Ciudad Autónoma de Buenos Aires'
			WHEN partner_city = 'Buenos Aires' THEN 'Ciudad Autónoma de Buenos Aires'
			WHEN partner_city = 'Capital Federal' THEN 'Ciudad Autónoma de Buenos Aires'
			WHEN partner_city = 'ciudad de buenos aires' THEN 'Ciudad Autónoma de Buenos Aires'
			ELSE partner_city 
		END AS ciudad
	FROM bi.r01_ventas_fix_sin_outliers
);

UPDATE bi.r02_ventas_fix_sin_outliers SET provincia = 'Ciudad Autónoma de Buenos Aires' WHERE ciudad = 'Ciudad Autónoma de Buenos Aires';





------ 00. Creo la tabla final de ventas mensuales fixed
DROP TABLE IF EXISTS bi.r00_ventas_fix_sin_outliers_mensual;
CREATE TABLE bi.r00_ventas_fix_sin_outliers_mensual AS(
	SELECT 
		periodo, SUM(ingresos) AS ingresos_mensuales
	FROM bi.r02_ventas_fix_sin_outliers 
	GROUP BY periodo
);

------ 00. Creo la tabla final de ventas mensuales con comparación de periodo anterior
-- Me quedo sólo con la información de 201809 en adelante, dado que no poseo los datos del 201807
DROP TABLE IF EXISTS bi.r00_ventas_fix_sin_outliers_mensual_naive;
CREATE TABLE bi.r00_ventas_fix_sin_outliers_mensual_naive AS(
	SELECT 
		periodo, ingresos_mensuales, LAG(ingresos_mensuales,12) OVER (ORDER BY periodo) naive_ly
	FROM bi.r00_ventas_fix_sin_outliers_mensual
	WHERE periodo >= '201809'
);

------ 01. Agrego periodo tipo datetime 
DROP TABLE IF EXISTS bi.r01_ventas_fix_sin_outliers_mensual_naive;
CREATE TABLE bi.r01_ventas_fix_sin_outliers_mensual_naive AS(
	SELECT 
		*,
		CASE WHEN LENGTH(periodo) > 5 THEN TO_DATE(periodo, 'YYYYMM') 
		END AS date_periodo
	FROM bi.r00_ventas_fix_sin_outliers_mensual_naive
);




------ TABLAS STOCK


------ 00. Creo la tabla de stock_history
DROP TABLE IF EXISTS bi.stock_history;
CREATE table bi.stock_history AS
 SELECT min(foo.id) AS id,
    foo.move_id,
    foo.location_id,
    foo.company_id,
    foo.product_id,
    foo.product_categ_id,
    foo.product_template_id,
    sum(foo.quantity) AS quantity,
    foo.date,
    COALESCE((sum((foo.price_unit_on_quant * foo.quantity)) / NULLIF(sum(foo.quantity), (0)::double precision)), (0)::double precision) AS price_unit_on_quant,
    foo.source,
    string_agg(DISTINCT (foo.serial_number)::text, ', '::text ORDER BY (foo.serial_number)::text) AS serial_number
   FROM ( SELECT stock_move.id,
            stock_move.id AS move_id,
            dest_location.id AS location_id,
            dest_location.company_id,
            stock_move.product_id,
            product_template.id AS product_template_id,
            product_template.categ_id AS product_categ_id,
            quant.qty AS quantity,
            stock_move.date,
            quant.cost AS price_unit_on_quant,
            stock_move.origin AS source,
            stock_production_lot.name AS serial_number
           FROM (((((((public.stock_quant quant
             JOIN public.stock_quant_move_rel ON ((stock_quant_move_rel.quant_id = quant.id)))
             JOIN public.stock_move ON ((stock_move.id = stock_quant_move_rel.move_id)))
             LEFT JOIN public.stock_production_lot ON ((stock_production_lot.id = quant.lot_id)))
             JOIN public.stock_location dest_location ON ((stock_move.location_dest_id = dest_location.id)))
             JOIN public.stock_location source_location ON ((stock_move.location_id = source_location.id)))
             JOIN public.product_product ON ((product_product.id = stock_move.product_id)))
             JOIN public.product_template ON ((product_template.id = product_product.product_tmpl_id)))
          WHERE ((quant.qty > (0)::double precision) AND ((stock_move.state)::text = 'done'::text) AND ((dest_location.usage)::text = ANY (ARRAY[('internal'::character varying)::text, ('transit'::character varying)::text])) AND ((NOT ((source_location.company_id IS NULL) AND (dest_location.company_id IS NULL))) OR (source_location.company_id <> dest_location.company_id) OR ((source_location.usage)::text <> ALL (ARRAY[('internal'::character varying)::text, ('transit'::character varying)::text]))))
        UNION ALL
         SELECT ('-1'::integer * stock_move.id) AS id,
            stock_move.id AS move_id,
            source_location.id AS location_id,
            source_location.company_id,
            stock_move.product_id,
            product_template.id AS product_template_id,
            product_template.categ_id AS product_categ_id,
            (- quant.qty) AS quantity,
            stock_move.date,
            quant.cost AS price_unit_on_quant,
            stock_move.origin AS source,
            stock_production_lot.name AS serial_number
           FROM (((((((public.stock_quant quant
             JOIN public.stock_quant_move_rel ON ((stock_quant_move_rel.quant_id = quant.id)))
             JOIN public.stock_move ON ((stock_move.id = stock_quant_move_rel.move_id)))
             LEFT JOIN public.stock_production_lot ON ((stock_production_lot.id = quant.lot_id)))
             JOIN public.stock_location source_location ON ((stock_move.location_id = source_location.id)))
             JOIN public.stock_location dest_location ON ((stock_move.location_dest_id = dest_location.id)))
             JOIN public.product_product ON ((product_product.id = stock_move.product_id)))
             JOIN public.product_template ON ((product_template.id = product_product.product_tmpl_id)))
          WHERE ((quant.qty > (0)::double precision) AND ((stock_move.state)::text = 'done'::text) AND ((source_location.usage)::text = ANY (ARRAY[('internal'::character varying)::text, ('transit'::character varying)::text])) AND ((NOT ((dest_location.company_id IS NULL) AND (source_location.company_id IS NULL))) OR (dest_location.company_id <> source_location.company_id) OR ((dest_location.usage)::text <> ALL (ARRAY[('internal'::character varying)::text, ('transit'::character varying)::text]))))) foo
  GROUP BY foo.move_id, foo.location_id, foo.company_id, foo.product_id, foo.product_categ_id, foo.date, foo.source, foo.product_template_id;


------ 00. Creo la tabla de stock_history_complete
DROP TABLE IF EXISTS bi.stock_history_complete;
CREATE TABLE bi.stock_history_complete AS(
	SELECT 
		tmlp.name AS product_template_name,
		tmlp.type AS product_template_type,
		tmlp.sale_ok AS product_template_sale_ok,
		cat.name AS product_category_name,
		a.*
	FROM bi.stock_history AS a
	LEFT JOIN
		public.product_template as tmlp
		ON a.product_template_id = tmlp.id
	LEFT JOIN
		public.product_category as cat
		ON a.product_categ_id = cat.id
);



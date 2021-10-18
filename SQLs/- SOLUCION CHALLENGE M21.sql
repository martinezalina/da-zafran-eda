

CREATE TABLE bi.stock_history_complete as(
									select b.name, b.type, a.* 
									from bi.stock_history a
									left join bi.d06_maestro_productos b on a.product_id=b.product_id);
									
			
--¿Cuántos productos quebraron stocks en 2019?
--Quebrar stock significa no tener productos cuando se genera una venta, 
--lo cual significa que la cantidad de stock requerido pasa a estar en negativo.
-- =241

select count (distinct product_id) 
from bi.stock_history_complete 
where date_part('year',date)=2019 and quantity<0


----¿Cuál es el producto que más valor en stock tuvo en 2019? (Puedes
--usar el precio promedio del producto del año u otra métrica que
---consideres válida para el precio)
---De las tablas del Sprint Project 01, extraer el precio por producto y agregarlo a la tabla
---que venimos utilizando. El producto con mayor valor lo obtenemos de la multiplicación
--de quantity * precio.
--MAX=$632,162.119,68 Barra caju y semillas de zapallo x 28g

SELECT --	name,
		MAX(price_per_product)
FROM
(SELECT 	name,
 			b.price_unit,
			a.quantity,
			(a.quantity*b.price_unit) AS price_per_product
FROM bi.stock_history_complete a
LEFT JOIN bi.r00_ventas b ON a.product_id=b.product_id
group by 1,2,3) AS q1
group by 1
ORDER BY 2



	
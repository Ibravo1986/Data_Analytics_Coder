use Ventas_Tech_DB;
go

--Consulta 1 -Resumen ejecutivo mensual
Select MONTH(fecha_venta) as mes,
SUM(cantidad*precio_unitario) as total_facturado,
COUNT(*) as cantidad_pedidos,
AVG(cantidad*precio_unitario) as ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

--Consulta 2 -Ranking de Productos
Select top 5 id_producto, SUM(cantidad) AS cantidad_vendida,
sum(cantidad*precio_unitario) as total_facturado
from ventas
GROUP BY id_producto ORDER BY sum(cantidad*precio_unitario) desc;

--Consulta 3 — Clientes recurrentes
select id_cliente, COUNT(*) AS cantidad_pedidos,
sum(cantidad*precio_unitario) as total_gastado
from ventas
group by id_cliente having count (*) > 1;

--Consulta 4 — Meses por encima/por debajo del promedio
SELECT MONTH(FECHA_VENTA) AS MES,
SUM(CANTIDAD*PRECIO_UNITARIO) AS TOTAL_FACTURADO,
CASE 
WHEN SUM(CANTIDAD*PRECIO_UNITARIO) > (
SELECT AVG(total_facturado)
FROM (
SELECT SUM(cantidad*precio_unitario) AS total_facturado
from ventas
group by month(fecha_venta)
) AS TOTALES_MENSUALES
) THEN 'POR ENCIMA'
WHEN SUM(CANTIDAD*PRECIO_UNITARIO) < (
SELECT AVG(total_facturado)
FROM (
SELECT SUM(cantidad*precio_unitario) AS total_facturado
from ventas
group by month(fecha_venta)
) AS TOTALES_MENSUALES
) THEN 'POR DEBAJO'
ELSE 'IGUAL AL PROMEDIO'
END AS COMPARACION_PROMEDIO
FROM VENTAS
GROUP BY MONTH (FECHA_VENTA);

/*Bloque de cierre
1.Durante Marzo se registraron 10 pedidos  con una facturacu¿ion total de $ 6444,40 y un ticket promedio de 644,40.
2.El producto 1 lidera el ranking por facturacion, con un total de $ 3600 y 3 unidades vendidas, si bien el producto 2 registra la mayor cantidad de unidades vendidas(13), su facturacion es de solo $364.
3.Los 5 clientes registrados son recurrentes ya que cada uno realizo 2 compras durante el periodo analizado.
*/





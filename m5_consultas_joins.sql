USE Ventas_Tech_DB;
GO


--Consulta 1 — Vista base del proyecto (INNER JOIN)
SELECT v.fecha_venta ,c.nombre ,p.nombre_producto,c.Id_cliente, v.cantidad, v.precio_unitario, v.cantidad*v.precio_unitario AS total_venta,cat.Nombre_categoria,c.ciudad FROM ventas AS v
INNER JOIN clientes AS c
ON v.id_cliente = c.Id_cliente
INNER JOIN productos AS p
ON v.id_producto = p.Id_productos
INNER JOIN categorias as cat
ON p.Id_categoria = cat.Id_categoria

--Consulta 2 — Clientes sin ventas (LEFT JOIN)
SELECT c.nombre,c.email,c.fecha_registro FROM clientes AS c
LEFT JOIN ventas AS v 
ON c.Id_cliente = v.id_cliente
WHERE v.id_ventas IS NULL

--Consulta 3 — Productos sin ventas (LEFT JOIN)
SELECT p.nombre_producto,cat.Nombre_categoria,p.precio FROM productos AS p
LEFT JOIN ventas AS v
ON v.id_producto = p.Id_productos
INNER JOIN categorias as cat
ON p.Id_categoria = cat.Id_categoria
WHERE v.id_ventas IS NULL

--Consulta 4 — Consolidado por canal (UNION ALL)
SELECT canal, SUM(total) AS total_ventas 
FROM (
SELECT v.fecha_venta,v.cantidad * v.precio_unitario AS total, 'periodo 1' AS canal FROM ventas AS v
WHERE v.fecha_venta <= '2024-03-10'
UNION ALL
SELECT v.fecha_venta,v.cantidad * v.precio_unitario AS total, 'periodo 2' AS canal FROM ventas AS v
WHERE v.fecha_venta > '2024-03-10'
) AS consolidado
GROUP BY canal


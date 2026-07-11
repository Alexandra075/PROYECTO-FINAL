USE tienda_online;

-- Ver los clientes que mas dinero hann invertido y ver que pedidos tienen pendientes 
SELECT cl.nombre AS cliente, cl.correo,
       COUNT(DISTINCT pe.id_pedido) AS pedidos_pendientes,
       SUM(dp.cantidad * dp.precio_unitario) AS total_gastado
FROM clientes cl
JOIN pedidos pe ON cl.id_cliente = pe.id_cliente
JOIN detalles_pedido dp ON pe.id_pedido = dp.id_pedido
WHERE pe.estado = 'pendiente'
GROUP BY cl.id_cliente;
USE tienda_online;

-- Mostrar los clientes que han realizado más de 1 pedido
SELECT cl.nombre, COUNT(pe.id_pedido) AS total_pedidos
FROM clientes cl
JOIN pedidos pe ON cl.id_cliente = pe.id_cliente
GROUP BY cl.id_cliente
HAVING total_pedidos > 1;
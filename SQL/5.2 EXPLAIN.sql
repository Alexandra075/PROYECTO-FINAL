-- Impacto en la validacion de pedidos pendientes
EXPLAIN SELECT COUNT(*) FROM pedidos WHERE id_cliente = 1 AND estado = 'pendiente';
-- Impacto en la validacion de pedidos pendientes
EXPLAIN SELECT COUNT(*) FROM pedidos WHERE id_cliente = 1 AND estado = 'pendiente';
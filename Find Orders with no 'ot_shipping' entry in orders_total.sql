SELECT o.orders_id, o.*
FROM orders AS o 
WHERE o.orders_id NOT IN (SELECT ot.orders_id FROM orders_total AS ot WHERE ot.class = 'ot_shipping') 
	AND o.orders_status NOT IN (1, 2, 6)
ORDER BY o.orders_id DESC
SELECT o.*
FROM orders AS o 
WHERE o.orders_id NOT IN (SELECT ot.orders_id FROM orders_total AS ot WHERE ot.class = 'ot_shipping') 
	AND YEAR(o.date_purchased) >= 2011 
	AND o.orders_status NOT IN (1, 2)

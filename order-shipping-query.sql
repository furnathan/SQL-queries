SELECT DATE_SUB(NOW(), INTERVAL 1 WEEK), o.*, ot.title, osh.date_added
FROM orders AS o, orders_total AS ot, orders_status_history AS osh
WHERE osh.orders_status_id = 3
	AND o.orders_status = 3
	AND ot.orders_id = o.orders_id
	AND ot.class="ot_shipping"
	AND osh.orders_id = o.orders_id
	AND osh.date_added > DATE_SUB(NOW(), INTERVAL 1 WEEK)

ORDER BY o.orders_id DESC;

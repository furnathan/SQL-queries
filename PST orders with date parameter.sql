SELECT o.date_purchased, o.orders_id, o.delivery_name, o.delivery_company, o.delivery_street_address, o.delivery_suburb, o.delivery_city, o.delivery_state, o.delivery_country, o.delivery_postcode, o.orders_status,
/* Get Total Tax */
(SELECT ot.value FROM orders_total AS ot WHERE ot.orders_id=o.orders_id AND ot.class='ot_tax') AS tax_total,
/* Get PST */
(SELECT ot.value*0.07 FROM orders_total AS ot WHERE ot.orders_id=o.orders_id AND ot.class='ot_subtotal') AS pst,
/* Get Subtotal */
(SELECT ot.value FROM orders_total AS ot WHERE ot.orders_id=o.orders_id AND ot.class='ot_subtotal') AS subtotal,
/* Shipping */
(SELECT ot.value FROM orders_total AS ot WHERE ot.orders_id=o.orders_id AND ot.class='ot_shipping') AS shipping,
/* Order Total */
(SELECT ot.value FROM orders_total AS ot WHERE ot.orders_id=o.orders_id AND ot.class='ot_total') AS total
FROM orders AS o
WHERE o.delivery_state LIKE '%Manitoba%' /* Only MB delivery addresses */
	AND o.orders_status = 3 /* Only Orders with Status "shipped" */
	AND o.date_purchased BETWEEN "2006-5-31" AND "2008-6-01"
ORDER BY orders_id DESC /* Newest to Oldest */
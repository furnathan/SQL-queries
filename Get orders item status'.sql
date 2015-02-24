/*
select op.products_id, op.products_model, op.products_name, op.final_price, op.products_quantity, sc.stock_om_qoh, sc.stock_om_dropship, IFNULL(pa.stock_flag, p.products_stock_check), p.products_lead_time
from orders_products op 
	LEFT JOIN orders_products_attributes opa ON opa.orders_products_id = op.orders_products_id
	LEFT JOIN products_attributes pa ON (pa.options_id = opa.products_options_id AND pa.options_values_id = opa.products_options_values_id AND pa.products_id = op.products_id)
	LEFT JOIN stock_check AS sc ON (sc.stock_pid = op.products_id AND (IF(ISNULL(pa.products_attributes_id), 1=1, sc.stock_attr_id = pa.products_attributes_id)))
	LEFT JOIN products AS p ON p.products_id = op.products_id
where op.orders_id = 236777 
order by op.products_name
*/

select op.products_id, op.products_model, op.products_name, op.final_price, op.products_quantity, IF(op.products_quantity <= sc.stock_om_qoh, 0, p.products_lead_time)
from orders_products op 
	LEFT JOIN orders_products_attributes opa ON opa.orders_products_id = op.orders_products_id
	LEFT JOIN products_attributes pa ON (pa.options_id = opa.products_options_id AND pa.options_values_id = opa.products_options_values_id AND pa.products_id = op.products_id)
	LEFT JOIN stock_check AS sc ON (sc.stock_pid = op.products_id AND (IF(ISNULL(pa.products_attributes_id), 1=1, sc.stock_attr_id = pa.products_attributes_id)))
	LEFT JOIN products AS p ON p.products_id = op.products_id
where op.orders_id = 236777 
order by op.products_name


/*select op.products_id, op.products_model, op.products_name, op.final_price, op.products_quantity, p.products_lead_time
from orders_products op, orders_products_attributes opa, products p, products_options po, products_options_values pov, products_attributes pa
where op.orders_id = '236777' 
AND op.orders_id = opa.orders_id 
AND p.products_id = op.products_id
AND po.products_options_id = opa.products_options_id
AND pov.products_options_values_id = opa.products_options_values_id
AND op.orders_products_id = opa.orders_products_id
AND pa.options_id = po.products_options_id
AND pa.options_values_id = pov.products_options_values_id
AND pa.products_id = p.products_id
order by op.products_name;
*/

/*SELECT op.products_id, op.products_model, op.products_name, op.final_price, op.products_quantity, p.products_lead_time, sc.*, *
FROM orders_products op, products p, orders_products_attributes opa LEFT JOIN products_attributes pa ON (pa.options_values_id = opa.products_options_values_id AND pa.products_id = opa.orders_products_id), stock_check AS sc

WHERE op.orders_id = 236777
	AND p.products_id = op.products_id
	AND opa.orders_id = op.orders_id
	AND sc.stock_pid = p.products_id
;
*/
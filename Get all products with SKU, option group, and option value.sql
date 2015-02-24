SELECT p.products_id, p.products_model, po.products_options_id, po.products_options_name, pov.products_options_code
FROM products p 
	RIGHT JOIN products_attributes pa ON pa.products_id = p.products_id 
	LEFT JOIN products_options po ON po.products_options_id = pa.options_id AND po.language_id = 1 
	LEFT JOIN products_options_values pov ON pov.products_options_values_id = pa.options_values_id AND pov.language_id = po.language_id
WHERE p.products_status = 1 AND pa.products_id = p.products_id
ORDER BY p.products_id, products_options_id, products_options_code;
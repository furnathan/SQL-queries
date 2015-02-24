SELECT po.products_options_id, po.products_options_name
FROM products_options po
WHERE po.products_options_id NOT IN (SELECT pa.options_id FROM products p, products_attributes pa WHERE p.products_status = 1 AND pa.products_id = p.products_id GROUP BY options_id) 
GROUP BY po.products_options_id

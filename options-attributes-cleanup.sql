DELETE FROM products_options WHERE products_options_id NOT IN (SELECT pa.options_id FROM products_attributes pa, products p WHERE p.products_id = pa.products_id AND p.products_status = 1 GROUP BY pa.options_id);
DELETE FROM products_attributes WHERE options_id NOT IN (SELECT po.products_options_id FROM products_options po);
DELETE FROM products_options_values WHERE products_options_values_id NOT IN (SELECT options_values_id FROM products_attributes AS pa);
INSERT INTO products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, products_options_sort_order, stock_flag) VALUES(10000, 10000, 10000, 10000, 0.00, 0, 0);
INSERT INTO products_options_values (products_options_values_id, language_id, products_options_values_name) VALUES (10000, 1, '- Please Select -');

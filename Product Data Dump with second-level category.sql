/* SELECT cd.categories_name AS category, p.products_model AS LocalSKU, p.products_parent_sku AS parent_sku, round(p.products_price, 2) AS price, p.products_weight AS actual_weight, p.products_weight * 3 AS published_weight
FROM products p, categories_description cd, products_to_categories p2c, categories c
WHERE p2c.products_id = p.products_id 
	AND c.categories_id = p2c.categories_id
	AND cd.categories_id = IF(c.parent_id <> 0 AND c.parent_id NOT IN (SELECT categories_id FROM categories WHERE parent_id = 0), c.parent_id, c.categories_id)
	AND c.page_status_op3 = 0
	AND p.products_status = 1
	AND cd.language_id = 1
GROUP BY LocalSKU
ORDER BY LocalSKU, cd.categories_name
*/

/*
SELECT cd.categories_name, sc.stock_om_sku AS LocalSKU, round(p.products_price, 2) AS price, p.products_weight AS actual_weight, p.products_weight * 3 AS published_weight
FROM stock_check sc, products p, products_to_categories p2c, categories_description cd, categories c
WHERE sc.stock_pid = p.products_id
	AND p.products_id = p2c.products_id
	AND c.categories_id = p2c.categories_id
	AND c.categories_id = cd.categories_id
	AND cd.categories_id = IF(c.parent_id <> 0 AND c.parent_id NOT IN (SELECT categories_id FROM categories WHERE parent_id = 0), c.parent_id, c.categories_id)
/*	AND c.page_status_op3 = 0
	AND p.products_status = 1
*/
/*	AND cd.language_id = 1 */

SELECT sc.stock_om_sku AS LocalSKU, MAX(round(p.products_price, 2)) AS price, p.products_weight AS actual_weight, p.products_weight * 3 AS published_weight, cd.categories_name, c.page_status_op3, c.sort_order
FROM products p LEFT JOIN stock_check sc ON p.products_id = sc.stock_pid, products_to_categories p2c, categories_description cd, categories c
WHERE p.products_status = 1
	AND c.categories_id = p2c.categories_id
	AND cd.categories_id = IF(c.parent_id <> 0 AND c.parent_id NOT IN (SELECT categories_id FROM categories WHERE parent_id = 0), c.parent_id, c.categories_id)
	AND p2c.products_id = sc.stock_pid
	AND cd.language_id = 1
	AND c.page_status_op3 = 0
	AND categories_name NOT LIKE "Overstock%"

GROUP BY LocalSKU
ORDER BY c.sort_order ASC, LocalSKU, categories_name

/*
SELECT cd.categories_name 
FROM products p LEFT JOIN products_to_categories p2c ON p.products_id = p2c.products_id LEFT JOIN categories_description cd ON cd.categories_id = p2c.categories_id
WHERE p.products_model LIKE "1-1000-brown%" AND cd.language_id = 1

*/
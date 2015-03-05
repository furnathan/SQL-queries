SELECT sc.stock_om_sku AS LocalSKU, MAX(round(p.products_price, 2)) AS price, p.products_weight AS actual_weight, p.products_weight * 3 AS published_weight, cd.categories_name, c.page_status_op3, c.sort_order
FROM products p LEFT JOIN stock_check sc ON p.products_id = sc.stock_pid, products_to_categories p2c, categories_description cd, categories c
WHERE p.products_status = 1
	AND c.categories_id = p2c.categories_id
	AND cd.categories_id = IF(c.parent_id <> 0 AND c.parent_id NOT IN (SELECT categories_id FROM categories WHERE parent_id = 0), c.parent_id, c.categories_id)
	AND p2c.products_id = sc.stock_pid
	AND cd.language_id = 1
	AND c.page_status_op3 <> 0

GROUP BY LocalSKU
ORDER BY c.sort_order ASC, LocalSKU, categories_name
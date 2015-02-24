/* 
SELECT COUNT(p2c.categories_id) AS count, p2c.categories_id AS categories_id FROM products_to_categories p2c GROUP BY p2c.categories_id ORDER BY count DESC
*/

/*
SELECT * 
FROM products_to_categories p2c, products p, categories c 
WHERE p2c.products_id = p.products_id 
	AND c.categories_id = p2c.categories_id


SELECT * FROM products_to_categories p2c LEFT JOIN categories c ON c.categories_id = p2c.categories_id LEFT JOIN products p ON p.products_id = p2c.products_id
WHERE (p2c.categories_id IN (234, 233, 96) OR c.parent_id IN (234, 233, 96) OR c.parent_id IN (SELECT categories_id FROM categories WHERE parent_id IN (234, 233, 96))) AND p.products_status = 0
*/




UPDATE products_to_categories p2c LEFT JOIN categories c ON c.categories_id = p2c.categories_id LEFT JOIN products p ON p.products_id = p2c.products_id
SET p2c.categories_id = 262
WHERE (p2c.categories_id IN (234, 233, 96) OR c.parent_id IN (234, 233, 96) OR c.parent_id IN (SELECT categories_id FROM categories WHERE parent_id IN (234, 233, 96))) AND p.products_status = 0;



/*
SELECT * FROM products_to_categories p2c LEFT JOIN categories_description cd ON cd.categories_id = p2c.categories_id AND cd.language_id = 1 WHERE p2c.products_id = 3264
*/



SELECT count(products_id), products_id FROM products_to_categories WHERE products_id IN (SELECT p2c.products_id 
FROM categories c LEFT JOIN products_to_categories p2c ON p2c.categories_id = c.categories_id 
WHERE c.categories_id = 93 OR c.parent_id = 93)
GROUP BY products_id
HAVING count(products_id) < 2
/*
This delete should delete all entries from products_to_categories WHERE the product_id is a duplicate, and remove the non-"turned off" category entry

DELETE FROM products_to_categories WHERE products_id IN (SELECT products_id FROM (SELECT * FROM products_to_categories p2c WHERE p2c.categories_id = 262) AS inside) AND categories_id <> 262;
*/

/*
UPDATE products_to_categories p2c LEFT JOIN products p ON p.products_id = p2c.products_id
SET p2c.categories_id = 262
WHERE p.products_status = 0;

*/

SELECT * FROM products_to_categories WHERE products_id IN (SELECT products_id FROM products WHERE products_status = 0) AND categories_id <> 262
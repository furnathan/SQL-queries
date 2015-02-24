DELETE FROM products_to_categories WHERE products_id NOT IN (SELECT products_id FROM products) OR categories_id NOT IN (SELECT categories_id FROM categories) AND categories_id <> 0;
DELETE FROM products WHERE products_id NOT IN (SELECT products_id FROM products_to_categories);
DELETE FROM products_description WHERE products_id NOT IN (SELECT products_id FROM products_to_categories);
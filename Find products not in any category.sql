SELECT CONCAT("http://www.furhatworld.com/fake-p-", p.products_id, ".html") AS url, pd.*, p.* p.products_id FROM products p, products_description pd
WHERE p.products_id NOT IN (SELECT p2c.products_id FROM products_to_categories p2c) 
AND pd.products_id = p.products_id
AND p.products_status = 1

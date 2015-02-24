UPDATE products AS p 
	LEFT JOIN products_description AS pd ON p.products_id=pd.products_id
	LEFT JOIN products_to_categories AS p2c ON p.products_id=p2c.products_id
	LEFT JOIN categories_description AS cd ON p2c.categories_id=cd.categories_id
	LEFT JOIN categories AS c ON cd.categories_id=c.categories_id
SET p.products_parent_sku = ''
WHERE cd.categories_id IN (102, 77)
	OR c.parent_id IN (102, 77);
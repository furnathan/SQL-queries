SELECT cd.categories_name, REPLACE(REPLACE(REPLACE(LOWER(cd.categories_name), '/', ''), '  ', ' '),' ', '-') FROM categories AS c LEFT JOIN categories_description AS cd ON c.categories_id=cd.categories_id 
WHERE c.parent_id IN 
	(SELECT c.categories_id FROM categories AS c
	WHERE c.parent_id IN
		(SELECT c.categories_id
		FROM `categories` AS c
		WHERE c.parent_id=0
		ORDER BY c.sort_order)
	ORDER BY c.sort_order)
ORDER BY c.parent_id, c.sort_order;
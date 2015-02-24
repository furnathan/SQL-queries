/* If the # of reviews for an item is fewer than 10, update all review dates < 2013 to = 2013. Else, update all review dates < 2012 to = 2012 */
UPDATE reviews r LEFT JOIN (SELECT count(*) AS count, products_id FROM reviews r2 WHERE r2.approved = 1 GROUP BY products_id) AS c ON c.products_id = r.products_id
SET r.date_added = 
	IF ( c.count < 10, 
		REPLACE(date_added, YEAR(date_added), IF (YEAR(date_added) < 2013, 
			'2013', 
			YEAR(date_added))), 
		REPLACE(date_added, YEAR(date_added), IF (YEAR(date_added) < 2012, 
			'2012', 
			YEAR(date_added)))
  );
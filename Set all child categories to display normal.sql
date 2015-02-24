/* UPDATE products AS p SET p.products_dropship = 0 */
/* SELECT c.parent_id FROM categories AS c GROUP BY c.parent_id */
UPDATE categories AS c SET c.page_status = 0 WHERE c.categories_id NOT IN (/* List of Categories from the query above */)

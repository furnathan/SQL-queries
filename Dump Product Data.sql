SELECT sc.stock_om_sku, p.products_id, p.products_price, p.products_cost,  p.products_weight AS Weight, 3 * p.products_weight AS PublishedWeight, p.products_brand, p.products_country, cd.categories_name, p.products_ordered, pd.products_viewed, 
p.products_lead_time, pd.products_name, REPLACE(pd.products_description, "\r\n", "") AS products_description, REPLACE(pd.products_head_title_tag, "\r\n", "") AS products_head_title_tag, cd.categories_gender, 
CONCAT('http://www.furhatworld.com/product_info.php?products_id=',p.products_id) AS purl, p.products_image_color, p.products_parent_sku, p.products_image, pd.products_head_keywords_tag, REPLACE(pd.products_head_desc_tag, "\r\n", "") AS products_head_desc_tag,
p.products_alias, REPLACE(pd.products_measurements, "\r\n", "") AS products_measurements, 
(SELECT IF(parent_id != 0, categories_name, '') FROM categories_description WHERE categories_id=c.parent_id AND language_id = 1) AS parent_category, CONCAT("http://www.", (SELECT configuration_value FROM configuration WHERE configuration_key = "STORE_NAME"), "/images/", p.products_image) AS image_url

FROM products AS p RIGHT JOIN stock_check AS sc ON sc.stock_pid = p.products_id, products_description AS pd, categories_description AS cd, products_to_categories AS ptc, categories AS c 
WHERE p.products_id=pd.products_id AND p.products_status=1 AND ptc.products_id=p.products_id AND cd.categories_id=ptc.categories_id AND c.categories_id = cd.categories_id AND c.page_status_op3 = 0 
GROUP BY sc.stock_om_sku
ORDER BY p.products_ordered DESC

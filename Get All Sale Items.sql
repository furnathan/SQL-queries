SELECT p.products_model, pd.products_name, p.products_price, s.specials_new_products_price, pd.products_viewed, p.products_quantity, p.products_ordered 
FROM specials s LEFT JOIN products p ON s.products_id = p.products_id LEFT JOIN products_description pd ON (pd.products_id = p.products_id AND pd.language_id = 1)
WHERE s.status = 1
AND p.products_status = 1

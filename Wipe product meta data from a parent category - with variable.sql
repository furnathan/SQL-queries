SET @target_cat = 93;

UPDATE products_to_categories p2c, products_description pd
SET pd.products_name = '', pd.products_description = '', pd.products_head_title_tag = '', pd.products_head_desc_tag = '', pd.products_head_keywords_tag = '', pd.products_seo = ''
WHERE pd.products_id = p2c.products_id  AND p2c.categories_id IN (SELECT c.categories_id FROM categories c WHERE c.parent_id = @target_cat) AND pd.language_id <> 1;


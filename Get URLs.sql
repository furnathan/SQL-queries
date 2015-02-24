/* SELECT CONCAT(LOWER(REPLACE(REPLACE(products_seo, " - ", "-"), " ", "-")), "-p-", pd.products_id, ".html") FROM products_description pd WHERE pd.products_url = "noindex" */

SELECT c.categories_url, CONCAT(LOWER(REPLACE(cd.categories_seo, " ", "-")), "-", c.categories_id, ".html") FROM categories c, categories_description cd WHERE c.categories_id = cd.categories_id AND c.categories_url <> ""

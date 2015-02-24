SELECT CONCAT(LOWER(REPLACE(REPLACE(products_seo, " - ", "-"), " ", "-")), "-c-", pd.products_id, ".html") FROM products_description pd WHERE pd.products_url = "noindex"

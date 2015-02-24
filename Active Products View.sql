SELECT
products.products_alias,
products.products_model,
products_description.products_name
FROM
products ,
products_description
WHERE
products.products_status = 1 AND
products.products_id = products_description.products_id ;


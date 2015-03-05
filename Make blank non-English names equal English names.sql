UPDATE
    products_description pd INNER JOIN products_description pd2 ON
    (pd.products_id=pd2.products_id AND pd2.language_id=1 AND pd.language_id<>1)
SET pd.products_name = pd2.products_name
WHERE pd.products_name = "";

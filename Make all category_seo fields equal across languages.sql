UPDATE
    categories_description cd INNER JOIN categories_description cd2 ON
    (cd.categories_id=cd2.categories_id AND cd2.language_id=1 AND cd.language_id<>1)
SET cd.categories_seo = cd2.categories_seo;

UPDATE
    products_description pd INNER JOIN products_description pd2 ON
    (pd.products_id=pd2.products_id AND pd2.language_id=1 AND pd.language_id<>1)
SET pd.products_seo = pd2.products_seo;

UPDATE
    categories_description cd INNER JOIN categories_description cd2 ON
    (cd.categories_id = cd2.categories_id AND cd2.language_id = 1 AND cd.language_id <> 1)
SET cd.categories_gender = cd2.categories_gender;
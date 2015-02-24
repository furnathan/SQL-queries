UPDATE categories_description AS cd
SET cd.categories_description2 = TRIM(BOTH '|' FROM SUBSTRING(cd.categories_description, LOCATE('|', cd.categories_description))),
cd.categories_description = TRIM(BOTH '|' FROM LEFT(cd.categories_description, LOCATE('|', cd.categories_description)))
WHERE LOCATE('|', cd.categories_description) != 0;
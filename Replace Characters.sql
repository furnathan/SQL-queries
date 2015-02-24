/* Update products descriptions */

UPDATE products_description AS pd SET pd.products_name=REPLACE(pd.products_name, '®', '&reg;'), pd.products_description=REPLACE(pd.products_description, '®', '&reg;'), pd.products_measurements=REPLACE(pd.products_measurements, '®', '&reg;');
UPDATE products_description AS pd SET pd.products_name=REPLACE(pd.products_name, '©', '&copy;'), pd.products_description=REPLACE(pd.products_description, '©', '&copy;'), pd.products_measurements=REPLACE(pd.products_measurements, '©', '&copy;');
UPDATE products_description AS pd SET pd.products_name=REPLACE(pd.products_name, '™', '&trade;'), pd.products_description=REPLACE(pd.products_description, '™', '&trade;'), pd.products_measurements=REPLACE(pd.products_measurements, '™', '&trade;');
UPDATE products_description AS pd SET pd.products_name=REPLACE(pd.products_name, '—', ' - '), pd.products_description=REPLACE(pd.products_description, '—', ' - '), pd.products_measurements=REPLACE(pd.products_measurements, '—', ' - ');
UPDATE products_description AS pd SET pd.products_name=REPLACE(pd.products_name, '–', ' - '), pd.products_description=REPLACE(pd.products_description, '–', ' - '), pd.products_measurements=REPLACE(pd.products_measurements, '–', ' - ');
UPDATE products_description AS pd SET pd.products_name=REPLACE(pd.products_name, '”', '"'), pd.products_description=REPLACE(pd.products_description, '”', '"'), pd.products_measurements=REPLACE(pd.products_measurements, '”', '"');
UPDATE products_description AS pd SET pd.products_name=REPLACE(pd.products_name, '’', "'"), pd.products_description=REPLACE(pd.products_description, '’', "'"), pd.products_measurements=REPLACE(pd.products_measurements, '’', "'");
UPDATE products_description AS pd SET pd.products_name=REPLACE(pd.products_name, '`', "'"), pd.products_description=REPLACE(pd.products_description, '`', "'"), pd.products_measurements=REPLACE(pd.products_measurements, '`', "'");

 
/* UPdate products features */
UPDATE products AS p SET p.products_features=REPLACE(p.products_features, '”', '"');
UPDATE products AS p SET p.products_features=REPLACE(p.products_features, '—', ' - ');
UPDATE products AS p SET p.products_features=REPLACE(p.products_features, '–', ' - ');
UPDATE products AS p SET p.products_features=REPLACE(p.products_features, '™', '&trade;');
UPDATE products AS p SET p.products_features=REPLACE(p.products_features, '©', '&copy;');
UPDATE products AS p SET p.products_features=REPLACE(p.products_features, '’', "'");
UPDATE products AS p SET p.products_features=REPLACE(p.products_features, '`', "'");
UPDATE products AS p SET p.products_features=REPLACE(p.products_features, '®', '&reg;');

/* Update categories descriptions */
UPDATE categories_description AS cd
SET cd.categories_name = REPLACE(cd.categories_name, '®', '&reg;'), 
	cd.categories_description = REPLACE(cd.categories_description, '®', '&reg;'),
	cd.categories_description2 = REPLACE(cd.categories_description2,  '®', '&reg;'),
	cd.categories_heading_title = REPLACE(cd.categories_heading_title, '®', '&reg;');

UPDATE categories_description AS cd
SET cd.categories_name = REPLACE(cd.categories_name, '™', '&trade;'), 
	cd.categories_description = REPLACE(cd.categories_description, '™', '&trade;'),
	cd.categories_description2 = REPLACE(cd.categories_description2,  '™', '&trade;'),
	cd.categories_heading_title = REPLACE(cd.categories_heading_title, '™', '&trade;');

UPDATE categories_description AS cd
SET cd.categories_name = REPLACE(cd.categories_name, '`', "'"), 
	cd.categories_description = REPLACE(cd.categories_description, '`', "'"),
	cd.categories_description2 = REPLACE(cd.categories_description2,  '`', "'"),
	cd.categories_heading_title = REPLACE(cd.categories_heading_title, '`', "'");

UPDATE categories_description AS cd
SET cd.categories_name = REPLACE(cd.categories_name, '—', ' - '), 
	cd.categories_description = REPLACE(cd.categories_description, '—', ' - '),
	cd.categories_description2 = REPLACE(cd.categories_description2, '—', ' - '),
	cd.categories_heading_title = REPLACE(cd.categories_heading_title, '—', ' - ');

UPDATE categories_description AS cd
SET cd.categories_name = REPLACE(cd.categories_name, '–', ' - '), 
	cd.categories_description = REPLACE(cd.categories_description, '–', ' - '),
	cd.categories_description2 = REPLACE(cd.categories_description2, '–', ' - '),
	cd.categories_heading_title = REPLACE(cd.categories_heading_title, '–', ' - ');

UPDATE categories_description AS cd
SET cd.categories_name = REPLACE(cd.categories_name, '”', '"'), 
	cd.categories_description = REPLACE(cd.categories_description, '”', '"'),
	cd.categories_description2 = REPLACE(cd.categories_description2, '”', '"'),
	cd.categories_heading_title = REPLACE(cd.categories_heading_title, '”', '"');

UPDATE categories_description AS cd
SET cd.categories_name = REPLACE(cd.categories_name, '’', "'"), 
	cd.categories_description = REPLACE(cd.categories_description, '’', "'"),
	cd.categories_description2 = REPLACE(cd.categories_description2,  '’', "'"),
	cd.categories_heading_title = REPLACE(cd.categories_heading_title, '’', "'");

UPDATE categories_description AS cd
SET cd.categories_name = REPLACE(cd.categories_name, '©', '&copy;'), 
	cd.categories_description = REPLACE(cd.categories_description, '©', '&copy;'),
	cd.categories_description2 = REPLACE(cd.categories_description2, '©', '&copy;'),
	cd.categories_heading_title = REPLACE(cd.categories_heading_title, '©', '&copy;');


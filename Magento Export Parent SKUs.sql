/*
SELECT p.products_image_sm_1, p.products_image_sm_2, p.products_image_sm_3, p.products_image_sm_4, p.products_image_sm_5, p.products_image_sm_6 
FROM products p
WHERE p.products_id = 2631;
*/



/*
SELECT * FROM products p LEFT OUTER JOIN products_to_categories p2c ON (0) WHERE p.products_id = 2662
UNION ALL
SELECT * FROM products p RIGHT OUTER JOIN products_to_categories p2c ON (0) WHERE p.products_id = 2662;
*/
/*

SELECT 
	88 AS _media_attribute_id,
	'' AS _media_image,
	'product image' AS _media_label,
	@numrow := @numrow + 1 AS _media_position,
	0 AS _media_is_disabled
	
FROM (select @numrow := 1) r;

*/
/*

This is for the attributse

SELECT 
	sc.stock_om_sku AS _super_products_sku,
	'rug_size' AS _super_attribute_code,
	pov.products_options_code AS _super_attribute_option,
	pa.options_values_price AS _super_attribute_price_corr
FROM stock_check sc 
	LEFT JOIN products_attributes pa ON pa.products_attributes_id = sc.stock_attr_id
	LEFT JOIN products_options_values pov ON (pov.products_options_values_id = pa.options_values_id AND pov.language_id = 1)
	LEFT JOIN products_to_categories p2c ON sc.stock_pid = p2c.products_id
	LEFT JOIN categories_description cd ON (p2c.categories_id = cd.categories_id AND cd.language_id = pov.language_id)
WHERE sc.stock_sku_type = "child" AND cd.categories_name LIKE "%rug%";
*/


/*

This is a pretty good export so far
*/

/*
SELECT
	sc.stock_om_sku AS sku,
	'' AS _store,
	'Pillow Attributes' AS _attribute_set,
	IF(sc.stock_sku_type = 'parent', 'configurable', 'simple') AS _type,
	IF(c.parent_id = 0, cd.categories_name, CONCAT((SELECT cd2.categories_name FROM categories_description cd2 WHERE cd2.categories_id = c.parent_id AND cd2.language_id = cd.language_id), "/", cd.categories_name)) AS _category,
	'Hide Source' AS _root_category,
	'base' AS _product_websites,
	'' AS cost,
	p.products_country AS country_of_manufacture,
	NOW() AS created_at,
	'' AS custom_design,
	'' AS custom_design_from,
	'' AS custom_design_to,
	'' AS custom_layout_update,
	pd.products_description AS description,
	'' AS gallery,
	'' AS gift_message_available,
	IF(sc.stock_sku_type = 'parent', 1, 0) AS has_options,
	CONCAT('/', p.products_image) AS image,
	'' AS image_label,
	'' AS manufacturer,
	'' AS media_gallery,
	pd.products_head_desc_tag AS meta_description,
	pd.products_head_keywords_tag AS meta_keyword,
	pd.products_head_title_tag AS meta_title,
	'' AS minimal_price,
	'' AS msrp,
	IF(sc.stock_sku_type = 'parent', 'Use config', '') AS msrp_display_actual_price_type,
	IF(sc.stock_sku_type = 'parent', 'Use config', '') AS msrp_enabled,
	pd.products_name AS name,
	'' AS news_from_date,
	'' AS news_to_date,
	IF(sc.stock_sku_type = 'parent', 'Product Info Column', 'Block after Info Column') AS options_container,
	'' AS page_layout,
	p.products_price AS price,
	IF(sc.stock_sku_type = 'parent', 1, 0) AS required_options,


	IF(sc.stock_sku_type = 'parent', '', p.products_image_color) AS image_color,
	IF(po.products_options_name = "Pillow Color", pov.products_options_values_name, "") AS pillow_color,
	IF(po.products_options_name = "Pillow Options", pov.products_options_code, "") AS pillow_option,

	po.products_options_name AS option_name,

	pd.products_head_desc_tag AS short_description,
	'' AS size,
	CONCAT('/', p.products_image) AS small_image,
	'' AS small_image_label,
	'' AS special_from_date,
	'' AS special_price,
	'' AS special_to_date,
	1 AS status,
	2 AS tax_class_id,
	CONCAT('/', p.products_image) AS thumbnail,
	'' AS thumbnail_label,
	NOW() AS updated_at,
	pd.products_seo AS url_key,
	'' AS url_path,
	'' AS vest_size,
	IF(sc.stock_sku_type = 'parent', 4, 1) AS visibility,
	IF(sc.stock_sku_type = 'parent', '', p.products_weight) AS weight,
	sc.stock_om_qoh AS qty,
	0 AS min_qty,
	1 AS use_config_min_qty,
	0 AS is_qty_decimal,
	0 AS backorders,
	1 AS use_config_backorders,
	1 AS min_sale_qty,
	1 AS use_config_min_sale_qty,
	100 AS max_sale_qty,
	1 AS use_config_max_sale_qty,
	1 AS is_in_stock,
	1 AS notify_stock_qty,
	1 AS use_config_notify_stock_qty,
	0 AS manage_stock,
	1 AS use_config_manage_stock,
	0 AS stock_status_changed_auto,
	1 AS use_config_qty_increments,
	0 AS qty_increments,
	1 AS use_config_enable_qty_inc,
	0 AS enable_qty_increments,
	0 AS is_decimal_divided,
	'' AS _links_related_sku,
	'' AS _links_related_position,
	'' AS _links_crosssell_sku,
	'' AS _links_crosssell_position,
	'' AS _links_upsell_sku,
	'' AS _links_upsell_position,
	'' AS _associated_sku,
	'' AS _associated_default_qty,
	'' AS _associated_position,
	'' AS _tier_price_website,
	'' AS _tier_price_customer_group,
	'' AS _tier_price_qty,
	'' AS _tier_price_price,
	'' AS _group_price_website,
	'' AS _group_price_customer_group,
	'' AS _group_price_price,

	sc.stock_osc_sku AS _super_products_sku

FROM
	stock_check sc
LEFT JOIN products p ON p.products_id = sc.stock_pid
LEFT JOIN products_description pd ON(
	pd.products_id = p.products_id
	AND pd.language_id = 1
)
LEFT JOIN products_to_categories p2c ON p2c.products_id = p.products_id
LEFT JOIN categories_description cd ON(
	cd.categories_id = p2c.categories_id
	AND cd.language_id = pd.language_id
)
LEFT JOIN categories c ON c.categories_id = p2c.categories_id
LEFT JOIN products_attributes pa ON sc.stock_attr_id = pa.products_attributes_id
LEFT JOIN products_options po ON (
	po.products_options_id = pa.options_id 
	AND po.language_id = pd.language_id
)
LEFT JOIN products_options_values pov ON (
	pov.products_options_values_id = pa.options_values_id
	AND pov.language_id = pd.language_id
)
WHERE p.products_status = 1
	AND cd.categories_name LIKE "%pillow%";
*/

/* Related images export 
SELECT p.products_model, products_image_sm_1, products_image_sm_2, products_image_sm_3, products_image_sm_4, products_image_sm_5, products_image_sm_6  FROM products p WHERE p.products_status = 1 AND p.products_image_sm_1 != ""
*/


/*	stock_sku_type = "child"
	sc.stock_pid = 2544
 */

/*
SELECT CONCAT(
  'SELECT `products_options`.id', GROUP_CONCAT('
     ,    `t_', REPLACE(name, '`', '``'), '`.value
         AS `', REPLACE(name, '`', '``'), '`'
     SEPARATOR ''),
 ' FROM `table` ', GROUP_CONCAT('
     LEFT JOIN `products_options`   AS `t_', REPLACE(name, '`', '``'), '`
            ON `products_options`.id = `t_', REPLACE(name, '`', '``'), '`.id
           AND `t_', REPLACE(name, '`', '``'), '`.name = ', QUOTE(name)
     SEPARATOR ''),
 ' GROUP BY `products_options`.id'
) INTO @qry FROM (SELECT DISTINCT name FROM `products_options`) t;
/*
PREPARE stmt FROM @qry;
EXECUTE stmt;
*/


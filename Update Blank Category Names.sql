/* This query will set empty category pages title tags to the categories name appended with " Sale at Fur Hat World" Eg. "Fox Fur Shawls Sale at Fur Hat World" */
UPDATE categories_description AS cd SET cd.categories_head_title_tag = cd.categories_heading_title WHERE cd.categories_head_title_tag = "" /* UPDATE blank category title tags */

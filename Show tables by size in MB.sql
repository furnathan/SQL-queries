SELECT TABLE_NAME, table_rows, data_length, index_length, 
round(((data_length + index_length) / 1024 / 1024),2) "Size in MB"
FROM information_schema.TABLES WHERE table_schema = 'furhat_cart'
ORDER BY (data_length + index_length) DESC;
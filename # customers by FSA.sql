/* Find top purchasing FSA's in Canada */
/*SELECT UPPER(LEFT(ab.entry_postcode, 3)) AS fsa, COUNT(*) AS count FROM address_book AS ab WHERE ab.entry_country_id=38 GROUP BY fsa ORDER BY count DESC; /* Canada */
SELECT ab.entry_postcode, COUNT(*) AS count 
FROM address_book AS ab 
WHERE ab.entry_country_id=223 
GROUP BY ab.entry_postcode 
ORDER BY count DESC; /* USA */
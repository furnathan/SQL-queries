UPDATE reviews AS r SET r.reviews_rating = 4 WHERE reviews_rating = 5 AND r.approved = 1 AND r.date_added < '2012-10-01' AND RAND() < .5

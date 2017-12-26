---- ---- ---- ---- ---- ---- ---- ---- ---- ---- --
----- Evaluación de comentarios
--- 1.1025260029717683  1274673 16 GB USB Flash Drive

m = LOAD '/user/grupo6d4/warehouse/dualcore/ratings/ratings_2012.txt' using PigStorage('\t')
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray);
y = LOAD '/user/grupo6d4/warehouse/dualcore/ratings/ratings_2013.txt' using PigStorage('\t')
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray);

messages = UNION m, y;
-- filtering by worse product
filtering = FILTER messages BY prod_id == 1274673;
-- filter by the ngrams mentioned in the previous section
reviews = FILTER filtering BY (message MATCHES '.*too expensive.*' OR message MATCHES '.*times more.*');
rmf /user/grupo6d4/tmp/worse_products_number_evaluations_pig -- remove old data
STORE filtering into '/user/grupo6d4/tmp/worse_products_number_evaluations_pig';

DUMP reviews;
ILLUSTRATE reviews;


---- ---- ---- ---- ---- ---- ---- ---- ---- ---- --
----- Evaluación de comentarios
-- 1  1273720 Executive Stylus and Pen  4

m = LOAD '/user/grupo6d4/warehouse/dualcore/ratings/ratings_2012_copy_1.txt' using PigStorage('\t')
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray);
y = LOAD '/user/grupo6d4/warehouse/dualcore/ratings/ratings_2013_copy_1.txt' using PigStorage('\t')
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray);

messages = UNION m, y;
-- filtering by worse product
filtering = FILTER messages BY prod_id == 1273720;
-- filter by the ngrams mentioned in the previous section
reviews = FILTER filtering BY (message MATCHES '.*too expensive.*' OR message MATCHES '.*times more.*');
rmf /user/grupo6d4/tmp/worse_products_number_evaluations_pig -- remove old data
STORE filtering into '/user/grupo6d4/tmp/worse_products_number_evaluations_pig';

DUMP reviews;
ILLUSTRATE reviews;
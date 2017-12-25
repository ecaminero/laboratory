---- ---- ---- ---- ---- ---- ---- ---- ---- ---- --
-----10 Peores con cantidad de evaluaciones
ratings = LOAD '/user/grupo6d4/warehouse/dualcore/ratings'
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray); -- load products from storage

products = LOAD '/user/grupo6d4/warehouse/dualcore/products'
  AS (prod_id:int, brand:chararray, name:chararray, price:int, cost:int); -- load products from storage

ratings_grouped = GROUP ratings BY prod_id;
ratings_count = FOREACH ratings_grouped GENERATE
  AVG(ratings.rating) AS prod_rating,
  COUNT(ratings.rating) AS number_votes,
  $0 AS prod_id;

all_ratings = order ratings_count BY prod_rating ASC, number_votes DESC;
worse = LIMIT all_ratings 10; -- reduce to 10 elements
result = JOIN worse BY prod_id, products BY prod_id;

rmf /user/grupo6d4/tmp/worse_products -- remove old data
STORE result into '/user/grupo6d4/tmp/worse_products';

DUMP result;

---- ---- ---- ---- ---- ---- ---- ---- ---- ---- --
-----10 Peores Sin cantidad de evaluaciones

ratings = LOAD '/user/grupo6d4/warehouse/dualcore/ratings'
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray); -- load products from storage

products = LOAD '/user/grupo6d4/warehouse/dualcore/products'
  AS (prod_id:int, brand:chararray, name:chararray, price:int, cost:int); -- load products from storage

ratings_grouped = GROUP ratings BY prod_id;
ratings_count = FOREACH ratings_grouped GENERATE
  AVG(ratings.rating) AS prod_rating,
  COUNT(ratings.rating) AS number_votes,
  $0 AS prod_id;

all_ratings = order ratings_count BY prod_rating ASC;
worse = LIMIT all_ratings 10; -- reduce to 10 elements
result = JOIN worse BY prod_id, products BY prod_id;

rmf /user/grupo6d4/tmp/worse_products_number_evaluations -- remove old data
STORE result into '/user/grupo6d4/tmp/worse_products_number_evaluations';

DUMP result;
ratings = LOAD '/user/grupo6d4/warehouse/dualcore/ratings'
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray); -- load products from storage

products = LOAD '/user/grupo6d4/warehouse/dualcore/products'
  AS (prod_id:int, brand:chararray, name:chararray, price:int, cost:int); -- load products from storage

ratings_grouped = GROUP ratings BY prod_id;
ratings_count = FOREACH ratings_grouped GENERATE
  AVG(ratings.rating) AS prod_rating,
  COUNT(ratings.rating) AS votes, $0 AS prod_id;

all_rating = ORDER ratings_count BY prod_rating DESC, votes DESC;
top_rating = LIMIT all_rating 10; -- reduce to 10 elements
better = JOIN top_rating BY prod_id, products BY prod_id;

rmf /user/grupo6d4/tmp/better_products -- remove old elements
store better into '/user/grupo6d4/tmp/better_products';

DUMP better;
ILLUSTRATE better;
ratings = load '/user/grupo6d4/warehouse/dualcore/ratings'
  as (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray); -- load products from storage

products = load '/user/grupo6d4/warehouse/dualcore/products'
  as (prod_id:int, brand:chararray, name:chararray, price:int, cost:int); -- load products from storage

ratings_grouped = group ratings by prod_id;
ratings_count = foreach ratings_grouped generate AVG(ratings.rating) as prod_rating, $0;
result = JOIN ratings_count BY group, products BY group;


all_rating = ORDER ratings_count BY prod_rating DESC;
top_rating = LIMIT all_rating 10; -- reduce to 10 elements

-- result = JOIN top_rating BY group, products BY group;

dump top_rating;
ILLUSTRATE;
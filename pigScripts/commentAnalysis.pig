--Finalmente, en este u ́ltima parte del laboratorio, utilizando la informaci ́on de los n-gramas
--m ́as populares y significativos encontrados en la secci ́on anterior, procese los comentarios
-- usando Pig, Impala o Hive, con el fin de identificar aquellos que entreguen fuerte evidencia de
-- las interpretaciones dadas en la secci ́on anterior. En base a estos comentarios, identifique
-- la causa de los malos comentarios e indique como puede ser esto corregido en la base de datos.
-- Actividades interesantes para el informe: Si utiliz ́o Pig en el an ́alisis anterior,
-- repita el proceso Hive o Impala, y si us ́o Hive o Impala, rep ́ıtalo usando Pig.
--  Comente sobre las diferencias en facilidad de uso y tiempo de ejecuci ́on


m = LOAD '/user/hive/warehouse/ratings/ratings_2012_copy_1.txt' using PigStorage('\t')
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray);

y = LOAD '/user/hive/warehouse/ratings/ratings_2013_copy_1.txt' using PigStorage('\t')
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray);

messages = UNION m, y;

-- filtering by worse product
filtering = FILTER messages BY prod_id == 1274673;

-- filter by the ngrams mentioned in the previous section
reviews = FILTER filtering BY (message MATCHES '.*too expensive.*' OR message MATCHES '.*times more.*');

rmf /user/grupo6d4/tmp/worse_products_number_evaluations_pig_1274673 -- remove old data
STORE reviews into '/user/grupo6d4/tmp/worse_products_number_evaluations_pig_1274673';

DUMP reviews;
ILLUSTRATE reviews;

---- ---- ---- ---- ---- ---- ---- ---- ---- ----
-- 1  1273720 Executive Stylus and Pen  4

m = LOAD '/user/hive/warehouse/ratings/ratings_2012_copy_1.txt' using PigStorage('\t')
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray);
y = LOAD '/user/hive/warehouse/ratings/ratings_2013_copy_1.txt' using PigStorage('\t')
  AS (posted:chararray, cust_id:int, prod_id:int, rating:int, message:chararray);

messages = UNION m, y;

-- filtering by worse product
filtering = FILTER messages BY prod_id == 1273720;

-- filter by the ngrams mentioned in the previous section
reviews = FILTER filtering BY (message MATCHES '.*too expensive.*' OR message MATCHES '.*times more.*');

rmf /user/grupo6d4/tmp/worse_products_number_evaluations_pig_1273720 -- remove old data
STORE reviews into '/user/grupo6d4/tmp/worse_products_number_evaluations_pig_1273720';

DUMP reviews;
ILLUSTRATE reviews;
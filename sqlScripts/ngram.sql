-- Analisis de los comentarios mas populares
-- Bigramas
SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(r.message)), 2, 100)) AS 2ngram
FROM ratings as r
WHERE r.prod_id IN (
    SELECT prod_id FROM (
      SELECT avg(r.rating) AS promedio_rating,
        r.prod_id, p.name AS nombre_producto, count(r.rating) AS cantidad_evaluaciones
        FROM ratings AS r
        LEFT join  products AS p ON r.prod_id = p.prod_id
        GROUP BY r.prod_id, p.brand, p.name, p.price, p.cost, p.shipping_wt
        ORDER BY promedio_rating ASC, cantidad_evaluaciones DESC
        LIMIT 1) as worse );


-- Trigramas
SELECT EXPLODE(NGRAMS(SENTENCES(LOWER(r.message)), 3, 100)) AS 2ngram
FROM ratings as r
WHERE r.prod_id IN (
    SELECT prod_id FROM (
      SELECT avg(r.rating) AS promedio_rating,
        r.prod_id, p.name AS nombre_producto, count(r.rating) AS cantidad_evaluaciones
        FROM ratings AS r
        LEFT join  products AS p ON r.prod_id = p.prod_id
        GROUP BY r.prod_id, p.brand, p.name, p.price, p.cost, p.shipping_wt
        ORDER BY promedio_rating ASC, cantidad_evaluaciones DESC
        LIMIT 1) as worse );
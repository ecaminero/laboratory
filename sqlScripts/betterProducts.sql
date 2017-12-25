---- ---- ---- ---- ---- ---- ---- ---- ---- ---- --
-----10 mejores Sin cantidad de evaluaciones
SELECT avg(r.rating) AS promedio_rating,
  r.prod_id, p.name AS nombre_producto
FROM ratings AS r
LEFT join  products AS p ON r.prod_id = p.prod_id
GROUP BY r.prod_id, p.brand, p.name, p.price, p.cost, p.shipping_wt
ORDER BY promedio_rating DESC
LIMIT 10;

---- ---- ---- ---- ---- ---- ---- ---- ---- ---- --
-- 10 mejores con cantidad de evaluaciones
SELECT avg(r.rating) AS promedio_rating,
  r.prod_id, p.name AS nombre_producto, count(r.rating) AS cantidad_evaluaciones
FROM ratings AS r
LEFT join  products AS p ON r.prod_id = p.prod_id
GROUP BY r.prod_id, p.brand, p.name, p.price, p.cost, p.shipping_wt
ORDER BY promedio_rating DESC, cantidad_evaluaciones DESC
LIMIT 10;

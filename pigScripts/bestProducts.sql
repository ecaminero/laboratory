select avg(r.rating) as rating, r.prod_id as producto,
p.brand, p.name, p.price, p.cost, p.shipping_wt
from ratings as r
left join  products as p on r.prod_id = p.prod_id
group by r.prod_id, p.brand, p.name, p.price, p.cost, p.shipping_wt
order by rating asc
limit 10;
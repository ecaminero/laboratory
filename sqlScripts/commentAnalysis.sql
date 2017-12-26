---- ---- ---- ---- ---- ---- ---- ---- ---- ----
--- 1.1025260029717683  1274673 16 GB USB Flash Drive

SELECT message
FROM ratings
where prod_id = 1274673
AND (message LIKE '%too expensive%' OR message LIKE '%ten times more%');


---- ---- ---- ---- ---- ---- ---- ---- ---- ----
-- 1  1273720 Executive Stylus and Pen  4
SELECT message
FROM ratings
where prod_id = 1273720
AND (message LIKE '%bad%' OR message LIKE '%unacceptable%');


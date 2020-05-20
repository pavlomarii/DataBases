SELECT * FROM ekinoback_movie; 

SELECT G.name, M.name FROM ekinoback_genre G
INNER JOIN ekinoback_movie_genre GM
	ON G.id = GM.genre_id
INNER JOIN ekinoback_movie M
	ON GM.movie_id = M.id
WHERE G.name = "Документальний";

SELECT COUNT(*) AS amount FROM ekinoback_session S
INNER JOIN ekinoback_movie M
	ON S.movie_id = M.id
INNER JOIN ekinoback_movie_actors MA
	ON M.id = MA.movie_id
INNER JOIN ekinoback_actor A
	ON MA.actor_id = A.id
WHERE A.name = "Anton Sokol";

SELECT C.name, AVG(S.price) AS avg_price 
FROM ekinoback_session S
INNER JOIN ekinoback_cinema C
	ON S.cinema_id = C.id
GROUP BY C.id
ORDER BY avg_price;

SELECT ST.name AS studio_name, 
C.name AS cinema_name,
C.rating AS cinema_rating 
FROM ekinoback_studio ST
INNER JOIN ekinoback_movie_studio MS
	ON ST.id = MS.studio_id
INNER JOIN ekinoback_movie M
	ON MS.movie_id = M.id
INNER JOIN ekinoback_session SS
	ON M.id = SS.movie_id
INNER JOIN ekinoback_cinema C
	ON SS.cinema_id = C.id
WHERE ST.name = "BBC Films"
ORDER BY C.rating DESC;




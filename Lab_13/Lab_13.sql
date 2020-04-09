SHOW INDEX FROM mydb.user;

SHOW INDEX FROM mydb.comment;

CREATE INDEX user_nameINDX ON mydb.user (id, name);
SHOW INDEX FROM mydb.user;

CREATE UNIQUE INDEX comment_pubdateINDX ON mydb.comment (user_id, pubdate);
SHOW INDEX FROM mydb.comment;


EXPLAIN SELECT U.id AS userID, U.name AS username, 
			   C.pubdate AS commTime, A.price, AU.volume_engine
FROM mydb.user U 
INNER JOIN mydb.comment C
	ON U.id = C.user_id
INNER JOIN mydb.advertisement A
	ON C.advertisement_id = A.id
INNER JOIN mydb.auto AU
	ON A.auto_id = AU.id
WHERE C.pubdate > '2020-01-14 21:21:22';

EXPLAIN SELECT STRAIGHT_JOIN U.id AS userID, U.name AS username, 
			   C.pubdate AS commTime, A.price, AU.volume_engine
FROM mydb.user U 
INNER JOIN mydb.comment C
	ON U.id = C.user_id
INNER JOIN mydb.advertisement A
	ON C.advertisement_id = A.id
INNER JOIN mydb.auto AU
	ON A.auto_id = AU.id
WHERE C.pubdate > '2020-01-14 21:21:22';
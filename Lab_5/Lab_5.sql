SELECT * FROM mydb.user1 
UNION SELECT * FROM mydb.user2;

SELECT * FROM mydb.user1
WHERE id IN (SELECT id FROM mydb.user2);

SELECT * FROM mydb.user2
WHERE id NOT IN (SELECT id FROM mydb.user1);

SELECT * FROM mydb.user1, mydb.user2;
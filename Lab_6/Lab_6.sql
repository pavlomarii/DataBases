CREATE VIEW mydb.advertisementVIEW AS SELECT DISTINCT id, price, 'condition', auto_id, pubdate
FROM mydb.advertisement;

SELECT * FROM mydb.advertisement
WHERE pubdate >= '2020-05-21' AND pubdate <= '2020-05-23';

SELECT mydb.advertisement.id, mydb.advertisement.price, mydb.advertisement.auto_id, mydb.advertisement.mileage,
mydb.advertisement.user_id, mydb.user.name, mydb.user.surname
FROM mydb.advertisement, mydb.user WHERE mydb.user.id = mydb.advertisement.user_id;

SELECT mydb.advertisement.id, mydb.advertisement.price,
mydb.advertisement.auto_id, mydb.advertisement.mileage,
mydb.advertisement.user_id, mydb.user.name, mydb.user.surname
FROM mydb.advertisement, mydb.user 
WHERE mydb.user.id = mydb.advertisement.user_id 
AND mydb.advertisement.price > mydb.advertisement.mileage;

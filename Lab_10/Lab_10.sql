SELECT id, price, mileage, encode(color) AS code
FROM mydb.advertisement
WHERE mileage >= 200000;

SELECT id, price, mileage, decode(tbl.code) FROM
(SELECT id, price, mileage, encode(color) AS code
FROM mydb.advertisement
WHERE mileage >= 200000)
AS tbl;

CALL get_marks_by_dates('2020-01-01 10:10:10', '2020-04-04 21:21:24');
SELECT * FROM mydb.marks_by_dates;

CALL get_marks_by_dates('2020-04-04 21:21:24', '2020-01-01 10:10:10');
SELECT * FROM mydb.marks_by_dates;
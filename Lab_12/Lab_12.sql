SELECT * FROM mydb.auto
LIMIT 3;

DELETE FROM mydb.type 
WHERE id IN (2, 3);

CREATE TRIGGER type_delete 
BEFORE DELETE ON mydb.type 
FOR EACH ROW
UPDATE mydb.auto SET type_id=1 WHERE type_id=OLD.id;

DELETE FROM mydb.type 
WHERE id IN (2, 3);

SELECT * FROM mydb.auto
LIMIT 3;

CREATE TRIGGER user_password 
BEFORE INSERT ON mydb.user 
FOR EACH ROW
SET NEW.password = AES_ENCRYPT(NEW.password, 'key-key');

INSERT INTO mydb.user VALUES 
(18, 'Jack', 'Timber', '2548759613', 'jacktimber@gmail.com', 1, 'mypassword1'),
(19, 'John', 'Tumber', '4528754123', 'johntumber@gmail.com', 3, 'simplepass'),
(20, 'Jery', 'Trello', '8574658752', 'jerytrello@gmail.com', 5, '1111');

SELECT * FROM mydb.user
WHERE id > 15;

ALTER TABLE mydb.user
ADD COLUMN last_activity DATETIME DEFAULT NULL;

CREATE TRIGGER user_last_activity 
AFTER INSERT ON mydb.advertisement 
FOR EACH ROW
UPDATE mydb.user SET user.last_activity=(NEW.pubdate)
WHERE user.id=NEW.user_id;

INSERT INTO mydb.advertisement VALUES 
(21, 10000, 70000, 'blue', 'good', '2020-03-26 21:21:25', '67512', 2019, 'Text', 2, 1),
(22, 6000, 120000, 'green', 'bad', '2020-04-27 21:21:25', '67512', 2012, 'Text', 4, 2);

SELECT * FROM mydb.user;

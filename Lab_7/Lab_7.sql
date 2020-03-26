SELECT email FROM mydb.user WHERE id=9;

SELECT user.id, user.name, user.email, comment.id, comment.text
FROM mydb.user 
LEFT JOIN mydb.comment 
ON user.id = comment.user_id;

CREATE TABLE IF NOT EXISTS `mydb`.`group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE`  (`id` ASC) )
ENGINE = InnoDB;

ALTER TABLE mydb.user
	ADD COLUMN group_id INT NOT NULL,
  ADD CONSTRAINT user_group FOREIGN KEY (group_id)
  REFERENCES mydb.group (id) ON DELETE NO ACTION;


SELECT user.name, group.name
FROM mydb.user 
INNER JOIN mydb.group 
ON group.id = user.group_id
WHERE group.name = 'Guests';

SELECT user.name, group.name, comment.id, comment.text
FROM (mydb.user INNER JOIN mydb.group) 
INNER JOIN mydb.comment
ON group.id = user.group_id AND comment.user_id = user.id
WHERE group.name IN ('Guests', 'Group2');

SELECT user.name, advertisement.price, advertisement.condition, advertisement.pubdate
FROM mydb.user INNER JOIN mydb.advertisement
ON user.id = advertisement.user_id
WHERE user.group_id IN (SELECT group.id FROM mydb.group
WHERE group.name IN ('Group1', 'Group2'))
ORDER BY advertisement.pubdate DESC 
LIMIT 3;

SELECT user.name FROM mydb.user
WHERE NOT EXISTS
(SELECT * FROM mydb.comment 
WHERE comment.user_id = user.id);

SELECT user.name, user.telephone_number
FROM mydb.user
WHERE user.telephone_number NOT REGEXP '[0-9]{10}';


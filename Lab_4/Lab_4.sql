INSERT INTO mydb.type VALUES (
1, 'Седан', 'Триоб\'ємний кузов легкового автомобіля з двома або трьома 
рядами 2 або 3 сидінь, з чотирма дверима і багажником, структурно відокремленим від пасажирського салону.'
);

INSERT INTO mydb.type VALUES 
(2, 'Універсал', 'Тип закритого кузова легкового автомобіля з двома-чотирма рядами сидінь, з трьома або п\'ятьма дверима.'), 
(3, 'Хетчбек', 'Назва кузову легкового автомобіля з одним або двома рядами сидінь, з трьома чи п\'ятьма дверима, одні з яких розміщені позаду.'), 
(4, 'Мінівен', 'Легковик з однооб\'ємним кузовом безкапотного (рідше вагонного) або півтораоб\'ємного компонування, зазвичай з трьома рядами сидінь.'), 
(5, 'Позашляховик', 'Повноприводний (4×4) легковий чи легкий комерційний автомобіль підвищеної прохідності для експлуатації на шляхах всіх рівнів, а також на бездоріжжі.');

LOAD DATA INFILE 'D:\\Education\\Education_2.2\\BD\\Labs\\Lab_4\\user.txt' INTO TABLE mydb.user LINES
TERMINATED BY '\r\n';
LOAD DATA INFILE 'D:\\Education\\Education_2.2\\BD\\Labs\\Lab_4\\mark.txt' INTO TABLE mydb.mark LINES
TERMINATED BY '\r\n';
LOAD DATA INFILE 'D:\\Education\\Education_2.2\\BD\\Labs\\Lab_4\\model.txt' INTO TABLE mydb.model LINES
TERMINATED BY '\r\n';
LOAD DATA INFILE 'D:\\Education\\Education_2.2\\BD\\Labs\\Lab_4\\auto.txt' INTO TABLE mydb.auto LINES
TERMINATED BY '\r\n';
LOAD DATA INFILE 'D:\\Education\\Education_2.2\\BD\\Labs\\Lab_4\\advertisement.txt' INTO TABLE mydb.advertisement LINES
TERMINATED BY '\r\n';
LOAD DATA INFILE 'D:\\Education\\Education_2.2\\BD\\Labs\\Lab_4\\advertisement_user.txt' INTO TABLE mydb.advertisement_user LINES
TERMINATED BY '\r\n';
LOAD DATA INFILE 'D:\\Education\\Education_2.2\\BD\\Labs\\Lab_4\\comment.txt' INTO TABLE mydb.comment LINES
TERMINATED BY '\r\n';

UPDATE mydb.advertisement SET mileage = 9999 WHERE id = 3;

UPDATE mydb.advertisement SET price = mileage + 1000 WHERE id >= 0;

DELETE FROM mydb.mark WHERE id > 4 OR id=2;



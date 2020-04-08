START TRANSACTION;
	INSERT INTO mydb.auto VALUE (21, 1.8, 180, 'Auto', 3, 8);
	INSERT INTO mydb.auto VALUE (22, 2.0, 200, 'Mechanic', 5, 12);
	INSERT INTO mydb.auto VALUE (23, 6.3, 580, 'Variator', 8, 18);
	INSERT INTO mydb.auto VALUE (24, 6.0, 400, 'T-tronic', 11, 15);
COMMIT;
ROLLBACK;

INSERT INTO mydb.type VALUE (11 ,'Ліфтбек', 'Деякий опис типу ліфтбек');
 START TRANSACTION;
 	INSERT INTO mydb.auto VALUE (21, 1.8, 180, 'Auto', 3, 8);
 	INSERT INTO mydb.auto VALUE (22, 2.0, 200, 'Mechanic', 5, 12);
 	INSERT INTO mydb.auto VALUE (23, 6.3, 580, 'Variator', 8, 18);
 	INSERT INTO mydb.auto VALUE (24, 6.0, 400, 'T-tronic', 11, 15);
 COMMIT;



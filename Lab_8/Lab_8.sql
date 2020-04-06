SELECT G.id, G.name, COUNT(group_id) AS amount
FROM mydb.group G INNER JOIN mydb.user U
ON G.id = U.group_id
WHERE G.name LIKE '%VIP%'
GROUP BY G.id
ORDER BY G.name;

SELECT ADV.id, ADV.price, ADV.color, ADV.pubdate, ADV.auto_id, AU.volume_engine, M.name
FROM mydb.advertisement ADV INNER JOIN mydb.auto AU
	ON ADV.auto_id = AU.id
INNER JOIN mydb.model M
	ON AU.model_id = M.id
ORDER BY pubdate DESC
LIMIT 7;

SELECT COUNT(*), MA.name
FROM mydb.advertisement AD INNER JOIN mydb.auto AU
	ON AD.auto_id = AU.id
INNER JOIN mydb.model MO
	ON AU.model_id = MO.id
INNER JOIN mydb.mark MA
	ON MO.mark_id = MA.id
GROUP BY MA.id
ORDER BY MA.name;

SELECT *
FROM [dbo].[Terrorism]
---Manipulating data
SELECT
CASE 
WHEN month = '1' THEN 'jan'
WHEN month = '2' THEN 'feb'
WHEN month = '3' THEN 'mar'
WHEN month = '4' THEN 'apr'
WHEN month = '5' THEN 'may'
WHEN month = '6' THEN 'jun'
WHEN month = '7' THEN 'jul'
WHEN month = '8' THEN 'aug'
WHEN month = '9' THEN 'sep'
WHEN month = '10' THEN 'oct'
WHEN month = '11' THEN 'nov'
WHEN month = '12' THEN 'dec'
END month,day,
eventid, country,region,state,city,latitude,longitude,success,attack_type,nkill,target,date
INTO DATA1
FROM
(
SELECT CAST(month AS varchar)month,eventid,day,
country,region,state,city,
latitude,longitude,success,attack_type,nkill,target,date
FROM [dbo].[Terrorism]
)A

SELECT *,CONCAT(month, '/',day)md
FROM DATA1

---How many success has terrorist gotten
SELECT COUNT(success)No_Success, success
FROM DATA1
GROUP BY success
---no of kills
SELECT *
FROM [dbo].[Terrorism]

SELECT DISTINCT nkill
FROM DATA1

SELECT COUNT(nkill),nkill
FROM DATA1
GROUP BY nkill
---which country had the highest success rate and no of kill
SELECT TOP 20 country,(COUNT(success))no_of_sucess
FROM DATA1
WHERE success = 1
GROUP BY country
ORDER BY 2 DESC

SELECT TOP 20 country,(COUNT(nkill))no_of_kills
FROM DATA1
WHERE nkill <> 0
GROUP BY country
ORDER BY 2 DESC
---which country had the most common type of attacks
SELECT MAX(no_at)max_no,attack_type
FROM 
(
SELECT COUNT(attack_type)no_at,country,attack_type
FROM DATA1
WHERE country = 'Nigeria'
GROUP BY attack_type,country
)a
GROUP BY attack_type
ORDER BY 1 DESC
SELECT COUNT(attack_type)a, attack_type,country
FROM DATA1
WHERE country ='Nigeria'
GROUP BY attack_type,country
ORDER BY 1 DESC

---what attacks are most common among terrorist
SELECT attack_type,COUNT(attack_type)no_at
FROM DATA1
GROUP BY attack_type
ORDER BY 2 DESC

---Which attack type takes more lifes
SELECT attack_type, COUNT(nkill)no_kill
FROM DATA1
WHERE nkill <> 0
GROUP BY attack_type
ORDER BY 2 DESC

---Which targets are mostly common among terrorist
SELECT *
FROM DATA1
SELECT TOP 10 COUNT(nkill)n_t, country
FROM DATA1
WHERE nkill <> 0
GROUP BY country
ORDER BY 1 DESC

SELECT TOP 20 COUNT(target)n_t, target,country
FROM DATA1
GROUP BY target,country
ORDER BY 1 DESC
 ---Most common form attack type by terrorist
 SELECT COUNT(attack_type)no, attack_type
 FROM DATA1
 WHERE nkill <> 0 AND success<> 0
 GROUP BY attack_type
 ORDER BY 1 DESC
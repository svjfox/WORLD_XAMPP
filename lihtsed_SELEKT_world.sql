Создать запросы для вывода следующей информации

    --Страны, названия которых начинаются на букву “К” (5 записей);

select * from country
where Name LIKE 'K%';


    --Страны, получившие независимость в 19-м веке (27 записей)

SELECT IndepYear
FROM country
WHERE IndepYear BETWEEN 1800 AND 1899;


    --Страны ближнего востока (Middle East) (18 записей)

SELECT Name, Region
FROM country
WHERE Region LIKE "Middle East%";

    --Европейские страны, которые образовались в 19 веке (7 записей)

SELECT Name, IndepYear, Continent 
FROM country
WHERE (IndepYear BETWEEN 1800 AND 1899) AND Continent LIKE "Europe%";



    --Страны, в названиях которых содержат слог “ра”  (9 записей)

SELECT Name
FROM country
WHERE Name LIKE "%pa%";


    --Страны, названия которых начинаются на гласную букву  (A, E, I, O, U, Y) (42 записи);

SELECT Name
FROM country
WHERE Name LIKE 'A%'OR Name LIKE 'E%' OR Name LIKE 'I%' OR Name LIKE 'O%' OR Name LIKE 'U%' OR Name LIKE 'Y%';


SELECT Name
FROM country
WHERE Name LIKE '[A,E,I,O,U,Y]%'; -- dla SQL

SELECT Name
FROM country
WHERE Name RLIKE '^[A, E, I, O, U, Y]'; -- prinadlezhnost' mnozhestvu


    --Страны, названия которых начинаются и заканчиваются на одну и ту же букву. (20 записей)

SELECT Name
FROM country
WHERE LEFT(Name,1)=RIGHT(Name,1);


    --Государства, формой правления которых является различной формы монархия (43 записи)

SELECT Name, GovernmentForm
FROM country
WHERE GovernmentForm LIKE '%Monarchy%';



    --Страны, население которых меньше 1 млн. (85 записей)


SELECT Name
FROM country
WHERE Population < 1000000;


    --Самое древнее государство (China)

SELECT Name, IndepYear 
FROM country
ORDER BY IndepYear LIMIT 1;




    --Страны, год обретения независимости которыми не определен (47 записей)

SELECT Name, IndepYear 
FROM country
WHERE IndepYear = 0;



    --Самое маленькое по площади государство (Holy See (Vatican City State))



SELECT Name, SurfaceArea 
FROM country
ORDER BY SurfaceArea LIMIT 1;


    --Первую десятку наиболее населенных государств мира

SELECT Name, Population 
FROM country
ORDER BY Population DESC LIMIT 10;


    --Первую десятку наиболее населенных государств Европы

SELECT Name, Population, Continent
FROM country
WHERE Continent LIKE 'Europe'
ORDER BY Population DESC LIMIT 10; 



    --Cуммарное число жителей стран Европы и суммарную площадь её государств (730 074 600, 23 049 133.9)


SELECT SUM(Population) AS 'Kokku Population',
SUM(SurfaceArea) AS 'Kokku SurfaceArea'
FROM country
WHERE Continent LIKE '%Europe%';




     --Число стран, расположенных не в Антарктике (234 записи)

SELECT COUNT(*)
FROM country
WHERE Continent NOT LIKE '%Antarctica%';



    --Число стран, где главой правительства является Елизавета II (Elisabeth II), суммарное число жителей этих стран.  (35 стран, 122 872 550 человек)

SELECT COUNT(HeadOfState),
SUM(Population) AS 'Kokku Population' 
FROM country
WHERE HeadOfState LIKE '%Elisabeth II%';



     --Число стран, наибольшее и наименьшее число жителей стран Полинезии (Polynesia) (10 стран, 235 000 человек, 50 человек)

SELECT COUNT(*),
MAX(Population) AS 'Max Population',
MIN(Population) AS 'Min Population'
FROM country
WHERE Region LIKE '%Polynesia%';



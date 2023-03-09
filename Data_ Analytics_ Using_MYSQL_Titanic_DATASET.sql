create database titanic_project;
use titanic_project;
-- 1. Show the first 10 rows of the dataset.
select * from titanic limit 10;
select * from titanic order by PassengerId desc limit 10;

-- 2. Find the number of passengers who survived.
select count(*) as "Passengers_survived" from titanic where Survived = 1 ;

-- 3. Find the average age of all passengers.
select avg(age) from titanic;

-- 4. Find the number of passengers in each class.
select Pclass,count(*) as "No.of. passengers" from titanic group by Pclass;

-- 5. Find the first 10 rows of the dataset sorted by passenger class in descending order.
select * from titanic order by Pclass desc limit 10;

-- 6. Find the number of passengers in each class sorted by class in ascending order.
select Pclass, count(*) from titanic group by Pclass order by Pclass asc;
-- select Pclass, count(*) from titanic group by Pclass order by count(*) asc;
-- 7. Find the average fare paid by passengers in each class.
select Pclass,avg(Fare) as "avg_fare" from titanic group by Pclass;

-- 8. Find the name of the passenger with the highest fare.
select name,Fare from titanic where fare = (select max(Fare) from titanic);

-- select max(Fare) from titanic

-- 9. Find the name of the passenger who had the highest age among the survivors.
select name,age from titanic where age= (select max(age) from titanic where Survived = 1)
and Survived =1;

-- select max(age) from titanic where Survived = 1

-- 10. Find the number of passengers who paid more than the average fare.

select count(*) as num_passengers from titanic where Fare > (select avg(Fare) from titanic);

-- select avg(Fare) from titanic;

-- 11. Find the name of the passenger who had the most parents or children on board.
select name from titanic where Parch = (select max(Parch) from titanic);

-- select max(Parch) from titanic


-- 12. Find the number of male and female passengers who survived, 
-- and order the results by sex in ascending order:
select Sex,count(*) as num_survived from titanic where Survived = 1
group by Sex 
order by Sex asc;

-- 13. Find the name, age, and fare of the oldest passenger who survived.

select name,age,Fare from titanic 
where age = (select max(Age)  from titanic where Survived =1)
and Survived =1;
-- select max(Age)  from titanic where Survived =1

-- 14. Find the name and age of the youngest female passenger who survived in third class.
select name,age from titanic where Sex = "female" and Pclass = 3 and Survived = 1
and age = (select min(Age) from titanic where Sex = "female" and Pclass = 3 and Survived = 1);
-- select min(Age) from titanic where Sex = "female" and Pclass = 3 and Survived = 1


-- 15. Find Number of male and female passengers.
select 
sum(case when Sex = "male" then 1 else 0 end) as num_male,
sum(case when Sex = "female" then 1 else 0 end) as num_female 

from titanic;


-- 16. Select all passengers who traveled in a cabin that was not shared by other passengers.

select * from titanic where cabin not in 
(select Cabin from titanic group by cabin having count(*) > 1);

-- select Cabin from titanic group by cabin having count(*) > 1

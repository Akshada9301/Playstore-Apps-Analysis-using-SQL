use campusx;
select * from playstores;

truncate table playstores;
describe playstores;

load data infile "D:/SQL Case studies/2nd/playstore.csv"
into table playstores
fields terminated by ","
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

 alter table playstores
 change column `content rating` `content_rating` varchar(255);
 
 alter table playstores
 change column `Last Updated` `Last_Updated` varchar(255);
 
  alter table playstores
 change column `Current Ver` `Current_Ver` varchar(255);
 
  alter table playstores
 change column `Android Ver` `Android_Ver` varchar(255);
 
 -- 1.You're working as a market analyst for a mobile app development company. Your task is to identify the most promising categories(TOP 5) for 
-- launching new free apps based on their average ratings.
select avg(rating) as category,'avg_rating' from playstores
group by category
order by 'avg_rating' desc limit 5;

-- 2. As a business strategist for a mobile app company, your objective is to pinpoint the three categories that generate the most revenue from paid apps.
-- This calculation is based on the product of the app price and its number of installations.
select category, sum(Installs*price) as 'reven'from playstores
group by category
order by reven desc limit 3;

-- 3. As a data analyst for a gaming company, you're tasked with calculating the percentage of games within each category. 
-- This information will help the company understand the distribution of gaming apps across different categories.
select category,(cnt/(select count(*) from playstores))*100 as 'percentage' from
(select category,count(*) as 'cnt' from playstores group by category)m;

-- 4. As a data analyst at a mobile app-focused market research firm, 
-- you'll recommend whether the company should develop paid or free apps for each category based on the  ratings of that category.

with developement as ( select category,`Type`,avg(rating) as avg_rating from playstores 
						group by category,`Type`)
select t1.category,t1.avg_rating as 'free_avg',t2.avg_rating as 'paid_avg',if(t1.avg_rating>t2.avg_rating,'Develop Free app','Develop Paid app') from developement t1
join developement t2 on t1.category = t2.category
              and t1.type = 'free' and t2.type = 'paid';
                        
-- 5.Suppose you're a database administrator, your databases have been hacked  and hackers are changing price of certain apps on the database , its taking long for IT team to 
-- neutralize the hack , however you as a responsible manager  dont want your data to be changed , do some measure where the changes in price can be recorded as you cant 
-- stop hackers from making changes

--- create table
CREATE TABLE PriceChangeLog (
    App VARCHAR(255),
    Old_Price DECIMAL(10, 2),
    New_Price DECIMAL(10, 2),
    Operation_Type VARCHAR(10),
    Operation_Date TIMESTAMP
);

create table play as
SELECT * FROM PLAYSTORES;

-- for update
delimiter //

create trigger price_change_update
after update on play
for each row
begin
   insert into PriceChangeLog(app,old_price,new_price,operation_type,operation_date)
   values(new.app,old.price,new.price,'update',current_timestamp);
end;
// 

delimiter ;

set sql_safe_updates = 0;
update  play 
set price = 100 where app = 'Photo Editor & Candy Camera & Grid & ScrapBook';

update  play 
set price = 5 where app = 'Coloring book moana';

select * from PriceChangeLog;

-- 6. your IT team have neutralize the threat,  however hacker have made some changes in the prices, but becasue of your measure you have noted the changes , now you want
-- correct data to be inserted into the database.
drop trigger price_change_update;

update play as p
join pricechangelog as pr on pr.app = p.app
set p.price = pr.old_price;

select price from play where app = 'Coloring book moana';

-- 7. As a data person you are assigned the task to investigate the correlation between two numeric factors: app ratings and the quantity of reviews.
with corr as(
 select avg(rating) as avg_rating,avg(reviews) as avg_reviews from playstores
 ), 
 pr as (
 select rating,reviews, (rating - avg_rating) as 'ra',(reviews - avg_reviews) as 're' from playstores,corr
 ) ,
 tr as (
 select sum(ra*re) as numerator,sum(ra*ra) as deno_1,sum(re*re) as deno_2 from pr
 )
 select numerator/(sqrt(deno_1 * deno_2)) as corr_coeff 
 from tr;
 
 -- 8. Your boss noticed  that some rows in genres columns have multiple generes in them, which was creating issue when developing the  recommendor system from the data
-- he/she asssigned you the task to clean the genres column and make two genres out of it, rows that have only one genre will have other column as blank.
 alter table playstores add column genre1 varchar(255) ;
 alter table playstores add column genre2 varchar(255);
 
 update playstores
 set genre1 = substring_index(genres,';',1),
 genre2 = nullif(substring_index(substring_index(genres,';',2),';',-1),substring_index(genres,';',1));
 

-- 9. Your senior manager wants to know which apps are  not performing as par in their particular category, however he is not interested in handling too many files or
-- list for every  category and he/she assigned  you with a task of creating a dynamic tool where he/she  can input a category of apps he/she  interested in and 
-- your tool then provides real-time feedback by
-- displaying apps within that category that have ratings lower than the average rating for that specific category.
DELIMITER //
create procedure checking(in cate varchar(30))
begin


		set @c = 
		( 
		select average from
		( 
		   select category,avg(rating) as average from playstores group by category
			)m where category = cate
		);
		
	   select* from playstores where category = cate and rating< @c;
 
 end //
 DELIMITER ;
 
 call checking('business');
 


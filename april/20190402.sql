/* 구분자를 ";" 으(로) 변경 */
/* 127.0.0.1 에 MySQL (TCP/IP) 을(를) 통해 연결 중, 사용자 이름 "javauser", 암호 사용: Yes… */
SELECT CONNECTION_ID();
/* 연결됨. 스레드-ID: 2 */
/* 문자 집합: utf8mb4 */
SHOW STATUS;
SHOW VARIABLES;
SHOW DATABASES;
USE `world`;
/* "Localhost" 세션 시작 */
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='world';
SHOW TABLE STATUS FROM `world`;
SHOW FUNCTION STATUS WHERE `Db`='world';
SHOW PROCEDURE STATUS WHERE `Db`='world';
SHOW TRIGGERS FROM `world`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='information_schema';
SHOW TABLE STATUS FROM `information_schema`;
SHOW FUNCTION STATUS WHERE `Db`='information_schema';
SHOW PROCEDURE STATUS WHERE `Db`='information_schema';
SHOW TRIGGERS FROM `information_schema`;
SHOW EVENTS FROM `information_schema`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='world';
use world;
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
show tables;
/* 영향 받은 행: 0  찾은 행: 9  경고: 0  지속 시간 1 쿼리: 0.016 sec. */
create table date_table (
	id int auto_increment primary key,
	datetime datetime default now()
) auto_increment=101;
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 1 쿼리: 0.031 sec. */
insert into date_table (datetime) values
	('2019-02-05 18:50:51'), ('2019-03-05 18:50:51')
	('2019-02-08 18:50:51'), ('2019-03-08 18:50:51');
/* SQL 오류 (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '('2019-02-08 18:50:51'), ('2019-03-08 18:50:51')' at line 3 */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 2 쿼리: 0.000 sec. */
insert into date_table (datetime) values
	('2019-02-05 18:50:51'), ('2019-03-05 18:50:51'),
	('2019-02-08 18:50:51'), ('2019-03-08 18:50:51');
insert into date_table values (default, default);
/* 영향 받은 행: 5  찾은 행: 0  경고: 0  지속 시간 2 쿼리: 0.000 sec. */
select datetime from date_table where id=101;
/* 영향 받은 행: 0  찾은 행: 1  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select date_format(datetime, '%Y-%m-%D') FROM date_table where id=101;
/* 영향 받은 행: 0  찾은 행: 1  경고: 0  지속 시간 1 쿼리: 0.016 sec. */
select date_format(datetime, '%p %h:%i:%s') from date_table where id=103;
/* 영향 받은 행: 0  찾은 행: 1  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select now(), curdate(), curtime();
/* 영향 받은 행: 0  찾은 행: 1  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select date_add(now(), interval 2 MONTH);
/* 영향 받은 행: 0  찾은 행: 1  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select date_sub(now(), interval 5 DAY);
/* 영향 받은 행: 0  찾은 행: 1  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select to_days('2018-11-14') - to_days(now());
/* 영향 받은 행: 0  찾은 행: 1  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select dayofweek(datetime) from date_table;
/* 영향 받은 행: 0  찾은 행: 5  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select to_days('2019-11-14') - to_days(now());
/* 영향 받은 행: 0  찾은 행: 1  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc countrylanguage;
/* 영향 받은 행: 0  찾은 행: 4  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
SHOW CREATE TABLE `world`.`countrylanguage`;
SHOW COLLATION;
select countrylanguage.`*`, country.name from countrylanguage
	inner join country on countrylanguage.countrycode=country.Code
	where languate='korean';
/* SQL 오류 (1054): Unknown column 'languate' in 'where clause' */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select countrylanguage.*, country.name from countrylanguage
	inner join country on countrylanguage.countrycode=country.Code
	where languate='korean';
/* SQL 오류 (1054): Unknown column 'languate' in 'where clause' */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select countrylanguage.*, country.name from countrylanguage
	inner join country on countrylanguage.countrycode=country.Code
	where language='korean';
/* 영향 받은 행: 0  찾은 행: 6  경고: 0  지속 시간 1 쿼리: 0.016 sec. */
select cl.*, country.name from countrylanguage as cl
	inner join country on cl.countrycode=country.Code
	where language='korean';
/* 영향 받은 행: 0  찾은 행: 6  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select cl.*, co.name from countrylanguage as cl
	inner join country as co on cl.countrycode=co.Code
	where language='korean';
/* 영향 받은 행: 0  찾은 행: 6  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
CREATE TABLE girl_group ( 
	_id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(32) NOT NULL, 
	debut DATE NOT NULL, 
	hit_song_id INT 
) DEFAULT CHARSET=utf8;
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 1 쿼리: 0.015 sec. */
CREATE TABLE song ( 
	_id INT PRIMARY KEY AUTO_INCREMENT, 
	title VARCHAR(32) NOT NULL, 
	lyrics VARCHAR(32) 
) DEFAULT CHARSET=utf8;
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 1 쿼리: 0.032 sec. */
INSERT INTO song (_id, title, lyrics) 
	VALUES (101, 'Tell Me', 'tell me tell me tetetete tel me');
/* 영향 받은 행: 1  찾은 행: 0  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
INSERT INTO song (title, lyrics) 
	VALUES ('Gee', 'GEE GEE GEE GEE GEE BABY BABY'),
	('미스터', '이름이 뭐야 미스터'), 
	('Abracadabra', '이러다 미쳐 내가 여리여리'),
	('8282', 'Give me a call Baby baby'), ('기대해', '기대해'),
	('I Don\'t car', '다른 여자들의 다리를'), 
	('Bad Girl Good Girl', '앞에선 한 마디 말도'), ('피노키오', '뉴예삐오'),
	('별빛달빛', '너는 내 별빛 내 마음의 별빛'), 
	('A', 'A 워오우 워오우워 우우우'),
	('나혼자', '나 혼자 밥을 먹고 나 혼자 영화 보고'), ('LUV', '설레이나요 '),
	('짧은치마', '짧은 치마를 입고 내가 길을 걸으면'),
	('위아래', '위 아래 위위 아래'), ('Dumb Dumb' , '너 땜에 하루종일');
/* 영향 받은 행: 15  찾은 행: 0  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
INSERT INTO girl_group (name, debut, hit_song_id) 
	VALUES ('원더걸스', '2007-09-12', 101),
	('소녀시대', '2009-06-03', 102), ('카라', '2009-07-30', 103),
	('브라운아이드걸스', '2008-01-17', 104), ('다비치', '2009-02-27', 105),
	('2NE1', '2009-07-08', 107), ('f(x)', '2011-04-20', 109),
	('시크릿', '2011-01-06', 110), ('레인보우', '2010-08-12', 111),
	('에프터 스쿨', '2009-11-25'), ('포미닛', '2009-08-28');
/* SQL 오류 (1136): Column count doesn't match value count at row 10 */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select * from girl_group;
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select * from song;
/* 영향 받은 행: 0  찾은 행: 16  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc girl_group;
/* 영향 받은 행: 0  찾은 행: 4  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
INSERT INTO girl_group (name, debut, hit_song_id) 
	VALUES ('원더걸스', '2007-09-12', 101),
	('소녀시대', '2009-06-03', 102), ('카라', '2009-07-30', 103),
	('브라운아이드걸스', '2008-01-17', 104), ('다비치', '2009-02-27', 105),
	('2NE1', '2009-07-08', 107), ('f(x)', '2011-04-20', 109),
	('시크릿', '2011-01-06', 110), ('레인보우', '2010-08-12', 111),
	('에프터 스쿨', '2009-11-25'), ('포미닛', '2009-08-28');
/* SQL 오류 (1136): Column count doesn't match value count at row 10 */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
INSERT INTO girl_group (name, debut, hit_song_id) 
	VALUES ('원더걸스', '2007-09-12', 101),
	('소녀시대', '2009-06-03', 102), ('카라', '2009-07-30', 103),
	('브라운아이드걸스', '2008-01-17', 104), ('다비치', '2009-02-27', 105),
	('2NE1', '2009-07-08', 107), ('f(x)', '2011-04-20', 109),
	('시크릿', '2011-01-06', 110), ('레인보우', '2010-08-12', 111);
INSERT INTO girl_group (name, debut) VALUES
	('에프터 스쿨', '2009-11-25'), ('포미닛', '2009-08-28');
/* 영향 받은 행: 11  찾은 행: 0  경고: 0  지속 시간 2 쿼리: 0.000 sec. */
select * from girl_group;
/* 영향 받은 행: 0  찾은 행: 11  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
update girl_group set debut='2007-02-10' where _id=1;
update girl_group set debut='2007-08-02' where _id=2;
select * from girl_group;
/* 영향 받은 행: 2  찾은 행: 11  경고: 0  지속 시간 3 쿼리: 0.000 sec. */
select gg._id, gg.name, s.title
from girl_group as gg
inner join song as s
on s._id = g.hit_song_id;
/* SQL 오류 (1054): Unknown column 'g.hit_song_id' in 'on clause' */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select gg._id, gg.name, s.title
from girl_group as gg
inner join song as s
on s._id = gg.hit_song_id;
/* 영향 받은 행: 0  찾은 행: 9  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select gg._id, gg.name, s.title
from girl_group as gg
left outer join song as s
on s._id = gg.hit_song_id;
/* 영향 받은 행: 0  찾은 행: 11  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select gg._id, gg.name, s.title
from girl_group as gg
right outer join song as s
on s._id = gg.hit_song_id;
/* 영향 받은 행: 0  찾은 행: 16  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select * from girl_group where debut between ‘2009-01-01’ and ‘2009-12-31’;
/* SQL 오류 (1054): Unknown column '‘2009' in 'where clause' */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select * from girl_group where debut between ‘2009-01-01’ and ‘2009-12-31’;
/* SQL 오류 (1054): Unknown column '‘2009' in 'where clause' */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select * from girl_group where debut between '2009-01-01' and '2009-12-31';
/* 영향 받은 행: 0  찾은 행: 5  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc girl_group;
/* 영향 받은 행: 0  찾은 행: 4  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc song;
desc girl_group;
/* 영향 받은 행: 0  찾은 행: 7  경고: 0  지속 시간 2 쿼리: 0.000 sec. */
select * from song;
/* 영향 받은 행: 0  찾은 행: 16  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc girl_group;
/* 영향 받은 행: 0  찾은 행: 4  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc song;
/* 영향 받은 행: 0  찾은 행: 3  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc girl_group;
/* 영향 받은 행: 0  찾은 행: 4  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select g.name, g.debut, s.title 
from song as s, girl_group as g
where debut between '2009-01-01' and ‘2009-12-31'
;
/* SQL 오류 (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''' at line 3 */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select g.name, g.debut, s.title 
from song as s, girl_group as g
where debut between '2009-01-01' and '2009-12-31'
;
/* 영향 받은 행: 0  찾은 행: 80  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc girl_group;
/* 영향 받은 행: 0  찾은 행: 4  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc song;
/* 영향 받은 행: 0  찾은 행: 3  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select g.name, g.debut, s.title 
from song as s, girl_group as g
join g._id = s._id
where debut between '2009-01-01' and '2009-12-31';
/* SQL 오류 (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '._id
where debut between '2009-01-01' and '2009-12-31'' at line 3 */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select g.name, g.debut, s.title 
from song as s, girl_group as g
join song on g.hit_song_id=s._id
where debut between '2009-01-01' and '2009-12-31';
/* SQL 오류 (1054): Unknown column 's._id' in 'on clause' */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select g.name, g.debut, s.title 
from girl_group as g
join song as s on g.hit_song_id=s._id
where debut between '2009-01-01' and '2009-12-31';
/* 영향 받은 행: 0  찾은 행: 3  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select continent, count(*), sum(gnp), avg(gnp)
    from country group by continent;
/* 영향 받은 행: 0  찾은 행: 7  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select co.continent as '대륙명', co.Name as '국가명',
    city.Name as '도시명', city.Population as '인구수'
    from country as co inner join city
    on co.Code=city.CountryCode
    where continent='africa'
    order by city.Population desc limit 10;
/* 영향 받은 행: 0  찾은 행: 10  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select city.Name, city.Population, cl.'Language' from city
    inner join countrylanguage as cl
    on city.CountryCode=cl.CountryCode
    where cl.IsOfficial='T'
    order by population desc limit 10;
/* SQL 오류 (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Language' from city
    inner join countrylanguage as cl
    on city.CountryC' at line 1 */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select city.Name, city.Population, cl.`Language` from city
    inner join countrylanguage as cl
    on city.CountryCode=cl.CountryCode
    where cl.IsOfficial='T'
    order by population desc limit 10;
/* 영향 받은 행: 0  찾은 행: 10  경고: 0  지속 시간 1 쿼리: 0.016 sec. */
desc date_table;
/* 영향 받은 행: 0  찾은 행: 2  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select * from date_table;
/* 영향 받은 행: 0  찾은 행: 5  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
desc date_table;
/* 영향 받은 행: 0  찾은 행: 2  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select id, datetime(datetime) from date_table;
/* SQL 오류 (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(datetime) from date_table' at line 1 */
/* 영향 받은 행: 0  찾은 행: 0  경고: 0  지속 시간 0 of 1 쿼리: 0.000 sec. */
select * from song;
/* 영향 받은 행: 0  찾은 행: 17  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select * from song;
/* 영향 받은 행: 0  찾은 행: 17  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select * from song;
/* 영향 받은 행: 0  찾은 행: 18  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
select * from song;
/* 영향 받은 행: 0  찾은 행: 19  경고: 0  지속 시간 1 쿼리: 0.000 sec. */
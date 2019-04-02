/* �����ڸ� ";" ��(��) ���� */
/* 127.0.0.1 �� MySQL (TCP/IP) ��(��) ���� ���� ��, ����� �̸� "javauser", ��ȣ ���: Yes�� */
SELECT CONNECTION_ID();
/* �����. ������-ID: 2 */
/* ���� ����: utf8mb4 */
SHOW STATUS;
SHOW VARIABLES;
SHOW DATABASES;
USE `world`;
/* "Localhost" ���� ���� */
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
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
show tables;
/* ���� ���� ��: 0  ã�� ��: 9  ���: 0  ���� �ð� 1 ����: 0.016 sec. */
create table date_table (
	id int auto_increment primary key,
	datetime datetime default now()
) auto_increment=101;
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 1 ����: 0.031 sec. */
insert into date_table (datetime) values
	('2019-02-05 18:50:51'), ('2019-03-05 18:50:51')
	('2019-02-08 18:50:51'), ('2019-03-08 18:50:51');
/* SQL ���� (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '('2019-02-08 18:50:51'), ('2019-03-08 18:50:51')' at line 3 */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 2 ����: 0.000 sec. */
insert into date_table (datetime) values
	('2019-02-05 18:50:51'), ('2019-03-05 18:50:51'),
	('2019-02-08 18:50:51'), ('2019-03-08 18:50:51');
insert into date_table values (default, default);
/* ���� ���� ��: 5  ã�� ��: 0  ���: 0  ���� �ð� 2 ����: 0.000 sec. */
select datetime from date_table where id=101;
/* ���� ���� ��: 0  ã�� ��: 1  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select date_format(datetime, '%Y-%m-%D') FROM date_table where id=101;
/* ���� ���� ��: 0  ã�� ��: 1  ���: 0  ���� �ð� 1 ����: 0.016 sec. */
select date_format(datetime, '%p %h:%i:%s') from date_table where id=103;
/* ���� ���� ��: 0  ã�� ��: 1  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select now(), curdate(), curtime();
/* ���� ���� ��: 0  ã�� ��: 1  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select date_add(now(), interval 2 MONTH);
/* ���� ���� ��: 0  ã�� ��: 1  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select date_sub(now(), interval 5 DAY);
/* ���� ���� ��: 0  ã�� ��: 1  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select to_days('2018-11-14') - to_days(now());
/* ���� ���� ��: 0  ã�� ��: 1  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select dayofweek(datetime) from date_table;
/* ���� ���� ��: 0  ã�� ��: 5  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select to_days('2019-11-14') - to_days(now());
/* ���� ���� ��: 0  ã�� ��: 1  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc countrylanguage;
/* ���� ���� ��: 0  ã�� ��: 4  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
SHOW CREATE TABLE `world`.`countrylanguage`;
SHOW COLLATION;
select countrylanguage.`*`, country.name from countrylanguage
	inner join country on countrylanguage.countrycode=country.Code
	where languate='korean';
/* SQL ���� (1054): Unknown column 'languate' in 'where clause' */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select countrylanguage.*, country.name from countrylanguage
	inner join country on countrylanguage.countrycode=country.Code
	where languate='korean';
/* SQL ���� (1054): Unknown column 'languate' in 'where clause' */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select countrylanguage.*, country.name from countrylanguage
	inner join country on countrylanguage.countrycode=country.Code
	where language='korean';
/* ���� ���� ��: 0  ã�� ��: 6  ���: 0  ���� �ð� 1 ����: 0.016 sec. */
select cl.*, country.name from countrylanguage as cl
	inner join country on cl.countrycode=country.Code
	where language='korean';
/* ���� ���� ��: 0  ã�� ��: 6  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select cl.*, co.name from countrylanguage as cl
	inner join country as co on cl.countrycode=co.Code
	where language='korean';
/* ���� ���� ��: 0  ã�� ��: 6  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
CREATE TABLE girl_group ( 
	_id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(32) NOT NULL, 
	debut DATE NOT NULL, 
	hit_song_id INT 
) DEFAULT CHARSET=utf8;
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 1 ����: 0.015 sec. */
CREATE TABLE song ( 
	_id INT PRIMARY KEY AUTO_INCREMENT, 
	title VARCHAR(32) NOT NULL, 
	lyrics VARCHAR(32) 
) DEFAULT CHARSET=utf8;
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 1 ����: 0.032 sec. */
INSERT INTO song (_id, title, lyrics) 
	VALUES (101, 'Tell Me', 'tell me tell me tetetete tel me');
/* ���� ���� ��: 1  ã�� ��: 0  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
INSERT INTO song (title, lyrics) 
	VALUES ('Gee', 'GEE GEE GEE GEE GEE BABY BABY'),
	('�̽���', '�̸��� ���� �̽���'), 
	('Abracadabra', '�̷��� ���� ���� ��������'),
	('8282', 'Give me a call Baby baby'), ('�����', '�����'),
	('I Don\'t car', '�ٸ� ���ڵ��� �ٸ���'), 
	('Bad Girl Good Girl', '�տ��� �� ���� ����'), ('�ǳ�Ű��', '�����߿�'),
	('�����޺�', '�ʴ� �� ���� �� ������ ����'), 
	('A', 'A ������ ������� ����'),
	('��ȥ��', '�� ȥ�� ���� �԰� �� ȥ�� ��ȭ ����'), ('LUV', '�����̳��� '),
	('ª��ġ��', 'ª�� ġ���� �԰� ���� ���� ������'),
	('���Ʒ�', '�� �Ʒ� ���� �Ʒ�'), ('Dumb Dumb' , '�� ���� �Ϸ�����');
/* ���� ���� ��: 15  ã�� ��: 0  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
INSERT INTO girl_group (name, debut, hit_song_id) 
	VALUES ('�����ɽ�', '2007-09-12', 101),
	('�ҳ�ô�', '2009-06-03', 102), ('ī��', '2009-07-30', 103),
	('������̵�ɽ�', '2008-01-17', 104), ('�ٺ�ġ', '2009-02-27', 105),
	('2NE1', '2009-07-08', 107), ('f(x)', '2011-04-20', 109),
	('��ũ��', '2011-01-06', 110), ('���κ���', '2010-08-12', 111),
	('������ ����', '2009-11-25'), ('���̴�', '2009-08-28');
/* SQL ���� (1136): Column count doesn't match value count at row 10 */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select * from girl_group;
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select * from song;
/* ���� ���� ��: 0  ã�� ��: 16  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc girl_group;
/* ���� ���� ��: 0  ã�� ��: 4  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
INSERT INTO girl_group (name, debut, hit_song_id) 
	VALUES ('�����ɽ�', '2007-09-12', 101),
	('�ҳ�ô�', '2009-06-03', 102), ('ī��', '2009-07-30', 103),
	('������̵�ɽ�', '2008-01-17', 104), ('�ٺ�ġ', '2009-02-27', 105),
	('2NE1', '2009-07-08', 107), ('f(x)', '2011-04-20', 109),
	('��ũ��', '2011-01-06', 110), ('���κ���', '2010-08-12', 111),
	('������ ����', '2009-11-25'), ('���̴�', '2009-08-28');
/* SQL ���� (1136): Column count doesn't match value count at row 10 */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
INSERT INTO girl_group (name, debut, hit_song_id) 
	VALUES ('�����ɽ�', '2007-09-12', 101),
	('�ҳ�ô�', '2009-06-03', 102), ('ī��', '2009-07-30', 103),
	('������̵�ɽ�', '2008-01-17', 104), ('�ٺ�ġ', '2009-02-27', 105),
	('2NE1', '2009-07-08', 107), ('f(x)', '2011-04-20', 109),
	('��ũ��', '2011-01-06', 110), ('���κ���', '2010-08-12', 111);
INSERT INTO girl_group (name, debut) VALUES
	('������ ����', '2009-11-25'), ('���̴�', '2009-08-28');
/* ���� ���� ��: 11  ã�� ��: 0  ���: 0  ���� �ð� 2 ����: 0.000 sec. */
select * from girl_group;
/* ���� ���� ��: 0  ã�� ��: 11  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
update girl_group set debut='2007-02-10' where _id=1;
update girl_group set debut='2007-08-02' where _id=2;
select * from girl_group;
/* ���� ���� ��: 2  ã�� ��: 11  ���: 0  ���� �ð� 3 ����: 0.000 sec. */
select gg._id, gg.name, s.title
from girl_group as gg
inner join song as s
on s._id = g.hit_song_id;
/* SQL ���� (1054): Unknown column 'g.hit_song_id' in 'on clause' */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select gg._id, gg.name, s.title
from girl_group as gg
inner join song as s
on s._id = gg.hit_song_id;
/* ���� ���� ��: 0  ã�� ��: 9  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select gg._id, gg.name, s.title
from girl_group as gg
left outer join song as s
on s._id = gg.hit_song_id;
/* ���� ���� ��: 0  ã�� ��: 11  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select gg._id, gg.name, s.title
from girl_group as gg
right outer join song as s
on s._id = gg.hit_song_id;
/* ���� ���� ��: 0  ã�� ��: 16  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select * from girl_group where debut between ��2009-01-01�� and ��2009-12-31��;
/* SQL ���� (1054): Unknown column '��2009' in 'where clause' */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select * from girl_group where debut between ��2009-01-01�� and ��2009-12-31��;
/* SQL ���� (1054): Unknown column '��2009' in 'where clause' */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select * from girl_group where debut between '2009-01-01' and '2009-12-31';
/* ���� ���� ��: 0  ã�� ��: 5  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc girl_group;
/* ���� ���� ��: 0  ã�� ��: 4  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc song;
desc girl_group;
/* ���� ���� ��: 0  ã�� ��: 7  ���: 0  ���� �ð� 2 ����: 0.000 sec. */
select * from song;
/* ���� ���� ��: 0  ã�� ��: 16  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc girl_group;
/* ���� ���� ��: 0  ã�� ��: 4  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc song;
/* ���� ���� ��: 0  ã�� ��: 3  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc girl_group;
/* ���� ���� ��: 0  ã�� ��: 4  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select g.name, g.debut, s.title 
from song as s, girl_group as g
where debut between '2009-01-01' and ��2009-12-31'
;
/* SQL ���� (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''' at line 3 */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select g.name, g.debut, s.title 
from song as s, girl_group as g
where debut between '2009-01-01' and '2009-12-31'
;
/* ���� ���� ��: 0  ã�� ��: 80  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc girl_group;
/* ���� ���� ��: 0  ã�� ��: 4  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc song;
/* ���� ���� ��: 0  ã�� ��: 3  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select g.name, g.debut, s.title 
from song as s, girl_group as g
join g._id = s._id
where debut between '2009-01-01' and '2009-12-31';
/* SQL ���� (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '._id
where debut between '2009-01-01' and '2009-12-31'' at line 3 */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select g.name, g.debut, s.title 
from song as s, girl_group as g
join song on g.hit_song_id=s._id
where debut between '2009-01-01' and '2009-12-31';
/* SQL ���� (1054): Unknown column 's._id' in 'on clause' */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select g.name, g.debut, s.title 
from girl_group as g
join song as s on g.hit_song_id=s._id
where debut between '2009-01-01' and '2009-12-31';
/* ���� ���� ��: 0  ã�� ��: 3  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select continent, count(*), sum(gnp), avg(gnp)
    from country group by continent;
/* ���� ���� ��: 0  ã�� ��: 7  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select co.continent as '�����', co.Name as '������',
    city.Name as '���ø�', city.Population as '�α���'
    from country as co inner join city
    on co.Code=city.CountryCode
    where continent='africa'
    order by city.Population desc limit 10;
/* ���� ���� ��: 0  ã�� ��: 10  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select city.Name, city.Population, cl.'Language' from city
    inner join countrylanguage as cl
    on city.CountryCode=cl.CountryCode
    where cl.IsOfficial='T'
    order by population desc limit 10;
/* SQL ���� (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Language' from city
    inner join countrylanguage as cl
    on city.CountryC' at line 1 */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select city.Name, city.Population, cl.`Language` from city
    inner join countrylanguage as cl
    on city.CountryCode=cl.CountryCode
    where cl.IsOfficial='T'
    order by population desc limit 10;
/* ���� ���� ��: 0  ã�� ��: 10  ���: 0  ���� �ð� 1 ����: 0.016 sec. */
desc date_table;
/* ���� ���� ��: 0  ã�� ��: 2  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select * from date_table;
/* ���� ���� ��: 0  ã�� ��: 5  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
desc date_table;
/* ���� ���� ��: 0  ã�� ��: 2  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select id, datetime(datetime) from date_table;
/* SQL ���� (1064): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(datetime) from date_table' at line 1 */
/* ���� ���� ��: 0  ã�� ��: 0  ���: 0  ���� �ð� 0 of 1 ����: 0.000 sec. */
select * from song;
/* ���� ���� ��: 0  ã�� ��: 17  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select * from song;
/* ���� ���� ��: 0  ã�� ��: 17  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select * from song;
/* ���� ���� ��: 0  ã�� ��: 18  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
select * from song;
/* ���� ���� ��: 0  ã�� ��: 19  ���: 0  ���� �ð� 1 ����: 0.000 sec. */
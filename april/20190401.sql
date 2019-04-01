create view KoreanCity as select id, name, district, population
	from city where countrycode='kor';
select * from KoreanCity;
create table bbs (
  id int unsigned not null auto_increment,
  memberId int unsigned not null,
  title varchar(50) not null,
  date datetime not null default current_timestamp,
  content varchar(400),
  primary key(id),
  foreign key(memberId) references member(id)
) default charset=utf8;
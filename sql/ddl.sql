ALTER DATABASE uanews charset=utf8;

CREATE TABLE POSTS (
	id integer not null auto_increment, 
	title text, 
	link text, 
	created timestamp default CURRENT_TIMESTAMP,
	primary key (id)
);

insert into POSTS (title, link) values ('title2', 'http://www.yandex.ru');
insert into POSTS (title, link) values ('title1', 'http://www.google.com');

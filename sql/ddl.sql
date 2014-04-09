ALTER DATABASE uanews charset=utf8;

CREATE TABLE POSTS (
	id integer not null auto_increment, 
	title text, 
	link text, 
	likes integer default 0,
	created timestamp default CURRENT_TIMESTAMP,
	primary key (id)
);

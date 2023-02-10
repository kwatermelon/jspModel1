
drop table member;

create table member(
	id varchar(50) primary key, -- 중복되면 안되니까 기본키
	pwd varchar(50) not null, -- not null: 반드시 들어가야한다
	name varchar(50) not null,
	email varchar(50) unique, -- unique : null을 허용한다.
	auth int		-- auth : 관리자인지 사용자인지 가리는것
);

select id from member
where id='abc';

select count(*) -- 0 반환됨
from member
where id='abc';

select * from member;


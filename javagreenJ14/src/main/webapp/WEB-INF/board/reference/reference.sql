show tables;

create table reference(
	idx int not null auto_increment, /*게시글의 고유번호*/
	nickName varchar(20) not null,   /*게시글을 올린 사람의 닉네임*/
	title varchar(100) not null,     /*게시글의 글 제목*/
	content text not null,           /*글 내용*/
	wDate datetime default now(),    /*글 올린 날짜*/
	readNum int default 0,           /*글 조회수*/
	mid varchar(20) not null,        /*회원 아이디(게시글 조회 시 사용)*/
	primary key(idx)                 /* 게시판의 기본 키 : 고유번호*/
);

desc reference;

insert into reference value (default, '관리맨', '게시판 서비스를 시작합니다', '이곳은 게시판입니다', default, default,'admin');

select * from reference;


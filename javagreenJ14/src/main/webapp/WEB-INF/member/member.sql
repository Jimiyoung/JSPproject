show tables;

create table member(
	idx int not null auto_increment,   /* 회원 고유번호 */ 
	mid varchar(20) not null,          /* 아이디(중복불허) */ 
	pwd varchar(100) not null,         /* 비밀번호(암호화처리) */
	name varchar(20) not null,         /* 성명 */   
	nickName varchar(20) not null,     /* 닉네임(중복불허) */ 
	childName varchar(20) not null,        /* 자녀이름 */ 
	ban varchar(20) not null,        /* 자녀학급 */ 
	tel varchar(20) not null,          /* 전화번호 */
	address varchar(100) not null,     /* 주소 */
	email varchar(50) not null,        /* 이메일(아이디/ 비밀번호 분실 시 필요)-형식 체크할 것 */
	birthday datetime default now(),  	   /* 생일 */ 
	startDate datetime default now(),   /* 최초 가입일 */
	lastDate datetime default now(),    /* 마지막 접속일 */
	userDel char(2) default 'NO',      /* 회원 탈퇴 신청 여부(OK : 탈퇴신청회원, NO : 현재 가입중인 회원) */
	level int default 1,               /* 1:준회원, 2:학부모, 3:교사  0:관리자 */
	primary key(idx, mid)
);

drop table member;

insert into member values(default, 'admin', '1234', '관리자', '관리맨', '신짱구', '개나리반', '010-3423-2704', '경기도 안성시 공도로 142', 'cjsk1126@naver.com', default,default,default,default,default);
select * from member;


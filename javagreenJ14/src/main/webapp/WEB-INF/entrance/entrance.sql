show tables;

create table entrance(
	idx int not null auto_increment primary key,   /* 입학대기 신청서 고유번호 */
	pName varchar(20) not null,         /* 보호자 이름 */
	relation varchar(10) not null,     /* 원아와의 관계 */
	tel varchar(20) not null,          /* 전화번호 */
	address varchar(100) not null,     /* 주소 */
	cName  varchar(20) not null,         /* 아동 이름 */
	gender varchar(5),   /* 성별 */ 
	birthday datetime default now(),   /* 아동 생년월일 */ 
	content text, /* 하고 싶은 말 */
	sw char(2) default 'NO'      /* 확인여부(OK : 확인, NO : 확인 전) */
);

desc entrance;
drop table entrance;

insert into entrance value(default, '신영만','부', '010-4567-1591','49078 /부산 영도구 에움길 1 /1 / (영선동4가)/', '신짱아','여','2022-05-04 00:00:00','입학상담 신청합니다.',default);

select * from entrance;

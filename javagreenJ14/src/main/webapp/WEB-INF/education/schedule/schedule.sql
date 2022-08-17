show tables;

create table schedule(
	idx int not null auto_increment primary key,
	nickName varchar(20) not null,
	sDate datetime not null, /* 일정 등록 날짜 */
	part varchar(10) not null, /* 1.행사, 2.현장학습, 3.안전교육, 4.부모교육, 0:기타 */
	title varchar(100) not null, /*일정  타이틀*/
	place varchar(100) not null, /* 장소 */
	stime varchar(50) not null, /* 시간 */
	content text /* 일정 상세 내역 */
);

desc schedule;

drop table schedule;

select * from schedule;

insert into schedule values(default,'관리맨','2022-05-02','현장학습', '6세:교통안전체험장견학', '충북 청주시 상당구 중흥로 164 청주시 어린이 교통안전 교육장', '10:00~12:00','');
insert into schedule values(default,'hkd1234','2022-05-23','학습','초기메뉴 완성');
insert into schedule values(default,'hkd1234','2022-05-26','업무','업체 선정회의 13시 30분 회의실');
insert into schedule values(default,'hkd1234','2022-05-26','업무','결과발표 18시 각 부서별');
insert into schedule values(default,'hkd1234','2022-05-26','기타','체육관 알아보기');
insert into schedule values(default,'hkd1234','2022-05-28','모임','초등학교 동창회, 장소:모이자회관 18시');
insert into schedule values(default,'hkd1234','2022-06-01','기타','지방선거');
insert into schedule values(default,'kms1234','2022-05-27','기타','지방선거 사전투표');
insert into schedule values(default,'kms1234','2022-06-01','여행','제주도 한라산철쭉산행');
insert into schedule value (default,'hkd1234','2022-05-29','기타','체육관 등록');

select * from schedule order by sDate desc;
select * from schedule where mid = 'hkd1234' order by sDate desc;
select * from schedule where mid = 'hkd1234' and sDate='2022-05' order by sDate desc;
select * from schedule where mid = 'hkd1234' and date_format(sDate, '%Y-%m')='2022-05' order by sDate desc;
select * from schedule where mid = 'hkd1234' and date_format(sDate, '%Y-%m-%d')='2022-05-26' order by sDate desc;
select * from schedule where mid = 'hkd1234' and date_format(sDate, '%Y-%m-%d')='2022-05-26' group by part order by sDate desc;
select *,count(*) from schedule where mid = 'hkd1234' and date_format(sDate, '%Y-%m-%d')='2022-05-26' group by part order by sDate desc; /* 5월 26일 일정 */
select *,count(*) from schedule where mid = 'hkd1234' and date_format(sDate, '%Y-%m')='2022-05' group by part order by sDate desc; /* 5월 일정 */

create table holiday(
	holidayIdx int not null auto_increment primary key,  /*공휴일 idx*/
	holidayName varchar(20) not null, /*공휴일 이름*/
	holidayDate varchar(30) not null /*공휴일 날짜*/
);

insert into holiday value(default, '2022-06-06', '현충일');
insert into holiday value(default, '2022-08-15', '광복절');
insert into holiday value(default, '2022-09-09', '추석연휴');
insert into holiday value(default, '2022-09-10', '추석');
insert into holiday value(default, '2022-09-11', '추석연휴');
insert into holiday value(default, '2022-10-03', '개천절');
insert into holiday value(default, '2022-10-09', '한글날');


select * from holiday;
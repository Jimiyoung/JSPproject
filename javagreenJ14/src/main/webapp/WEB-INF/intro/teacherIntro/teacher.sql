show tables;

create table teacher(
	idx int not null auto_increment primary key, /*게시글의 고유번호*/
	mid varchar(20) not null,	/* 작성자 아이디 */
	fName varchar(200) not null, /* 처음 업로드할 때 파일명 */
	fSName varchar(200) not null, /* 파일서버에 저장되는 실제 파일명 */
	fSize int, /* 총 파일 사이즈 */
	teacherName varchar(20) not null, /* 교사이름 */
	teacherBan varchar(20) not null, /*담당 학급명*/
	wDate datetime default now(), /* 파일 업로드한 날짜 */
	openSw char(6) default '공개', /* 파일 공개(비공개) 여부 */
	content text /* 교사 인사말 */
);

desc teacher;

drop table teacher;
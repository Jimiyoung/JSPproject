show tables;

create table foodMenu(
	idx int not null auto_increment, /*게시글의 고유번호*/
	mid varchar(20) not null,	/* 작성자 아이디 */
	midIdx int not null,
	nickName varchar(20) not null, /* 작성자 닉네임 */
	fName varchar(200) not null, /* 처음 업로드할 때 파일명 */
	fSName varchar(200) not null, /* 파일서버에 저장되는 실제 파일명 */
	fSize int, /* 총 파일 사이즈 */
	title varchar(100) not null, /* 파일 제목 */
	wDate datetime default now(), /* 파일 업로드한 날짜 */
	downNum int default 0, /* 파일 다운로드 횟수 */
	openSw char(6) default '공개', /* 파일 공개(비공개) 여부 */
	content text, /* 파일 상세설명 */
	readNum int default 0,           /*글 조회수*/
	primary key (idx), /* 기본키 : 자료파일의 고유번호 */
	foreign key (midIdx) references member(idx) /* 외래키 : member테이블의 idx */
	on update cascade on delete restrict
);

desc foodMenu;

drop table foodMenu;
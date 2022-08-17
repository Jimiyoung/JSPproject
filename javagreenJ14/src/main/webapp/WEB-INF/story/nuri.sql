show tables;

create table nuri(
	idx int not null auto_increment primary key, /*게시글의 고유번호*/
	mid varchar(20) not null,	/* 작성자 아이디 */
	nickName varchar(20) not null, /* 작성자 닉네임 */
	fName varchar(200), /* 처음 업로드할 때 파일명 */
	fSName varchar(200), /* 파일서버에 저장되는 실제 파일명 */
	fSize int, /* 총 파일 사이즈 */
	title varchar(100) not null, /* 게시글 제목 */
	wDate datetime default now(), /* 게시글 등록 날짜 */
	openSw char(6) default '공개', /* 파일 공개(비공개) 여부 */
	content text not null, /* 내용 */
	readNum int default 0,           /*글 조회수*/
	good int default 0              /*좋아요 수 누적*/
);

create table nuriReply(
	idx 		 int not null auto_increment, /*댓글의 고유번호*/
	nuriIdx int not null,           			/*원본글의 고유번호(외래키로 지정)*/
	mid 		 varchar(20) not null,        /*댓글 올린이의 아이디*/
	nickName varchar(20) not null,   			/*댓글 올린이의 닉네임*/
	wDate 	 datetime default now(),    	/*댓글 올린 날짜*/
	content  text not null,           		/*댓글 내용*/
	primary key(idx),                			/*주키(기본키)는 idx*/
	foreign key(nuriIdx) references nuri(idx) /* board 테이블의 idx를 boardReply테이블의 외래키로 설정.*/
	on update cascade 		/*원본 테이블에서 주키의 변경에 영향을 받는다.*/
	on delete restrict 		/*원본 테이블에서의 주키를 삭제시키지 못하게 한다(삭제시는 에러발생하고 원본키를 삭제하지 못함.)*/
);
desc foodMenu;

drop table foodMenu;
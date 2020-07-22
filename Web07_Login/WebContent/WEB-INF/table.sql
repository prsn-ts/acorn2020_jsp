CREATE TABLE board_cafe(  -- 스마트에디터를 적용한 게시판 글쓰기 및 글 목록 출력 용도의 테이블 
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	content CLOB,
	viewCount NUMBER, -- 조회수
	regdate DATE
);

CREATE SEQUENCE board_cafe_seq;

CREATE TABLE board_gallery(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100),
	caption VARCHAR2(200),
	imagePath VARCHAR2(100),
	regdate DATE
);

CREATE SEQUENCE board_gallery_seq;

-- upload 된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
	saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
	fileSize NUMBER NOT NULL,
	regdate DATE
);
-- 파일명을 다르게 저장 하는 이유는 작성자가 올렸던 파일들의 이름이 겹칠 수 있기 때문에 서버에 저장할 칼럼따로 실제 작성된 파일명 따로 저장해 보관해놓는다.

-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100), -- 프로필 이미지 경로를 저장할 칼럼
	regdate DATE -- 가입일 관련
);
create table restaurant(--가게 테이블
    resNum varchar2(30) constraint restaurant_resNum_pk primary key,
    res_name varchar2(50),
    res_email varchar2(100),
    res_addresss varchar2(50),
    res_phoneNum varchar2(50),
    res_img varchar2(100),
    business_hours varchar2(30),
    day_off varchar2(10),
    break_time varchar2(30),
    convenient varchar2(100),
    introduce varchar2(500),
    deposit NUMBER, -- 보증금
    enroll_date DATE,
    wating NUMBER,
    reservation NUMBER
);
-- 회원테이블
CREATE TABLE jjim_user
( -- 회원테이블
    user_email            varchar2(50) PRIMARY KEY,
    user_pw            	  varchar2(30),
  -- 이메일 인증 유무 인증x = 0, 인증o = 1
    emailAuth number constraint jjim_user_emailAuth_ck check(emailAuth in(0,1)),
    nickname            varchar2(30),
    phone_number        varchar2(20),
    user_address        varchar2(50),
    no_show             number,
  -- 연결 계정 권한(일반 0,카톡 1,네이버 2)
    idAuth number constraint jjim_user_user_idAuth_ck check(idAuth in(0,1,2))
);
INSERT into jjim_user VALUES('alsn0527@naver.com','1234',0,'유민우','010-9204-5515','용오로 82',0,0);


-- 액세스토큰 테이블
create table access_Token(
    user_email varchar2(30) CONSTRAINT access_Token_user_email_FK REFERENCES jjim_user(user_email),
    -- 네이버
    nvrToken varchar2(50),
    kkoToken varchar2(50)
);

-- 사업자 테이블
create table res_user(
    resNum varchar2(30) constraint res_user_resNum_fk references restaurant(resNum),
    password varchar2(30),
    email varchar2(100),
    res_name varchar2(20),
    phone_Num varchar2(50),
    res_adress varchar2(100)
);
--포장 테이블
CREATE TABLE take_out(
   user_email varchar2(30) CONSTRAINT take_out_user_email_FK REFERENCES jjim_user(user_email),
   resNum varchar2(30) constraint take_out_resNum_fk references restaurant(resNum),
   take_out_time DATE,
   receipt_time DATE
);
-- 예약 테이블
CREATE TABLE reservation(
   user_email varchar2(30) CONSTRAINT reservation_user_email_FK REFERENCES jjim_user(user_email),
   resNum varchar2(30) constraint reservation_resNum_fk references restaurant(resNum),
   reserve_apply_person NUMBER,
   reserve_start_time DATE,
   reserve_request varchar2(100)
);
-- 찜리뷰테이블
CREATE TABLE jjim_review(
   review_code varchar2(20) PRIMARY KEY,
   user_email varchar2(30) CONSTRAINT jjim_review_user_email_FK REFERENCES jjim_user(user_email),
   resNum varchar2(30) constraint jjim_review_resNum_fk references restaurant(resNum),
   star_sco NUMBER,
   review_date DATE,
   review_content varchar2(100),
   review_img varchar2(100)
);
-- 메뉴테이블
create table menu(
    resNum varchar2(30) constraint menu_resNum_fk references restaurant(resNum),
    mCategory varchar(30),
    menuName varchar2(30),
    price number,
    food_image varchar2(100)
);
-- 매장픽 테이블
create table resPick(
    resNum varchar2(30) constraint resPick_resNum_fk references restaurant(resNum),
    mood varchar2(20),
    purpose varchar2(20),
    food_type varchar2(20),
    table_type varchar2(20)
);

-- 줄서기 테이블
create table waiting
(
    resNum varchar2(30) constraint waiting_resNum_fk references restaurant (resNum),
    user_email varchar2(30) constraint waiting_user_email_kf references jjim_user(user_email),
    wStartTime varchar2(30),
    waiting_num number, --대기팀 수
    waiting_person number,
    cancel char check(cancel in('F','T')),
    enter_check char check(enter_check in('F','T'))
);
-- 정책 일부로 pk 안넣음
create table policy(
    refund varchar2(500)
);

-- 검색기록 테이블
CREATE TABLE jjim_sch(
	user_email varchar2(30) CONSTRAINT jjim_sch_user_email_FK REFERENCES jjim_user(user_email),
	search_word varchar2(100),
	search_date date
);

DROP TABLE JJIM_SCH;
DROP TABLE policy;
DROP TABLE waiting;
DROP TABLE resPick;
DROP TABLE menu;
DROP TABLE jjim_review;
DROP TABLE reservation;
DROP TABLE res_user;
DROP TABLE access_Token;
DROP TABLE jjim_user;
DROP TABLE sns_user;
DROP TABLE restaurant;



INSERT INTO jjim_sch values('alsn0527@naver.com','연돈',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','런던베이글',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','숙성도',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','톤쇼우',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','해목',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','아웃백',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','송계옥',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','천돈가',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','해운대',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','성수',sysdate);
INSERT INTO jjim_sch values('alsn0527@naver.com','인천',sysdate);

-- 인기검색어 최근 7일 10개
SELECT SEARCH_WORD  FROM (
SELECT SEARCH_WORD , count(SEARCH_WORD) cnt 
FROM (SELECT * FROM JJIM_SCH WHERE (sysdate-SEARCH_DATE) <8 )
GROUP BY SEARCH_WORD 
ORDER BY cnt DESC)
WHERE ROWNUM<=10;

INSERT INTO restaurant values('123-45-67890','연돈','alsn0527@naver.com','용오로 82','010-9204-5515',
'img','11:00-22:00','화요일','15:00-16:00','단체석 완비/주차 이용가능','매장 전화문의가 많아 전화응대가 어렵습니다.',5000,
to_date('20221120','YYYY-MM-DD'),1,1);
--drop용
drop table customer;
drop table store_table;
drop table menu;
drop table cart;
drop table orders;
drop table review;
drop table like_table;


--기존 테이블 날리기

DROP TABLE menu CASCADE CONSTRAINTS;

DROP TABLE jim CASCADE CONSTRAINTS;

DROP TABLE orders CASCADE CONSTRAINTS;

DROP TABLE ordermenu CASCADE CONSTRAINTS;

DROP TABLE seller CASCADE CONSTRAINTS;

DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE market CASCADE CONSTRAINTS;

DROP TABLE review CASCADE CONSTRAINTS;

DROP TABLE store_table CASCADE CONSTRAINTS;


-- 시퀀스 삭제
DROP SEQUENCE cust_seq;
DROP SEQUENCE like_seq;
DROP SEQUENCE menu_seq;
DROP SEQUENCE order_seq;
DROP SEQUENCE review_seq;
DROP SEQUENCE sell_seq;
DROP SEQUENCE shop_seq;
DROP SEQUENCE store_seq;

-------------------------------------------------------------------

--일반회원(=고객)테이블
create table customer (
cust_id varchar2(30) primary key, --고객아이디
cust_pw varchar2(30), --비번
cust_name varchar2(30), --이름
cust_phone varchar2(30), --전화번호
cust_email varchar2(30), --이메일
cust_nickname varchar2(30) --별명
);
alter table customer add cust_num number(8);

--커스터머 시퀀스 생성 
create SEQUENCE cust_seq
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ;  
 
 

--가게(=휴게소) 테이블

create table store_table(
store_id number(8)  primary key, --가게 id( 시퀀스)
store_name varchar2(100) ,--가게이름
store_highway varchar2(30),--위치한 도로명
store_addr varchar2(30),--주소
store_phone varchar2(30), --가게전화번호
store_open varchar2(30), --오픈시간
store_close varchar2(30), --닫는시간
store_reviewcnt number(38), --리뷰카운트
store_likecnt number(38), --찜카운트
store_staravg number(38) --별점평균
);


-- 가게 테이블 가게id 시퀀스 생성
create SEQUENCE store_seq
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ; 




--메뉴 테이블

create table menu(
menu_id number(8) primary key,--메뉴id (시퀀스로 작성)
store_name varchar2(100), --가게이름
menu_name varchar2(30), --메뉴명
menu_price number(8), --메뉴가격
menu_content varchar2(500), --메뉴소개
menu_img varchar2(30), --메뉴이미지(path)
menu_category varchar2(30) --메뉴 분류 카테고리

);

select * from menu;

--신메뉴/베스트메뉴 추가
alter table menu add menu_new varchar2(10) constraint boolean_ck check(menu_new ='0' or menu_new='1');
alter table menu add menu_best varchar2(10) constraint boolean_ck2 check(menu_best ='0' or menu_best='1');


-- 메뉴 테이블 메뉴id 시퀀스 생성
create SEQUENCE menu_seq
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ; 



--장바구니 테이블

create table cart(
cust_id varchar2(30) references customer(cust_id),--고객id (con 고객테이블 )
menu_id number(8) references menu(menu_id), --담은 메뉴id (con 메뉴테이블)
cart_quant number(8),--담은 수량
cart_total number(8)--장바구니물품 금액 소계
);



commit;

--주문 테이블

 create table orders(
 order_num number(8) PRIMARY KEY, -- 주문번호(시퀀스값 들어올것)
 cust_id varchar2(30) references customer(cust_id) on delete cascade,-- 고객id(con 고객테이블)
 store_id number(8) references store_table(store_id),-- 주문 가게 id(con 가게테이블)
 menu_id number(8) references menu(menu_id), --주문 메뉴id (con 메뉴테이블)
 order_quant number(8),--주문 수량
 order_req varchar2(40),--요청사항(20자이내)
 order_date date,   -- 주문일(default sysdate넣을수도)
 total_pmt number(10),--총 결제금액
 pmt_method  varchar2(30) --결제수단
);



select * from menu where store_name like '%휴게소%';
 
-- 주문 테이블 주문번호 시퀀스 생성
create SEQUENCE order_seq
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ; 


--리뷰 테이블
 create table review(
  review_num number(8) PRIMARY KEY,--리뷰번호(시퀀스값 들어올것)--여기를 작성날짜로 해서 고객 id와 PK로 묶는방법도있음
  order_num number(8) references orders(order_num),-- 주문번호(con 주문테이블)
  cust_id varchar2(30) references customer(cust_id) on delete cascade,-- 고객id(con 고객테이블)--작성자
review_subject varchar2(100), --리뷰 제목  
review_content varchar2(500),--리뷰 내용
review_img varchar2(30), --리뷰 이미지
review_star number(8),--별점
review_date date --리뷰 작성일
);


select * from orders;
-- 리뷰 테이블 리뷰 시퀀스 생성
create SEQUENCE review_seq
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ; 



--찜(like)테이블
create table like_table (
like_num number PRIMARY KEY, --찜 기본키
store_id number(8) references store_table(store_id),--가게에 대한 찜 (con 가게테이블)
cust_id  varchar2(30)  references customer(cust_id) --고객 아이디(con 고객테이블)
);

--찜 테이블 찜 시퀀스 생성
create SEQUENCE like_seq
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ; 



--cart 정보 추가

insert into cart
values('momoring',22,1,8000,2,CART_SEQ.nextval);

select * from cart;

delete from cart
where cart_total=24000;


select * from orders;

-- cart에 cart_id 컬럼 추가(PK)

alter table cart add cart_id number(8) primary key;

--cart 내용 모두지우기
delete from cart;

--cart_id 시퀀스 생성

create SEQUENCE cart_seq
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ; 


--근우님 카트 
create table my_cart(
    menu_name varchar2(30), 
   menu_price number(20),
   menu_count number(20)
);

--- 
alter table customer
add content_file VARCHAR2(500);
commit;

select * from customer;
select * from my_cart;

select * from orders;
select * from menu;
select * from review;


alter table my_cart add store_id number(8);

alter table orders add menu_name varchar2(80);

alter table orders add;

--- 
alter table customer
add content_file VARCHAR2(500);


---------------------------------------------여기서부터 작업---------------------------------


--가게정보 삽입
insert into store_table(store_id, store_name, store_highway ,store_addr, store_phone, store_open, store_close, store_reviewcnt,store_likecnt, store_staravg) 
values(store_seq.nextval,'하남드림휴게소(통영)','중부선','하남시','031-791-4200','10:00','22:00',233,333,4.1);

insert into store_table(store_id, store_name, store_highway ,store_addr, store_phone, store_open, store_close, store_reviewcnt,store_likecnt, store_staravg) 
values(store_seq.nextval,'이천휴게소(통영)','중부선','이천시','031-638-1117','10:00','22:00',222,123,4.7);

insert into store_table(store_id, store_name, store_highway ,store_addr, store_phone, store_open, store_close, store_reviewcnt,store_likecnt, store_staravg) 
values(store_seq.nextval,'안성휴게소(부산방향)','경부선','안성시','031-655-0531','10:00','22:00',433,182,4.2);

insert into store_table(store_id, store_name, store_highway ,store_addr, store_phone, store_open, store_close, store_reviewcnt,store_likecnt, store_staravg) 
values(store_seq.nextval,'서울만남의광장(부산방향)','경부선','서울시','02-578-3372','10:00','22:00',641,763,4.2);


--메뉴정보 삽입
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '말죽거리소고기국밥', 6500, '조선시대 말까지 삼남지방으로 통하는 길목에서 말을 쉬이며 여행자들이 쉬어가던 말죽거리. 그 당시 지친 여행자들의
       기운을 복돋는 푸짐한 한 그릇, 말죽거리 소고기국밥. 푸짐한 소고기와, 국내산 우거지, 대파, 무우등을 특제 다대기와 함께 푸욱 삶은 국밥 어떠신가요?', 'Maljukgeori' , '한식', '1' , '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '버터에 빠진 통감자', 4500, '알 굵은 강원도 햇감자와 버터의 만남. 설탕과 소금의 단짠의 조화. 지금 만나보세요', 'Potato' , '한식', '1', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '소떡소떡', 2500, '이영자가 추천한 그 맛!! 바삭바삭 튀김 떡과, 짭짤한 소세지 그리고 특제소스의 콜라보레이션!! 한 소떡 하실래예?', 'Soduck' , '한식', '0', '1');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '돼지고기 김치찌개', 7500, '푸우욱 삭은 묵은지에, 도톰한 국내산 돼지고기를 듬뿍 넣은 모두가 좋아하는 한식 끝판왕', 'Kimchi' , '한식', '1', '0');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '핫바', 2500, '휴게소 하면 뭐다?? 바로 핫바!!', 'hotbar' , '한식', '1', '0');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '소세지', 3500, '달콤한 케�y과 함께 먹으면 JMT!!', 'sosage' , '한식', '0', '1');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '짜장', 7500, '어머님은 자장면이 좋다고 하셨어~ 남녀 노소 모두가 좋아하는 그 메뉴!!!', 'zazang' , '중식', '1', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '차돌짬뽕', 10500, '얼큰한 중식 짬뽕국물에 차돌박이가 퐁당!! 한국인의 중화요일 짬뽕입니다', 'champong' , '중식', '1', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '사천짜장', 8500, '중국 사천의 매운맛! 만남의 광장에 상륙 !! 중식셰프의 환상적인 웍질 아래 탄생한 정통중국요리. 안 먹어본 사람은 있어도, 한 번 먹어본 없어 본 사람은 없는 그 짜장!', 'sazazang' , '중식', '0', '0');
    
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '잡채밥', 9500, '세상에 맛 없는 잡채는 없다 !! 한국의 대표요리 잡채와, 중국식 볶음밥의 조화 !! 퓨전중식 잡채밥을 경험하세요', 'jobche' , '중식', '0', '1');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '돈까스', 7500, '경양식의 최고 보스. 부동의 스테디셀러. 돈.까.쓰.', 'gas' , '양식', '1', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '치즈돈까스', 8500, '치즈덕후들 다 모여라!! 치돈 드셔보셨어유? 안 드셔보셨으면 말을 마세요.', 'chgun' , '양식', '0', '0'); 

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '함박스테이크', 8500, '먹는 사람 함박웃게 만드는 그 스테이크!! 정통 경양식 소스와 함께 맛보는 천상의 맛', 'hamback' , '양식', '0', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '토마토파스타', 8500, '고급 토마토소스로 만든 최고급 토마토 파스타를 휴게소에서 즐기세요', 'tomato' , '양', '0', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '빠네', 13500, '수줍게 크림파스타를 품은 빵. 휴게소에서 즐기는 사치. 빠네', 'bbane' , '양식', '0', '1');       


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '말죽거리소고기국밥', 6500, '조선시대 말까지 삼남지방으로 통하는 길목에서 말을 쉬이며 여행자들이 쉬어가던 말죽거리. 그 당시 지친 여행자들의
       기운을 복돋는 푸짐한 한 그릇, 말죽거리 소고기국밥. 푸짐한 소고기와, 국내산 우거지, 대파, 무우등을 특제 다대기와 함께 푸욱 삶은 국밥 어떠신가요?', 'Maljukgeori' , '한식', '1' , '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '버터에 빠진 통감자', 4500, '알 굵은 강원도 햇감자와 버터의 만남. 설탕과 소금의 단짠의 조화. 지금 만나보세요', 'Potato' , '한식', '1', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '소떡소떡', 2500, '이영자가 추천한 그 맛!! 바삭바삭 튀김 떡과, 짭짤한 소세지 그리고 특제소스의 콜라보레이션!! 한 소떡 하실래예?', 'Soduck' , '한식', '0', '1');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '돼지고기 김치찌개', 7500, '푸우욱 삭은 묵은지에, 도톰한 국내산 돼지고기를 듬뿍 넣은 모두가 좋아하는 한식 끝판왕', 'Kimchi' , '한식', '1', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '핫바', 2500, '휴게소 하면 뭐다?? 바로 핫바!!', 'hotbar' , '한식', '1', '0');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '소세지', 3500, '달콤한 케잌과 함께 먹으면 JMT!!', 'sosage' , '한식', '0', '1');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '짜장', 7500, '어머님은 자장면이 좋다고 하셨어~ 남녀 노소 모두가 좋아하는 그 메뉴!!!', 'zazang' , '중식', '1', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '차돌짬뽕', 10500, '얼큰한 중식 짬뽕국물에 차돌박이가 퐁당!! 한국인의 중화요일 짬뽕입니다', 'champong' , '중식', '1', '0');
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '사천짜장', 8500, '중국 사천의 매운맛! 만남의 광장에 상륙 !! 중식셰프의 환상적인 웍질 아래 탄생한 정통중국요리. 안 먹어본 사람은 있어도, 한 번 먹어본 없어 본 사람은 없는 그 짜장!', 'sazazang' , '중식', '0', '0');
    
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '잡채밥', 9500, '세상에 맛 없는 잡채는 없다 !! 한국의 대표요리 잡채와, 중국식 볶음밥의 조화 !! 퓨전중식 잡채밥을 경험하세요', 'jobche' , '중식', '0', '1');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '돈까스', 7500, '경양식의 최고 보스. 부동의 스테디셀러. 돈.까.쓰.', 'gas' , '양식', '1', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '치즈돈까스', 8500, '치즈덕후들 다 모여라!! 치돈 드셔보셨어유? 안 드셔보셨으면 말을 마세요.', 'chgun' , '양식', '0', '0'); 

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '함박스테이크', 8500, '먹는 사람 함박웃게 만드는 그 스테이크!! 정통 경양식 소스와 함께 맛보는 천상의 맛', 'hamback' , '양식', '0', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '토마토파스타', 8500, '고급 토마토소스로 만든 최고급 토마토 파스타를 휴게소에서 즐기세요', 'tomato' , '양', '0', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '빠네', 13500, '수줍게 크림파스타를 품은 빵. 휴게소에서 즐기는 사치. 빠네', 'bbane' , '양식', '0', '1');  

-- 추가추가 내 정신건강을 위하여... 
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '말죽거리소고기국밥', 6500, '조선시대 말까지 삼남지방으로 통하는 길목에서 말을 쉬이며 여행자들이 쉬어가던 말죽거리. 그 당시 지친 여행자들의
       기운을 복돋는 푸짐한 한 그릇, 말죽거리 소고기국밥. 푸짐한 소고기와, 국내산 우거지, 대파, 무우등을 특제 다대기와 함께 푸욱 삶은 국밥 어떠신가요?', 'Maljukgeori' , '한식', '1' , '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '버터에 빠진 통감자', 4500, '알 굵은 강원도 햇감자와 버터의 만남. 설탕과 소금의 단짠의 조화. 지금 만나보세요', 'Potato' , '한식', '1', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '소떡소떡', 2500, '이영자가 추천한 그 맛!! 바삭바삭 튀김 떡과, 짭짤한 소세지 그리고 특제소스의 콜라보레이션!! 한 소떡 하실래예?', 'Soduck' , '한식', '0', '1');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '돼지고기 김치찌개', 7500, '푸우욱 삭은 묵은지에, 도톰한 국내산 돼지고기를 듬뿍 넣은 모두가 좋아하는 한식 끝판왕', 'Kimchi' , '한식', '1', '0');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '핫바', 2500, '휴게소 하면 뭐다?? 바로 핫바!!', 'hotbar' , '한식', '1', '0');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '소세지', 3500, '달콤한 케�y과 함께 먹으면 JMT!!', 'sosage' , '한식', '0', '1');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '짜장', 7500, '어머님은 자장면이 좋다고 하셨어~ 남녀 노소 모두가 좋아하는 그 메뉴!!!', 'zazang' , '중식', '1', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '차돌짬뽕', 10500, '얼큰한 중식 짬뽕국물에 차돌박이가 퐁당!! 한국인의 중화요일 짬뽕입니다', 'champong' , '중식', '1', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '사천짜장', 8500, '중국 사천의 매운맛! 만남의 광장에 상륙 !! 중식셰프의 환상적인 웍질 아래 탄생한 정통중국요리. 안 먹어본 사람은 있어도, 한 번 먹어본 없어 본 사람은 없는 그 짜장!', 'sazazang' , '중식', '0', '0');
    
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '잡채밥', 9500, '세상에 맛 없는 잡채는 없다 !! 한국의 대표요리 잡채와, 중국식 볶음밥의 조화 !! 퓨전중식 잡채밥을 경험하세요', 'jobche' , '중식', '0', '1');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '돈까스', 7500, '경양식의 최고 보스. 부동의 스테디셀러. 돈.까.쓰.', 'gas' , '양식', '1', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '하남드림휴게소(통영)', '치즈돈까스', 8500, '치즈덕후들 다 모여라!! 치돈 드셔보셨어유? 안 드셔보셨으면 말을 마세요.', 'chgun' , '양식', '0', '0'); 

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '함박스테이크', 8500, '먹는 사람 함박웃게 만드는 그 스테이크!! 정통 경양식 소스와 함께 맛보는 천상의 맛', 'hamback' , '양식', '0', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '토마토파스타', 8500, '고급 토마토소스로 만든 최고급 토마토 파스타를 휴게소에서 즐기세요', 'tomato' , '양', '0', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '서울만남의광장(부산방향)', '빠네', 13500, '수줍게 크림파스타를 품은 빵. 휴게소에서 즐기는 사치. 빠네', 'bbane' , '양식', '0', '1');       


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '이천휴게소(통영)', '말죽거리소고기국밥', 6500, '조선시대 말까지 삼남지방으로 통하는 길목에서 말을 쉬이며 여행자들이 쉬어가던 말죽거리. 그 당시 지친 여행자들의
       기운을 복돋는 푸짐한 한 그릇, 말죽거리 소고기국밥. 푸짐한 소고기와, 국내산 우거지, 대파, 무우등을 특제 다대기와 함께 푸욱 삶은 국밥 어떠신가요?', 'Maljukgeori' , '한식', '1' , '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '이천휴게소(통영)', '버터에 빠진 통감자', 4500, '알 굵은 강원도 햇감자와 버터의 만남. 설탕과 소금의 단짠의 조화. 지금 만나보세요', 'Potato' , '한식', '1', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '이천휴게소(통영)', '소떡소떡', 2500, '이영자가 추천한 그 맛!! 바삭바삭 튀김 떡과, 짭짤한 소세지 그리고 특제소스의 콜라보레이션!! 한 소떡 하실래예?', 'Soduck' , '한식', '0', '1');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '이천휴게소(통영)', '돼지고기 김치찌개', 7500, '푸우욱 삭은 묵은지에, 도톰한 국내산 돼지고기를 듬뿍 넣은 모두가 좋아하는 한식 끝판왕', 'Kimchi' , '한식', '1', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '이천휴게소(통영)', '핫바', 2500, '휴게소 하면 뭐다?? 바로 핫바!!', 'hotbar' , '한식', '1', '0');


insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '이천휴게소(통영)', '소세지', 3500, '달콤한 케잌과 함께 먹으면 JMT!!', 'sosage' , '한식', '0', '1');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '이천휴게소(통영)', '짜장', 7500, '어머님은 자장면이 좋다고 하셨어~ 남녀 노소 모두가 좋아하는 그 메뉴!!!', 'zazang' , '중식', '1', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '차돌짬뽕', 10500, '얼큰한 중식 짬뽕국물에 차돌박이가 퐁당!! 한국인의 중화요일 짬뽕입니다', 'champong' , '중식', '1', '0');
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '사천짜장', 8500, '중국 사천의 매운맛! 만남의 광장에 상륙 !! 중식셰프의 환상적인 웍질 아래 탄생한 정통중국요리. 안 먹어본 사람은 있어도, 한 번 먹어본 없어 본 사람은 없는 그 짜장!', 'sazazang' , '중식', '0', '0');
    
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '잡채밥', 9500, '세상에 맛 없는 잡채는 없다 !! 한국의 대표요리 잡채와, 중국식 볶음밥의 조화 !! 퓨전중식 잡채밥을 경험하세요', 'jobche' , '중식', '0', '1');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '돈까스', 7500, '경양식의 최고 보스. 부동의 스테디셀러. 돈.까.쓰.', 'gas' , '양식', '1', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '치즈돈까스', 8500, '치즈덕후들 다 모여라!! 치돈 드셔보셨어유? 안 드셔보셨으면 말을 마세요.', 'chgun' , '양식', '0', '0'); 

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '함박스테이크', 8500, '먹는 사람 함박웃게 만드는 그 스테이크!! 정통 경양식 소스와 함께 맛보는 천상의 맛', 'hamback' , '양식', '0', '0');

insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '토마토파스타', 8500, '고급 토마토소스로 만든 최고급 토마토 파스타를 휴게소에서 즐기세요', 'tomato' , '양', '0', '0');
       
insert into menu(menu_id, store_name, menu_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best)
       VALUES(menu_seq.nextval, '안성휴게소(부산방향)', '빠네', 13500, '수줍게 크림파스타를 품은 빵. 휴게소에서 즐기는 사치. 빠네', 'bbane' , '양식', '0', '1');  





--고객테이블에 추가
insert into customer(cust_id, cust_pw , cust_name , cust_phone, cust_email , cust_nickname) 
values('momoring', '12345', '김모모','01034889466','sy768@naver.com','졸개');

insert into customer(cust_id, cust_pw , cust_name , cust_phone, cust_email , cust_nickname) 
values('eatlike', '12345', '남자다','01032342312','asdf@naver.com','맛집투어남');

insert into customer(cust_id, cust_pw , cust_name , cust_phone, cust_email , cust_nickname) 
values('gamja', '12345', '한승수','01032342312','tmdtn123@naver.com','포테이토');

insert into customer(cust_id, cust_pw , cust_name , cust_phone, cust_email , cust_nickname) 
values('JavaSlave', '12345', '육근우','01032342312','rmsdn123@naver.com','코딩노예');

select * from customer;

select cust_id, cust_name, cust_pw, cust_email, cust_nickname, cust_phone 
from customer where cust_id='맛집투어남' and cust_pw='2';

select cust_id, cust_name, cust_pw, cust_email, cust_nickname, cust_phone "
			+ "from customer where cust_id=#{cust_id} and cust_pw=#{cust_pw};

select * from customer;

update customer set cust_num= cust_seq.nextval where cust_id='momoring';
update customer set cust_num= cust_seq.nextval where cust_id='eatlike';
update customer set cust_num= cust_seq.nextval where cust_id='JavaSlave';
update customer set cust_num= cust_seq.nextval where cust_id='gamja';


--orders에 추가

insert into orders(ORDER_NUM ,CUST_ID ,STORE_ID, MENU_ID, ORDER_QUANT, ORDER_REQ, ORDER_DATE, TOTAL_PMT, PMT_METHOD) 
values(order_seq.nextval, 'momoring', 1 , 4 ,2, '따뜻하게', sysdate, 12000, '신용카드');

insert into orders(ORDER_NUM ,CUST_ID ,STORE_ID, MENU_ID, ORDER_QUANT, ORDER_REQ, ORDER_DATE, TOTAL_PMT, PMT_METHOD) 
values(order_seq.nextval, 'eatlike', 2 , 7 ,2, '바삭하게', sysdate, 16000, '신용카드');

insert into orders(ORDER_NUM ,CUST_ID ,STORE_ID, MENU_ID, ORDER_QUANT, ORDER_REQ, ORDER_DATE, TOTAL_PMT, PMT_METHOD) 
values(order_seq.nextval,
'JavaSlave', 3 , 29 ,2, '양 많이주세요~', sysdate, 24000, '신용카드');

insert into orders(ORDER_NUM ,CUST_ID ,STORE_ID, MENU_ID, ORDER_QUANT, ORDER_REQ, ORDER_DATE, TOTAL_PMT, PMT_METHOD) 
values(order_seq.nextval,'eatlike', 3 , 7 ,2, '양 많이!', sysdate, 24000, '신용카드');

insert into orders(ORDER_NUM ,CUST_ID ,STORE_ID, MENU_ID, ORDER_QUANT, ORDER_REQ, ORDER_DATE, TOTAL_PMT, PMT_METHOD) 
values(order_seq.nextval, 'JavaSlave', 4 , 25 ,2, '리뷰이벤트 참여 해요 ~♥', sysdate, 16000, '신용카드');

insert into orders(ORDER_NUM ,CUST_ID ,STORE_ID, MENU_ID, ORDER_QUANT, ORDER_REQ, ORDER_DATE, TOTAL_PMT, PMT_METHOD) 
values(order_seq.nextval, 'gamja', 4 , 25 ,2, '재방문해요 항상 감사합니다~', sysdate, 16000, '신용카드');

select * from orders;

select * from store_table;, menu;

delete from review;

commit;

--review에 추가 
insert into review(review_num, order_num, cust_id, review_subject, review_content, review_img, review_star, review_date) 
values(review_seq.nextval,2,'eatlike','돈까스 맛집!', '휴게소에서 파는 돈까스가 그냥그렇겠지 했는데 기대 이상이였습니다. 너무 맛있게 잘먹었어요! ', 'review_gas', 5, SYSDATE + 1);

insert into review(review_num, order_num, cust_id, review_subject, review_content, review_img, review_star, review_date) 
values(review_seq.nextval,1,'momoring','짜장면이 불었어요 ㅠㅠ', '짜장면은 맛있었는데 좀 불러서 속상 했어요 .. ', 'review_jjajang', 3, SYSDATE-5);

insert into review(review_num, order_num, cust_id, review_subject, review_content, review_img, review_star, review_date) 
values(review_seq.nextval,20,'JavaSlave','먹을만해요', '리뷰이벤트로 받은 통감자 너무 맛있어요 감사합니다 ', 'review_tomato', 4, SYSDATE + 1);

insert into review(review_num, order_num, cust_id, review_subject, review_content, review_img, review_star, review_date) 
values(review_seq.nextval,20,'eatlike','돈까스 맛집!', '휴게소에서 파는 돈까스가 그냥그렇겠지 했는데 기대 이상이였습니다. 너무 맛있게 잘먹었어요! ', 'review_gas', 5, SYSDATE + 1);


update review set review_img('review_tomato') where review.order_num = orders.order_num and orders.menu_id = 29;

insert into review(review_num, order_num, cust_id, review_subject, review_content, review_img, review_star, review_date) 
values(review_seq.nextval,5,'gamja','오늘은 불만 한가득', '아니 음식에서 비닐이 나왔는데 환불이 안된다뇨 .... 잔짜 실망입니다 ', 'review1', 1, SYSDATE + 1);


--찜(like) 아구찜쓰 데이터 ~
insert into like_table (like_num, store_id, cust_id)
values(LIKE_SEQ.nextval, 1, 'momoring');
insert into like_table (like_num, store_id, cust_id)
values(LIKE_SEQ.nextval, 2, 'momoring');
insert into like_table (like_num, store_id, cust_id)
values(LIKE_SEQ.nextval, 4, 'momoring');

insert into like_table (like_num, store_id, cust_id)
values(LIKE_SEQ.nextval, 3, 'JavaSlave');

insert into like_table (like_num, store_id, cust_id)
values(LIKE_SEQ.nextval, 1, 'gamja');
insert into like_table (like_num, store_id, cust_id)
values(LIKE_SEQ.nextval, 4, 'gamja');


select * from like_table;



-- 여기 위에까지가 더미 데이터 !! 

-- 리뷰셀렉트 
select distinct review.review_num, review.order_num, review.cust_id, review.review_subject, 
review.review_content, review.review_img, review.review_star, to_char(review.review_date, 'yy-mm-dd') as review_date, 
orders.menu_id, menu.menu_name 
from review, orders, menu, store_table 
where review.order_num=orders.order_num 
and orders.store_id = store_table.store_id 
and orders.store_id=3 and orders.menu_id=menu.menu_id order by review_num desc;


select /*Index_desc( review.review_num)*/ review.order_num, review.cust_id, review.review_subject, 
review.review_content, review.review_img, review.review_star, to_char(review.review_date, 'yy-mm-dd') as review_date, 
orders.menu_id, menu.menu_name 
from review, orders, menu, store_table 
where review.order_num=orders.order_num 
and orders.store_id = store_table.store_id 
and orders.store_id=3 and orders.menu_id=menu.menu_id;


select count(*) from review, orders, store_table 
where review.order_num=orders.order_num and orders.store_id = store_table.store_id and orders.store_id=1;

select * from store_table where store_highway like '%경부%';

select * from menu where store_name ='안성휴게소(부산방향)';
select * from menu where store_name ='하남드림휴게소(통영)';

select * from orders;, review;
select * from review;
select * from menu;

select * from review, orders;
select * from customer;
commit;

select menu_id, menu_name, store_name, menu_price, menu_content, menu_img, menu_category, menu_new, menu_best 
from menu where store_name like '%하남드림휴게소(통영)%';
  
 
select store_id, cust_id from like_table where store_id=3 and cust_id=''momoring';
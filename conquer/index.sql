-- answer p644

CREATE TABLE tCity 
(
    name CHAR(10) PRIMARY KEY, -- 고정 길이 문자열
    area INT NULL,
    popu INT NULL,
    metro CHAR(1) NOT NULL,
    region CHAR(6) NOT NULL
);

CREATE TABLE tStaff
(
	name CHAR (15) PRIMARY KEY,
	depart CHAR (10) NOT NULL,
	gender CHAR(3) NOT NULL,
	joindate DATE NOT NULL,
	grade CHAR(10) NOT NULL,
	salary INT NOT NULL,
	score DECIMAL(5,2) NULL
);

CREATE TABLE tEmployee
(
	name CHAR(10) PRIMARY KEY,
	salary INT NOT NULL,
	addr VARCHAR(30) NOT NULL
);

INSERT INTO tEmployee VALUES ('김상형', 650, '이천시');
INSERT INTO tEmployee VALUES ('문종민', 480, '대구시');
INSERT INTO tEmployee VALUES ('권성직', 625, '안동시');


CREATE TABLE tProject
(
	projectID INT PRIMARY KEY,
	employee CHAR(10) NOT NULL,
	project VARCHAR(30) NOT NULL,
	cost INT
);

INSERT INTO tProject VALUES (1, '김상형', '홍콩 수출건', 800);
INSERT INTO tProject VALUES (2, '김상형', 'TV 광고건', 3400);
INSERT INTO tProject VALUES (3, '김상형', '매출분석건', 200);
INSERT INTO tProject VALUES (4, '문종민', '경영 혁신안 작성', 120);
INSERT INTO tProject VALUES (5, '문종민', '대리점 계획', 85);
INSERT INTO tProject VALUES (6, '권성직', '노조 협상건', 24);

CREATE TABLE tMember
(
    member VARCHAR(20) PRIMARY KEY, 	-- 아이디
    age INT NOT NULL,                      	-- 나이 
    email VARCHAR(30) NOT NULL,           	-- 이메일
    addr VARCHAR(50) NOT NULL,            	-- 주소
    money INT DEFAULT 1000 NOT NULL,     	-- 예치금
    grade INT DEFAULT 1 NOT NULL,         	-- 고객등급. 1=준회원, 2=정회원, 3=우수회원
    remark VARCHAR(100) NULL             	-- 메모 사항
);

-- 회원 데이터
INSERT INTO tMember VALUES ('춘향',16,'1004@naver.com','전남 남원시',20000, 2, '');
INSERT INTO tMember VALUES ('이도령',18,'wolf@gmail.com','서울 신사동',150000, 3, '');
INSERT INTO tMember VALUES ('향단',25,'candy@daum.net','전남 남원시',5000, 2, '');
INSERT INTO tMember VALUES ('방자',28,'devlin@ssang.co.kr','서울 개포동',1000, 1, '요주의 고객');

-- 상품 분류 테이블
CREATE TABLE tCategory
(
   category VARCHAR(10) PRIMARY KEY,	-- 분류명
   discount INT NOT NULL,			-- 할인율
   delivery INT NOT NULL,                   	-- 배송비
   takeback CHAR(1)                         	-- 반품 가능성
);

-- 분류 데이터
INSERT INTO tCategory (category, discount, delivery, takeback) VALUES ('식품', 0, 3000, 'n');
INSERT INTO tCategory (category, discount, delivery, takeback) VALUES ('패션', 10, 2000, 'y');
INSERT INTO tCategory (category, discount, delivery, takeback) VALUES ('가전', 20, 2500, 'y');
INSERT INTO tCategory (category, discount, delivery, takeback) VALUES ('성인', 5, 1000, 'n');

-- 상품 테이블
CREATE TABLE tItem
(
    item VARCHAR(20) PRIMARY KEY,   	-- 상품명
    company VARCHAR(20) NULL,            	-- 제조사
    num INT NOT NULL,                      	-- 재고
    price INT NOT NULL,                     	-- 정가
    category VARCHAR(10) NOT NULL,       	-- 분류
    CONSTRAINT item_fk FOREIGN KEY(category) REFERENCES tCategory(category)
);

-- 상품 데이터
INSERT INTO tItem (item,company,num,price,category) VALUES ('노트북', '샘성', 3, 820000, '가전');
INSERT INTO tItem (item,company,num,price,category) VALUES ('청바지', '방방', 80, 32000, '패션');
INSERT INTO tItem (item,company,num,price,category) VALUES ('사과', '문경농원', 24, 16000, '식품');
INSERT INTO tItem (item,company,num,price,category) VALUES ('대추', '보은농원', 19, 15000, '식품');
INSERT INTO tItem (item,company,num,price,category) VALUES ('전자담배', 'TNG', 4, 70000, '성인');
INSERT INTO tItem (item,company,num,price,category) VALUES ('마우스', '논리텍', 3, 90000, '가전');

CREATE TABLE tOrder
(
  orderID INT IDENTITY PRIMARY KEY,		-- 주문 번호
  member VARCHAR(20) NOT NULL,   		-- 주문자
  item VARCHAR(20) NOT NULL,			-- 상품
  orderDate DATE DEFAULT GETDATE() NOT NULL,	-- 주문 날자
  num INT NOT NULL,				-- 개수
  status INT DEFAULT 1 NOT NULL,			-- 1:주문, 2:배송중, 3:배송완료, 4:반품
  remark VARCHAR(1000) NULL			-- 메모 사항
);

-- 주문 데이터
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('춘향','청바지','2019-12-3',3,2);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('향단','대추','2019-12-4',10,1);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('방자','전자담배','2019-12-2',4,1);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('향단','사과','2019-12-5',5,2);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('흥부','노트북','2019-12-5',2,1);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('방자','핸드폰','2019-11-1',1,3);

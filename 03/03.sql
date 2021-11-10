-- 모든 도서의 이름과 가격을 검색하시오.
SELECT bookname, price FROM Book;
-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.
SELECT bookname, price, bookid, publisher FROM Book;
-- 도서 테이블에 있는 모든 출판사를 검색하시오
SELECT publisher FROM Book;
-- 중복없이 출판사를 검색하시오
SELECT DISTINCT publisher FROM Book;
-- 가격이 20,000원 미만인 도서를 검색하시오.
SELECT * FROM Book WHERE price < 20000;
-- 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오
SELECT * FROM Book WHERE price >= 10000 AND price <= 20000;

-- 집합
-- WHERE 절에 두개 이상의 값을 비교하려면 IN 연산자와 NOT IN 연산자를 사용하면 편리하다.
-- 출판사가 '굿스포츠' 혹은 '대한미디어' 인 도서를 검색하시오
SELECT * FROM Book WHERE publisher IN('굿스포츠', '대한미디어');

-- 패턴
-- '축구의 역사'를 출간한 출판사를 검색하시오
SELECT bookname, publisher FROM Book WHERE bookname LIKE '축구의 역사';
-- 도서이름에 '축구'가 포함된 출판사를 검색하시오.
SELECT bookname FROM Book WHERE bookname LIKE '%축구%';
-- 도서이름의 왼쪽 두번째 위치에 '구' 라는 문자열을 갖는 도서를 검색하시오.
SELECT * FROM Book WHERE bookname LIKE '_구%';
-- 축구에 관한 도서중 가격이 20,000원 이상인 도서를 검색하시오.
SELECT * FROM Book WHERE bookname LIKE '%축구%' AND price >= 20000;

CREATE TABLE NewBook (
    bookid INTEGER,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INTEGER
);

ALTER TABLE NewBook ADD isbn VARCHAR(13);
ALTER TABLE NewBook MODIFY isbn INTEGER;
ALTER TABLE NewBook DROP COLUMN isbn;
ALTER TABLE NewBook MODIFY bookid INTEGER NOT NULL;
ALTER TABLE NewBook ADD PRIMARY KEY(bookid);

-- DROP은  테이블의 구조와 데이터를 모두 삭제한다. 데이터만 삭제하려면 DELETE를 사용해야한다.
DROP TABLE NewBook

INSERT INTO Book(bookid, bookname, publisher, price) VALUES (11, '스포츠 의학', '한솔의학서적', 90000);
INSERT INTO Book(bookid, bookname, publisher) VALUES (11, '스포츠 의학', '한솔의학서적');
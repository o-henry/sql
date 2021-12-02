SELECT bookname, price 
FROM Book;

SELECT price, bookname
FROM Book;

SELECT bookid, bookname, publisher, price
FROM Book;

SELECT * 
FROM Book;

SELECT publisher
FROM Book;

SELECT DISTINCT publisher
FROM Book;

SELECT *
FROM Book
WHERE price < 20000;

SELECT *
FROM Book
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM Book
WHERE price >= 10000 AND price <= 20000;

SELECT *
FROM Book
WHERE publisher IN('굿스포츠', '대한미디어');

SELECT bookname, publisher
FROM Book
WHERE bookname LIKE '축구의 역사';

SELECT bookname, publisher
FROM Book
WHERE bookname LIKE '%축구%';

SELECT *
FROM Book
WHERE bookname LIKE '%축구%' AND price >= 20000;

SELECT *
FROM Book
ORDER BY bookname;

SELECT * 
FROM Book
ORDER BY price, bookname;

SELECT *
FROM Book
ORDER BY price DESC, publisher ASC;

SELECT SUM(saleprice) AS 총매출
FROM Orders;

SELECT SUM(saleprice) AS 김연아_매출
FROM Orders
WHERE custid=2;

SELECT SUM(saleprice) AS Total, 
       AVG(saleprice) AS Average,
       MIN(saleprice) AS Minimum,
       MAX(saleprice) AS Maximum
FROM Orders;

SELECT COUNT(DISTINCT publisher) AS publisher
FROM Book;

-- GROUP BY를 통해 속성 값이 같은 값끼리 그룹을 만들 수 있다.
SELECT custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액
FROM Orders
GROUP BY custid;

SELECT custid, COUNT(*) AS 도서수량
FROM Orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2;

-- JOIN 은 한 테이블의 행을 다른 테이블의 행에 연결하여 두 개 이상의 테이블을 결합하는 연산이다.
-- 동등조인의 예다.
SELECT * 
FROM Customer, Orders
WHERE Customer.custid=Orders.custid
ORDER BY Customer.custid;

SELECT name, saleprice
FROM Customer, Orders
WHERE Customer.custid=Orders.custid;

SELECT name, SUM(saleprice) AS 총합
FROM Customer, Orders
WHERE Customer.custid=Orders.custid
GROUP BY Customer.name
ORDER BY Customer.name;

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Orders.bookid=Book.bookid AND Customer.custid=Orders.custid
ORDER BY Customer.name;

SELECT Customer.name, Book.bookname
FROM Customer, Book, Orders
WHERE Customer.custid=Orders.custid AND Book.price=20000 AND Book.bookid=Orders.bookid;

-- 부속질의

SELECT bookname
FROM Book
WHERE price=(SELECT MAX(price)
             FROM Book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
-- SELECT custid
-- FROM Orders

SELECT name
FROM Customer
WHERE custid IN (SELECT custid 
                 FROM Orders);

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT name
FROM Customer
WHERE custid IN(SELECT custid
              FROM Orders
              WHERE bookid IN(SELECT bookid
                              FROM Book
                              WHERE publisher='대한미디어'));

-- SELECT name
-- FROM Customer
-- WHERE custid

-- SELECT bookid
-- FROM Book
-- WHERE publisher='대한미디어'

-- SELECT name
-- FROM Customer
-- WHERE custid




SELECT b1.bookname
FROM Book b1
WHERE b1.price > (SELECT avg(b2.price)
                  FROM Book b2    
                  WHERE b2.publisher=b1.publisher);

SELECT name
FROM Customer
WHERE address LIKE '대한민국%'
UNION
SELECT name
FROM Customer
WHERE custid IN (SELECT custid FROM Orders);


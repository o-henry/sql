SELECT bookname
FROM Book
WHERE bookid=1;

SELECT bookname
FROM Book
WHERE price>=20000;

SELECT SUM(saleprice) AS 총액
FROM Orders
WHERE custid IN (SELECT custid 
                 FROM Customer
                 WHERE name='박지성');

SELECT COUNT(*)
FROM Orders
WHERE custid=(SELECT custid
              FROM Customer
              WHERE name="박지성");

-- SELECT count(*)
-- FROM orders
-- WHERE custid = 1;

SELECT COUNT(DISTINCT publisher) AS 출판사수
FROM Book
WHERE bookid IN (SELECT bookid 
                 FROM Orders
                 WHERE custid=(SELECT custid
                               FROM Customer        
                               WHERE name='박지성'));


-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
SELECT bookname AS 이름, price AS 가격, price-saleprice AS 할인율
FROM Book, Orders
WHERE Book.bookid=Orders.bookid AND custid=(SELECT custid 
                                            FROM Customer
                                            WHERE name='박지성');
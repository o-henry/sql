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
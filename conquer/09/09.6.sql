-- 춘향이가 구입한 상품의 가격을 조사하라
SELECT price FROM tItem WHERE item = (SELECT item FROM tOrder WHERE member = '춘향');
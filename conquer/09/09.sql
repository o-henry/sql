-- 7만원 짜리 상품을 구입한 사람의 나이를 구하세요
-- 상품에서 7만원인 아이템을 찾고 그 아이템을 구매한 사람을 찾아라
SELECT age FROM tMember WHERE member = (SELECT member FROM tOrder WHERE item = (SELECT item FROM tItem WHERE price = 70000));
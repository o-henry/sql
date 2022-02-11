-- 대추를 구입한 회원의 이름과 이 회원의 예치금을 구하라.

SELECT member, money FROM tMember WHERE member = (SELECT member FROM tOrder WHERE item = '대추');
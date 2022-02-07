SELECT name FROM tStaff WHERE score = (SELECT MAX(score) FROM tStaff);

-- answer p649
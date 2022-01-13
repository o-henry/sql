CREATE TABLE tCity 
(
    name CHAR(10) PRIMARY KEY, -- 고정 길이 문자열
    area INT NULL,
    popu INT NULL,
    metro CHAR(1) NOT NULL,
    region CHAR(6) NOT NULL
);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('ine', '1111', '아이네', 'ine@gmail.com', '01011111111', '둘기시 둘기동 11-1', '101동 101호', NOW(), '1234567890', '둘기농원', 0);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('jing', '2222', '징버거', 'jing@gmail.com', '01022222222', '버거시 버거동 22-2', '202동 202호', NOW(), '1234567890', '댕댕농원', 0);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('lilpa', '3333', '랄파', 'lilpa@gmail.com', '01033333333', '박쥐시 박쥐동 33-3', '303동 303호', NOW(), '1234567890', '박쥐농원', 0);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('jurr', '4444', '주르르', 'jurr@gmail.com', '01044444444', '주폭시 주폭동 44-4', '404동 404호', NOW(), '1234567890', '여우농원', 0);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('gosegu', '5555', '고세구', 'gosegu@gmail.com', '01055555555', '세균시 균냥동 55-5', '505동 505호', NOW(), '1234567890', '균냥농원', 0);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('vichan', '6666', '비찬', 'vichan@gmail.com', '01066666666', '라니시 라니동 66-6', '606동 606호', NOW(), '1234567890', '라니농원', 0);



SELECT * FROM seller;
SELECT * FROM seller WHERE PASSWORD = '1111';
SELECT userId FROM seller;
DELETE FROM seller WHERE id = 8;

DELETE FROM seller;
ALTER TABLE seller AUTO_INCREMENT = 1;
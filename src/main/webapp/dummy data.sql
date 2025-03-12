# 테이블 초기화 
DELETE FROM consumer;
ALTER TABLE consumer AUTO_INCREMENT = 1;
DELETE FROM seller;
ALTER TABLE seller AUTO_INCREMENT = 1;
DELETE FROM product;
ALTER TABLE product AUTO_INCREMENT = 1;

# 테이블 확인
SELECT * FROM consumer;
SELECT * FROM seller;
SELECT * FROM product;

# seller 더미 데이터
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('son', '5555', '손오공', 'son@gmail.com', '01055555555', '오공시 오공동 11-1', '505동 505호', NOW(), '1234567890', '오공농원', 0);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('sao', '6666', '사오정', 'sao@gmail.com', '01066666666', '오정시 오정동 22-2', '202동 202호', NOW(), '1234567890', '오정농원', 0);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('jupal', '7777', '저팔계', 'jupal@gmail.com', '01077777777', '팔계시 팔계동 33-3', '303동 303호', NOW(), '1234567890', '팔계농원', 0);
INSERT INTO seller (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate, bussinessNumber, farmName, STATUS)
VALUES ('samjang', '8888', '삼장법사', 'samjang@gmail.com', '01088888888', '삼장시 법사동 44-4', '404동 404호', NOW(), '1234567890', '극락농원', 0);

# consumer 더미 데이터
INSERT INTO consumer (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate)
VALUES ('gildong', '1111', '홍길동', 'gildong@gmail.com', '01011111111', '서울시 어딘가 11-1', '101동 101호', NOW());
INSERT INTO consumer (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate)
VALUES ('gilsan', '2222', '장길산', 'jilsan@gmail.com', '01022222222', '경기도 어딘가 22-2', '202동 202호', NOW());
INSERT INTO consumer (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate)
VALUES ('lim', '3333', '임꺽정', 'lim@gmail.com', '01033333333', '강원도 어딘가 33-3', '303동 303호', NOW());
INSERT INTO consumer (userId, PASSWORD, NAME, email, phone, address, detailAddress, createDate)
VALUES ('jimae', '4444', '일지매', 'jimae@gmail.com', '01044444444', '경상도 어딘가 44-4', '404동 404호', NOW());

# product 더미 데이터
INSERT INTO product (sellerId, categoryId, title, price, description, stock, mainImageUrl, createDate, farmName, STATUS) 
VALUES ('1', 0, '제주감귤 1kg', 12000, '맛있는 귤', 10, 'D:\\kyr\\Class\\project1\\workspace\\gyulDamGil\\src\\main\\webapp\\upload\\이미지1.jpg', NOW(),'오공농원', 0);
INSERT INTO product (sellerId, categoryId, title, price, description, stock, mainImageUrl, createDate,farmName, STATUS) 
VALUES ('1', 2, '한라봉 1kg', 20000, '맛있는 한라봉', 10, 'D:\\kyr\\Class\\project1\\workspace\\gyulDamGil\\src\main\\webapp\\upload\\이미지2.jpg', NOW(),'오공농원', 1);
INSERT INTO product (sellerId, categoryId, title, price, description, stock, mainImageUrl, createDate,farmName, STATUS) 
VALUES ('2', 4, '레드향 1kg', 10000, '맛있는 레드향', 10, 'D:\\kyr\\Class\\project1\\workspace\\gyulDamGil\\src\\main\\webapp\\upload\\이미지3.jpg', NOW(),'오정농원', 1);
INSERT INTO product (sellerId, categoryId, title, price, description, stock, mainImageUrl, createDate,farmName, STATUS) 
VALUES ('2', 3, '천혜향 1kg', 10000, '맛있는 천혜향', 10, 'D:\\kyr\\Class\\project1\\workspace\\gyulDamGil\\src\\main\\webapp\\upload\\이미지4.jpg', NOW(),'오정농원', 1);
INSERT INTO product (sellerId, categoryId, title, price, description, stock, mainImageUrl, createDate,farmName, STATUS) 
VALUES ('3', 1, '온주밀감 1kg', 10000, '맛있는 온주밀감', 10, 'D:\\kyr\\Class\\project1\\workspace\\gyulDamGil\\src\\main\\webapp\\upload\\이미지5.webp', NOW(), '팔계농원', 1);
INSERT INTO product (sellerId, categoryId, title, price, description, stock, mainImageUrl, createDate,farmName, STATUS) 
VALUES ('3', 5, '청견 1kg', 10000, '맛있는 청견', 10, 'D:\\kyr\\Class\\project1\\workspace\\gyulDamGil\\src\\main\\webapp\\upload\\이미지6.png', NOW(), '팔계농원', 0);
INSERT INTO product (sellerId, categoryId, title, price, description, stock, mainImageUrl, createDate,farmName, STATUS) 
VALUES ('4', 1, '온주밀감 1kg', 10000, '맛있는 온주밀감', 10, 'D:\\kyr\\Class\\project1\\workspace\\gyulDamGil\\src\\main\\webapp\\upload\\이미지7.jpg', NOW(), '극락농원', 1);
INSERT INTO product (sellerId, categoryId, title, price, description, stock, mainImageUrl, createDate,farmName, STATUS) 
VALUES ('4', 5, '청견 1kg', 10000, '맛있는 청견', 10, 'D:\\kyr\\Class\\project1\\workspace\\gyulDamGil\\src\\main\\webapp\\upload\\이미지8.jpg', NOW(),'극락농원', 0);

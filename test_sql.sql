/*1*/
-- 商品分類マスタ:categories

CREATE TABLE categories(
category_id INT PRIMARY KEY AUTO_INCREMENT -- 商品分類ID
,category_name VARCHAR(30) NOT NULL        -- 商品分類名
,created_at DATETIME NOT NULL               -- 登録日時
,updated_at DATETIME NOT NULL               -- 更新日時
);

-- 商品マスタ: products

DROP TABLE products;
CREATE TABLE products(
product_id INT PRIMARY KEY AUTO_INCREMENT  -- 商品ID 主キー
,product_name VARCHAR(50) NOT NULL        -- 商品名 外部キー
,category_id INT NOT NULL                  -- 商品分類ID
,price INT NOT NULL                        -- 価格
,stock INT NOT NULL                        -- 在庫
,sale_status VARCHAR(10) NOT NULL         -- 販売状況
,created_at DATETIME NOT NULL             -- 登録日時
,updated_at DATETIME NOT NULL             -- 更新日時
,FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 顧客マスタ: customers
CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT  -- 顧客ID 主キー
,customer_name VARCHAR(50) NOT NULL          -- 	顧客名
,prefecture VARCHAR(10) NOT NULL             -- 	都道府県
,phone VARCHAR(20)                            --   電話番号
,created_at DATETIME NOT NULL                 --   登録日時
,updated_at DATETIME NOT NULL                 -- 更新日時
);

-- 注文:orders
CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT  -- 注文ID 主キー
,customer_id INT NOT NULL                  -- 顧客ID 外部キー
,order_date DATE NOT NULL                  -- 注文日
,pickuo_date DATE NOT NULL                 -- 受取予定日
,order_status VARCHAR(10) NOT NULL         -- 注文状況
,created_at DATETIME NOT NULL              -- 登録日時
,updated_at DATETIME NOT NULL              -- 更新日時
,FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- 注文詳細:order_details
CREATE TABLE order_details(
order_id INT                    -- 注文ID 主キー 外部キー
,product_id INT                 -- 商品ID 主キー 外部キー
,quantity INT NOT NULL                      -- 数量
,unit_price INT NOT NULL                    -- 販売時価
,created_at DATETIME NOT NULL              -- 登録日時
,updated_at DATETIME NOT NULL              -- 更新日時
,PRIMARY KEY(order_id,product_id)
,FOREIGN KEY (order_id) REFERENCES orders(order_id)
,FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- 問題2
-- 商品分類マスタ
INSERT INTO categories(category_id,category_name,created_at,updated_at)
VALUES(1,'ホールケーキ','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (2,'カットケーキ','2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (3,'焼き菓子','2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (4,'季節限定','2026-10-06 00:00:00','2026-10-06 00:00:00');

-- 商品マスタ
INSERT INTO products(product_id,product_name,category_id,price,stock,sale_status,created_at,updated_at)
VALUES(101,'苺のデコレーション',1,3800,8,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (102,'チョコレートホール',1,3500,5,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (103,'フルーツタルト',1,4200,0,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (104,'苺のショートケーキ',2,520,15,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (105,'モンブラン',2,580,10,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (106,'ガトーショコラ',2,550,12,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (107,'チーズケーキ',2,500,6,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (108,'フィナンシェ',3,260,30,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (109,'マドレーヌ',3,240,25,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (110,'クッキー詰め合わせ',3,1200,9,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (111,'桃のタルト',4,650,0,'販売終了','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (112,'栗のロールケーキ',4,1800,4,'販売中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (113,'クリスマスケーキ',4,5000,0,'販売前','2026-10-06 00:00:00','2026-10-06 00:00:00')
;
/*UPDATE products
SET sale_status = '販売前'
WHERE product_id = 113;*/

-- 顧客マスタ
INSERT INTO customers(customer_id,customer_name,prefecture,phone,created_at,updated_at)
VALUES(1,'山田花子','福岡県','090-1111-1111','2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (2,'田中太郎','福岡県','090-2222-2222','2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (3,'佐藤美咲','佐賀県','090-3333-3333','2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (4,'鈴木健一','熊本県',null,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (5,'高橋恵','福岡県','090-5555-5555','2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (6,'伊藤翼','大分県','090-6666-6666','2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (7,'中村葵','福岡県','090-7777-7777','2026-10-06 00:00:00','2026-10-06 00:00:00')
,       (8,'小林誠','長崎県',null,'2026-10-06 00:00:00','2026-10-06 00:00:00');

-- 注文
INSERT INTO orders(order_id,customer_id,order_date,pickuo_date,order_status,created_at,updated_at)
VALUES(1001,1,'2026-08-01','2026-08-03','受取済','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1002,2,'2026-08-02','2026-08-02','受取済','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1003,1,'2026-08-10','2026-08-12','受取済','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1004,3,'2026-08-15','2026-08-16','受取済','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1005,5,'2026-08-20','2026-08-22','キャンセル','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1006,4,'2026-09-01','2026-09-03','予約中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1007,2,'2026-09-02','2026-09-02','受取済','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1008,7,'2026-09-05','2026-09-07','予約中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1009,5,'2026-09-08','2026-09-09','受取済','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1010,1,'2026-09-10','2026-09-12','予約中','2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1011,6,'2026-09-11','2026-09-11','受取済','2026-10-06 00:00:00','2026-10-06 00:00:00');

-- 注文詳細
INSERT INTO order_details(order_id,product_id,quantity,unit_price,created_at,updated_at
)
VALUES(1001,101,1,3800,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1001,108,4,260,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1002,104,2,520,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1002,105,1,580,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1003,109,5,240,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1003,110,1,1200,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1004,102,1,3500,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1004,106,2,550,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1005,103,1,4200,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1006,108,3,260,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1006,112,1,1800,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1007,105,2,580,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1007,107,2,500,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1008,101,1,3800,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1008,104,4,520,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1009,106,3,550,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1009,108,2,260,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1010,102,1,3500,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1010,110,2,1200,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1011,104,2,520,'2026-10-06 00:00:00','2026-10-06 00:00:00')
,      (1011,109,3,240,'2026-10-06 00:00:00','2026-10-06 00:00:00');


-- 問題3  productsテーブル全ての列、全ての行を表示してください

SELECT product_id,product_name ,category_id,price,stock,sale_status,created_at,updated_at
FROM products;
/* select* from products */

-- 問題4

SELECT product_name,price
FROM products;

-- 問題5

SELECT product_ID,product_name,price
FROM products
WHERE price >= 1000;

-- 問題6

SELECT product_name,price
FROM products
ORDER BY price DESC,product_id ASC;

-- 問題7
 INSERT INTO customers(customer_name,prefecture,phone,created_at,updated_at)
 VALUES ('松本彩','福岡県','090-9999-9999',NOW(),NOW());
 
 
 -- 問題8
 SELECT product_name,price,stock
 FROM products
 WHERE sale_status ='販売中' AND stock >= 10;

-- 問題9
SELECT product_id,product_name
FROM products
WHERE product_name LIKE '%ケーキ%';

-- 問題10
UPDATE products
SET stock = stock+20
,updated_at ='2026-10-06 00:00:00'
WHERE product_id = 108;

-- 問題11
DELETE 
FROM customers
WHERE customer_id = 8;

-- 問題12
SELECT category_id, COUNT(*) AS product_count,AVG(price) AS average_price
FROM products
GROUP BY category_id;

-- 問題13

SELECT A.product_name,B.category_name,A.price
FROM products AS A
JOIN categories AS B
ON A.category_id = B.category_id 
ORDER BY price DESC;

-- 問題14
SELECT A.order_id,A.order_date,B.customer_name,A.order_status
FROM orders AS A
JOIN customers AS B
ON A.customer_ID = B.customer_ID
ORDER BY A.order_date DESC;

-- 問題15

SELECT A.order_id,B.product_name,A.quantity,A.unit_price,A.unit_price * A.quantity AS detail_amount
FROM order_details AS A
JOIN products AS B
ON A.product_id = B.product_id
ORDER BY  A.order_id ASC,A.product_id ASC;

-- 問題16

SELECT A.order_id,SUM(A.quantity * A.unit_price) AS order_total
FROM order_details AS A
JOIN orders AS B
ON A.order_id = B.order_id
WHERE order_status = '受取済'
OR order_status = '予約中'
GROUP BY A.order_id
ORDER BY order_total DESC;

-- 問題17
SELECT product_name,price
FROM products
WHERE price >= (SELECT AVG(price)
FROM products)
ORDER BY price DESC;

-- 問題18
SELECT B.product_id, B.product_name
FROM products AS B
LEFT JOIN order_details AS A
ON B.product_id = A.product_id
WHERE A.product_id IS NULL;

-- 問題19
SELECT A.customer_id,A.customer_name,COUNT(DISTINCT B.order_id) AS order_count,SUM(C.quantity * C.unit_price) AS purchase_total
FROM customers AS A
JOIN orders AS B
ON A.customer_id = B.customer_id
JOIN order_details AS C
ON B.order_id = C.order_id
WHERE order_status = '受取済'
OR order_status = '予約中'
GROUP BY A.customer_id, A.customer_name
HAVING SUM(C.quantity * C.unit_price) >= 3000
ORDER BY purchase_total DESC;

-- 問題20
SELECT B.category_name, A.product_name, A.price
FROM products AS A
JOIN categories AS B
ON A.category_id = B.category_id
WHERE A.price = (SELECT MAX(C.price)FROM products AS C
WHERE C.category_id = A.category_id
)ORDER BY A.category_id ASC, A.product_id ASC;

-- 問題21

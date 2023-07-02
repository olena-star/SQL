
use market;

CREATE TABLE  customer (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(20),
    lastname VARCHAR(20),
    gender char(1) check(gender in ('f', 'm')),
    age integer
);
CREATE TABLE products1 (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    title varchar(128),
    price numeric(8, 2)
);

CREATE TABLE orders2 (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    customerid integer,
    productid integer,
    ordertype varchar(128),
    product_count integer
);


CREATE TABLE orders3 (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    customerid integer,
    productid integer,
    ordertype varchar(128),
    product_count integer
);


INSERT INTO orders3 (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 3);
INSERT INTO orders3 (customerid, productid, ordertype, product_count) VALUES (1, 2, 'online', 5);
INSERT INTO orders3 (customerid, productid, ordertype, product_count) VALUES (3, 1, 'direct', 2);
INSERT INTO orders3 (customerid, productid, ordertype, product_count) VALUES (3, 4, 'direct', 6);
INSERT INTO orders3 (customerid, productid, ordertype, product_count) VALUES (3, 3, 'direct', 3);
INSERT INTO orders3 (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 4);
INSERT INTO orders3 (customerid, productid, ordertype, product_count) VALUES (5, 7, 'online', 2);
INSERT INTO orders3 (customerid, productid, ordertype, product_count) VALUES (5, 9, 'online', 7);
INSERT INTO orders2 (customerid, productid, ordertype, product_count) VALUES (6, 5, 'direct', 4);


INSERT INTO customer (name, lastname, age, gender) VALUES ('Гайк', 'Инанц', 29, 'm');
INSERT INTO customer (name, lastname, age, gender) VALUES ('Максим', 'Грибов', 32, 'm');
INSERT INTO customer (name, lastname, age, gender) VALUES ('Антон', 'Куликов', 27, 'm');
INSERT INTO customer (name, lastname, age, gender) VALUES ('Юрий', 'Митрофанов', 30, 'm');
INSERT INTO customer (name, lastname, age, gender) VALUES ('Нелли', 'Ефремян', 25, 'f');
INSERT INTO customer (name, lastname, age, gender) VALUES ('Ольга', 'Степанова', 35, 'f');


INSERT INTO products1 (title, price) VALUES ('молоко', 70);
INSERT INTO products1(title, price) VALUES ('колбаса', 230);
INSERT INTO products1 (title, price) VALUES ('хлопья', 150);
INSERT INTO products1 (title, price) VALUES ('хлеб', 30);
INSERT INTO products1 (title, price) VALUES ('масло', 120);
INSERT INTO products1 (title, price) VALUES ('чипсики', 60);
INSERT INTO products1 (title, price) VALUES ('шоколад', 70);
INSERT INTO products1 (title, price) VALUES ('кетчуп', 150);
INSERT INTO products1 (title, price) VALUES ('яблоко', 70);

-- 1) найдите имя и фамилию пользователей, у которых нет заказов
SELECT name, lastname
FROM customers
WHERE id NOT IN (SELECT DISTINCT customerid FROM orders);


-- 2) найдите название товаров, которые ни разу не заказывали
SELECT title
FROM products
WHERE id NOT IN (SELECT DISTINCT productid FROM orders);

-- 3) найдите название товаров, которые ни разу не заказывали онлайн

SELECT title
FROM products
WHERE id NOT IN (SELECT DISTINCT productid FROM orders WHERE ordertype = 'online');

SELECT c.name, c.lastname
FROM customers c
INNER JOIN orders o ON c.id = o.customerid
WHERE o.product_count= (
    SELECT MAX(product_count * price) 
    FROM orders 
    INNER JOIN products p ON orders.productid = p.id
);

-- 4) c этой таблици найдите имя и фамилию покупателя, который сделал самый дорогой заказ

SELECT t1.name, t1.lastname
FROM customers t1
INNER JOIN orders t2 ON t1.id = t2.customerid
INNER JOIN products t3 ON t2.productid = t3.id
WHERE t2.product_count * t3.price = (
    SELECT MAX(product_count * price) 
    FROM orders
    INNER JOIN products ON orders.productid = products.id
);
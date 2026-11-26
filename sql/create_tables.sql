CREATE TABLE users (
    id INT UNSIGNED PRIMARY KEY,
    created_at DATETIME,
    user_type VARCHAR(50),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    age INT UNSIGNED,
    birth DATE,
    gender VARCHAR(10),
    address VARCHAR(255),
    traffic_source VARCHAR(100)
);

CREATE TABLE products (
    id VARCHAR(255) PRIMARY KEY,
    category VARCHAR(100),
    sub_category VARCHAR(100),
    name VARCHAR(255),
    brand VARCHAR(100),
    cost INT UNSIGNED,
    retail_price INT UNSIGNED,
    department VARCHAR(100)
);

CREATE TABLE promotions (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    promotion_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    discount_rate DOUBLE,
    minimum_sale_price INT UNSIGNED,
    maximum_discount_price INT UNSIGNED
);

CREATE TABLE events (
    id INT UNSIGNED PRIMARY KEY,
    user_id INT UNSIGNED,
    session_id VARCHAR(255),
    sequence INT UNSIGNED,
    event_type VARCHAR(100),
    created_at DATETIME,
    device VARCHAR(100),
    browser VARCHAR(100),
    traffic_source VARCHAR(100),
    ip_address VARCHAR(45),
	address VARCHAR(255),
    uri VARCHAR(2083),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
            
CREATE TABLE orders (
	id VARCHAR(255) PRIMARY KEY,
    user_id INT UNSIGNED,
    status VARCHAR(50),
    gender VARCHAR(10),
    created_at DATETIME,
    withdrawn_at DATETIME,
    shipped_at DATETIME,
    delivered_at DATETIME,
    returned_at DATETIME,
    num_of_items INT UNSIGNED,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id VARCHAR(255) PRIMARY KEY,
    order_id VARCHAR(255),
    user_id INT UNSIGNED,
    product_id VARCHAR(255),
    status VARCHAR(50),
    created_at DATETIME,
    withdrawn_at DATETIME,
    shipped_at DATETIME,
    delivered_at DATETIME,
    returned_at DATETIME,
    promotion_id INT,
    promotion_name VARCHAR(50),
    discount_rate DOUBLE,
    retail_price INT UNSIGNED,
    num_of_items INT UNSIGNED,
    sale_price INT UNSIGNED,
    created_from_event_id INT UNSIGNED,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (promotion_id) REFERENCES promotions(id),
    FOREIGN KEY (created_from_event_id) REFERENCES events(id)
);

SHOW TABLES FROM ecommerce;

-- 1) 자식부터
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS events;
-- 2) 그 다음 나머지 부모
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS promotions;
DROP TABLE IF EXISTS users;

commit;
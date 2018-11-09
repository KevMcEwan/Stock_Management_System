DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS manufacturers;

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  quantity INT4,
  supply_cost FLOAT,
  customer_price FLOAT,
  product_type VARCHAR(255),
  desired_quantity INT4
);

CREATE TABLE manufacturers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  supplies_type VARCHAR(255)
);

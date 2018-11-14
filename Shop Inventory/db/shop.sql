DROP TABLE IF EXISTS stock_supply;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS wholesalers;

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  quantity FLOAT,
  customer_price FLOAT,
  product_type VARCHAR(255),
  desired_quantity FLOAT
);

CREATE TABLE wholesalers (
  id SERIAL8 PRIMARY KEY,
  wholesaler_name VARCHAR(255),
  contact_name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE stock_supply (
  id SERIAL8 PRIMARY KEY,
  product_id INT4 REFERENCES products(id) ON DELETE CASCADE,
  wholesaler_id INT4 REFERENCES wholesalers(id) ON DELETE CASCADE,
  supply_price FLOAT
);

-- Primary Keys cannot be duplicated


CREATE TABLE  customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

CREATE TABLE brand(
	seller_id SERIAL PRIMARY KEY,
	brand_name VARCHAR(150),
	contact_number VARCHAR(15),
	adress VARCHAR(150)
);

CREATE TABLE inventory(
	upc SERIAL PRIMARY KEY,
	product_amount INTEGER
);

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	sub_total NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	upc INTEGER NOT NULL,
	FOREIGN KEY(upc) REFERENCES inventory(upc)
);

CREATE TABLE product(
	item_id SERIAL PRIMARY KEY,
	amount NUMERIC(5, 2),
	product_name VARCHAR(100),
	seller_id INTEGER NOT NULL,
	upc INTEGER NOT NULL,
	FOREIGN KEY(seller_id) REFERENCES brand(seller_id),
	FOREIGN KEY(upc) REFERENCES inventory(upc)
);

CREATE TABLE cart(
	cart_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(customer_id) REFERENCES orders(order_id)
);
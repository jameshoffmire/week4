CREATE TABLE  customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);


CREATE TABLE screen(
	screen_number SERIAL PRIMARY KEY,
	seats SMALLINT
);

CREATE TABLE concession(
	concession_id SERIAL PRIMARY KEY,
	concession_name VARCHAR(20),
	price MONEY,
	quantity INTEGER
);

CREATE TABLE film(
	film_id SERIAL PRIMARY KEY,
	film_title VARCHAR(100),
	duration INTERVAL,
	rating VARCHAR(10),
	genre VARCHAR(20)
);

CREATE TABLE screening_schedule(
	screening_id SERIAL PRIMARY KEY,
	film_id INTEGER NOT NULL,
	screen_number INTEGER NOT NULL,
	start_time TIMESTAMP,
	tickets_sold INTEGER,
	sold_out BOOLEAN,
	price MONEY,
	FOREIGN KEY(screen_number) REFERENCES screen(screen_number),
	FOREIGN KEY(film_id) REFERENCES film(film_id)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	screen_number INTEGER NOT NULL,
	screening_id INTEGER NOT NULL,
	film_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(screen_number) REFERENCES screen(screen_number),
	FOREIGN KEY(screening_id) REFERENCES screening_schedule(screening_id),
	FOREIGN KEY(film_id) REFERENCES film(film_id)
);

INSERT INTO customer
VALUES(
	1,
	'James',
	'Hoffmire',
	'123 4th st',
	'345453543'
);

INSERT INTO concession
VALUES(
	1,
	'popcorn',
	5,
	100
);

INSERT INTO screen
VALUES(
	1,
	100
);
	
INSERT INTO film
VALUES(
	1,
	'Dune',
	'02:30:00',
	'PG-13',
	'Sci-fi'
);

INSERT INTO screening_schedule
VALUES(
	1,
	1,
	1,
	'2017-08-15 21:05:15.723336+07',
	100,
	'1',
	10
);

INSERT INTO ticket
VALUES(
	1,
	1,
	1,
	1,
	1
);

SELECT * FROM screen;
SELECT * FROM customer;
SELECT * FROM concession;
SELECT * FROM film;
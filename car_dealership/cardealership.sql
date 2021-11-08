CREATE TABLE employee(
	"employee_id" SERIAL PRIMARY KEY,
	"employee_type" VARCHAR(20),
	"first_name" VARCHAR(20),
	"last_name" VARCHAR(20)
);

CREATE TABLE customer(
	"customer_id" SERIAL PRIMARY KEY,
	"first_name" VARCHAR(50),
	"last_name" VARCHAR(50),
	"address" VARCHAR(50),
	"billing_info" VARCHAR(50)
);

CREATE TABLE car (
	"car_id" SERIAL PRIMARY KEY,
	"salesman_id" INT,
	"owner_id" INT,
	"model" VARCHAR(20),
	"make" VARCHAR(20),
	"year" INT,
	"color" VARCHAR(20),
	"MSRP" money,
	FOREIGN KEY (salesman_id) REFERENCES employee(employee_id),
	FOREIGN KEY (owner_id) REFERENCES customer(customer_id)
);

CREATE TABLE invoice(
	"invoice_id" SERIAL PRIMARY KEY,
	"salesman_id" INT,
	"car_id" INT,
	"owner_id" SERIAL ,
	FOREIGN KEY (salesman_id) REFERENCES employee(employee_id),
	FOREIGN KEY (owner_id) REFERENCES customer(customer_id),
	FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE service_ticket(
	"ticket_id" SERIAL PRIMARY KEY,
	"car_id" INT,
	"customer_id" INT,
	"price" MONEY,
	"needs_parts" BOOLEAN,
	FOREIGN KEY (car_id) REFERENCES car (car_id),
	FOREIGN KEY (customer_id) REFERENCES  customer (customer_id)
);

CREATE TABLE service_labor_log(
	"labor_id" SERIAL PRIMARY KEY,
	"ticket_id" INT,
	"mechanic_id" INT,
	FOREIGN KEY (ticket_id) REFERENCES service_ticket(ticket_id),
	FOREIGN KEY (mechanic_id) REFERENCES employee(employee_id)
);


CREATE FUNCTION InsertCar(_car_id integer, _salesman_id integer, _owner_id integer, _model VARCHAR(20), _make VARCHAR(20), _year integer, _color VARCHAR(20), MSRP money)
  RETURNS void AS
  $BODY$
      BEGIN
        INSERT INTO car(car_id, salesman_id, owner_id, model, make, year, MSRP)
        VALUES(_car_id, _salesman_id, _owner_id, _model, _make, _year, _MSRP);
      END;
  $BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
  
CREATE PROCEDURE InsertEmployee(_employee_id integer, _employee_type varchar(20), _first_name varchar(20), _last_name varchar(20))
	LANGUAGE SQL
	AS $BODY$
    	INSERT INTO employee(employee_id, employee_type, first_name, last_name)
    	VALUES(_employee_id, _employee_type, _first_name, _last_name);   
	$BODY$;
	
SELECT * FROM InsertCar(1,1,1,'Camry','Toyota',1992,'Blue', 20000);
	

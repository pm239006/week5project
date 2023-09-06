CREATE TABLE Mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE Parts (
  parts_id SERIAL PRIMARY KEY,
  part VARCHAR(50)
);
CREATE TABLE Services(
  service_id SERIAL PRIMARY KEY,
  description VARCHAR(200),
  price NUMERIC(10,2),
  customer_id INTEGER,
  VIN VARCHAR(25)
);

CREATE TABLE Car (
  car_id SERIAL PRIMARY KEY,
  car_model VARCHAR(50),
  car_make VARCHAR(50),
  year_ VARCHAR(20),
	VIN VARCHAR(25),
  price NUMERIC(10,2)
);

ALTER TABLE car ADD CONSTRAINT VIN_unique UNIQUE (VIN);
ALTER TABLE car ADD COLUMN is_serviced BOOLEAN;

SELECT *
FROM car 


CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(50)
);

CREATE TABLE Salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)

);

CREATE TABLE Service_Mechanic (
  mechanic_id INTEGER,
  service_id INTEGER,
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (mechanic_id) REFERENCES Mechanic(mechanic_id)
);

CREATE TABLE Invoice_Info (
  invoice_id SERIAL PRIMARY KEY,
  salesperson_id INTEGER,
  car_id INTEGER,
  total NUMERIC(10,2),
  customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id)
);

CREATE TABLE Service_Parts (
  service_id INTEGER,
  parts_id INTEGER,
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);




--------------------------- FUNCTIONS ------------------------------------------------
DROP FUNCTION add_customer(integer,character varying,character varying,character varying,character varying) 

CREATE OR REPLACE FUNCTION add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_email VARCHAR,
	_phone_number VARCHAR
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO customer
	VALUES(_customer_id, _first_name, _last_name, _email, _phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT *
FROM customer

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_customer(1, 'Luis', 'Lara', 'luis1@gmail.com', '7775452233')
SELECT add_customer(2, 'Jada', 'Wood', 'jumper12@gmail.com', '6172334400')
SELECT add_customer(3, 'Minnie', 'Mouse', 'hotdog@gmail.com', '6171117721')
SELECT add_customer(4, 'Jada', 'Wood', 'jumper12@gmail.com', '8575007000')


DROP FUNCTION add_car(integer,character varying,character varying,character varying,character varying,numeric)

CREATE OR REPLACE FUNCTION add_car(
		car_id INTEGER,
	  car_model VARCHAR,
	  car_make VARCHAR,
	  year_ VARCHAR,
		VIN VARCHAR,
	  price NUMERIC)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO car
	VALUES(car_id, car_model, car_make, year_, VIN, price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT *
FROM car


-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_car(500, 'Jeep', 'Compass', '2023','FR987654321','400000')
SELECT add_car(501, 'Jeep', 'Cherokee', '2024', 'PL677645592','60955')
SELECT add_car(502, 'Toyoya', 'Corolla', '2022', 'TW749000274','26795')
SELECT add_car(503, 'Mercedes', 'AMG GLC43', '2022', 'GW8277390028','59900')


CREATE OR REPLACE FUNCTION add_mechanic(
	mechanic_id INTEGER,
  	first_name VARCHAR,
  	last_name VARCHAR
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO mechanic
	VALUES(mechanic_id, first_name, last_name);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT *
FROM mechanic

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_mechanic(1, 'Tom', 'Perez')
SELECT add_mechanic(2, 'Bob', 'Kelly')
SELECT add_mechanic(3, 'Carlos', 'Ramirez')
SELECT add_mechanic(4, 'Henry', 'White')


DROP FUNCTION add_service(integer,character varying,numeric,integer,character varying)


CREATE OR REPLACE FUNCTION add_service(
	  service_id INTEGER,
	  description VARCHAR,
	  price NUMERIC,
	  customer_id INTEGER,
	  VIN VARCHAR
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO services
	VALUES(service_id, description, price, customer_id, VIN);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT *
FROM services 

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_service(66,'Synthetic or conventional oil change',000000007995,1,'FR987654321')
SELECT add_service(67, 'Brakes and Rotors', 000000040000, 5, 'PF736409836')
SELECT add_service(68, 'Tire rotation', 000000013000,3,'DE340209123')
SELECT add_service(69, 'Detail', 000000045000, 2, 'PL677645592' )


CREATE OR REPLACE FUNCTION add_parts(
	   parts_id INTEGER,
  		part VARCHAR
	)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO parts
	VALUES(parts_id, part);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT *
FROM parts 

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_parts(6000, 'Rotors')
SELECT add_parts(7000, 'Brakes')
SELECT add_parts(8000, 'Spray and Cloths')
SELECT add_parts(9000, 'Synthetic Oil')
SELECT add_parts(10000, 'Conventional Oil')
SELECT add_parts(11000, 'Air Fresheners')






CREATE OR REPLACE FUNCTION add_salesperson(
	salesperson_id INTEGER,
  	first_name VARCHAR,
  	last_name VARCHAR
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO salesperson
	VALUES(salesperson_id, first_name, last_name);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT *
FROM salesperson

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_salesperson(44, 'Jenny', 'Martinez')
SELECT add_salesperson(45, 'Romeo', 'Santos')
SELECT add_salesperson(46, 'Anthony','Mora')
SELECT add_salesperson(47, 'Bulin', 'Teteo')
SELECT add_salesperson(48, 'El Alfa', 'Dembow')




	
CREATE OR REPLACE FUNCTION add_invoice(
	 invoice_id INTEGER,
	  _salesperson_id INTEGER,
	  car_id INTEGER,
	  total NUMERIC,
	  customer_id INTEGER
)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO invoice_info
	VALUES(invoice_id,_salesperson_id,car_id,total,customer_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT *
FROM invoice_info

-- DO NOT CALL A FUNCTION
-- SELECT A FUNCTION
SELECT add_invoice(200, 44, '500',60000,'4' )
SELECT add_invoice(201, 45, '501',100000,'4' )
SELECT add_invoice(202, 46, '502',5000,'4' )
SELECT add_invoice(203, 47, '503',8000,'4' )



CREATE OR REPLACE PROCEDURE car_serviced(is_serviced BOOLEAN, _car_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
		UPDATE car
		SET is_serviced = true
		WHERE car_id = _car_id
COMMIT;
END
$$
;

CALL car_serviced()

SELECT *
FROM car





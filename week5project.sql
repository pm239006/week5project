CREATE OR REPLACE PROCEDURE car_serviced(is_serviced BOOLEAN, _car_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
		UPDATE car
		SET is_serviced = TRUE
		WHERE _car_id = car_id;
		
		COMMIT;
END
$$;

CALL car_serviced(TRUE,502)

SELECT *
FROM car

DROP PROCEDURE car_not_serviced(boolean,integer)

CREATE OR REPLACE PROCEDURE car_not_serviced(is_serviced BOOLEAN, _car_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
		UPDATE car
		SET is_serviced = FALSE
		WHERE _car_id = car_id;
		
		COMMIT;
END
$$;

CALL car_not_serviced(FALSE,500)
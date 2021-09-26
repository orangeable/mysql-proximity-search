SET @zip_code = '80521';
SET @radius = 25;

SELECT	zip_code,
		(
		ST_Distance_Sphere(
			POINT(
				(SELECT longitude FROM zip_codes WHERE zip_code = @zip_code),
                (SELECT latitude FROM zip_codes WHERE zip_code = @zip_code)
			),
            POINT (longitude, latitude)
		) / 5280) AS distance
FROM	zip_codes
HAVING DISTANCE <= @radius
ORDER BY distance;

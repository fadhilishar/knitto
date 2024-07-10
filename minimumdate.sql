-- Langkah 1: Membuat fungsi (jika belum dibuat)
DROP FUNCTION IF EXISTS get_min_date;
DELIMITER //

CREATE FUNCTION get_min_date(dates TEXT)
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE min_date DATE;
    DECLARE curr_date DATE;
    DECLARE date_list TEXT;
    DECLARE comma_pos INT;
    DECLARE first_iteration BOOLEAN;

    SET date_list = CONCAT(dates, ',');
    SET first_iteration = TRUE;

    WHILE LOCATE(',', date_list) > 0 DO
        SET comma_pos = LOCATE(',', date_list);
        SET curr_date = SUBSTRING(date_list, 1, comma_pos - 1);
        SET date_list = SUBSTRING(date_list, comma_pos + 1);

        IF first_iteration THEN
            SET min_date = curr_date;
            SET first_iteration = FALSE;
        ELSEIF curr_date < min_date THEN
            SET min_date = curr_date;
        END IF;
    END WHILE;

    RETURN min_date;
END //

DELIMITER ;

-- Langkah 2: Memanggil fungsi untuk mendapatkan tanggal terkecil
SELECT get_min_date('2016-04-22, 2016-07-20, 2015-03-29, 2023-07-03') AS min_date;
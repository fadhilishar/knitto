DELIMITER //

CREATE PROCEDURE extract_kurs_pajak()
BEGIN
    DECLARE exit_flag BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET exit_flag = TRUE;
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Cek apakah tabel kurs_pajak sudah ada isinya
    IF (SELECT COUNT(*) FROM kurs_pajak) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tabel kurs_pajak sudah berisi data. Proses dihentikan.';
    ELSE
        -- Buat tabel kurs_pajak jika belum ada
        CREATE TABLE IF NOT EXISTS kurs_pajak (
            id_ksm_kurs_pajak INT,
            kurs_rate DECIMAL(20,4),
            tgl DATE,
            curr_id INT
        );

        -- Insert data dari ksm_kurs_pajak ke kurs_pajak
        INSERT INTO kurs_pajak (id_ksm_kurs_pajak, kurs_rate, tgl, curr_id)
        SELECT 
            id,
            kurs_rate,
            date_add(start_date, INTERVAL t.n DAY) as tgl,
            curr_id
        FROM 
            ksm_kurs_pajak
        CROSS JOIN 
            (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 
             UNION SELECT 4 UNION SELECT 5 UNION SELECT 6) t
        WHERE 
            date_add(start_date, INTERVAL t.n DAY) <= end_date
        ORDER BY 
            id, tgl;
    END IF;

    IF exit_flag THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Terjadi kesalahan. Transaksi di-rollback.';
    ELSE
        COMMIT;
    END IF;
END //

DELIMITER ;
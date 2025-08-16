DELIMITER //

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_sub_id INT;
    DECLARE cur CURSOR FOR SELECT DISTINCT SubscriberID FROM WatchHistory;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    report_loop: LOOP
        FETCH cur INTO current_sub_id;
        IF done THEN
            LEAVE report_loop;
        END IF;
        SELECT CONCAT('--- Report for Subscriber ID: ', current_sub_id, ' ---');
        CALL GetWatchHistoryBySubscriber(current_sub_id);
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

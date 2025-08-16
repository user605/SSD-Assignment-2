DELIMITER //

CREATE PROCEDURE PrintAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE sub_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT SubscriberID, SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sub_id, sub_name;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF EXISTS (SELECT 1 FROM WatchHistory WHERE SubscriberID = sub_id) THEN
            SELECT CONCAT('--- Watch History for ', sub_name, ' (ID: ', sub_id, ') ---');
            CALL GetWatchHistoryBySubscriber(sub_id);
        ELSE
            SELECT CONCAT(sub_name, ' (ID: ', sub_id, ') has no watch history.');
        END IF;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

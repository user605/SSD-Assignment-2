DELIMITER //

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT
        S.Title,
        WH.WatchTime
    FROM
        WatchHistory AS WH
    JOIN
        Shows AS S ON WH.ShowID = S.ShowID
    WHERE
        WH.SubscriberID = sub_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE subscriber_count INT;

    SELECT COUNT(*) INTO subscriber_count FROM Subscribers WHERE SubscriberName = subName;

    IF subscriber_count = 0 THEN
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES ((SELECT IFNULL(MAX(SubscriberID), 0) + 1 FROM Subscribers), subName, CURDATE());
        SELECT CONCAT('Subscriber ', subName, ' added successfully.') AS Message;
    ELSE
        SELECT CONCAT('Subscriber ', subName, ' already exists.') AS Message;
    END IF;
END //

DELIMITER ;

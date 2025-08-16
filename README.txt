Lab 2: SQL - Stored Procedures and Cursors

Submission for CS6.302 Software System Development

Steps to Execute the Scripts:

    Open MySQL Workbench: Ensure you have MySQL Workbench installed and connected to a local MySQL server instance.

    Create Database: Create a new database named lab2_db to store the tables and procedures.

    Load Data: Run the provided table creation and insertion statements and execute the script. This will create the Shows, Subscribers, and WatchHistory tables and populate them with sample data as specified in the lab activity.

    Execute Stored Procedures: Open each of the provided .sql files (q1.sql, q2.sql, q3.sql, q4.sql, q5.sql) in MySQL Workbench. Execute the code for each file one by one to create the corresponding stored procedures.

    Test Procedures: To test the procedures, use the CALL statement. For example:

        CALL ListAllSubscribers();

        CALL GetWatchHistoryBySubscriber(1);

        CALL AddSubscriberIfNotExists('Test User');

        CALL SendWatchTimeReport();

        CALL PrintAllSubscribersWatchHistory();

Git Repository Link:

https://github.com/user605/SSD-Assignment-2

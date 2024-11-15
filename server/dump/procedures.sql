CREATE DATABASE  IF NOT EXISTS `nodejs_login` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nodejs_login`;

DELIMITER //

CREATE PROCEDURE getUserTests(IN user_Id INT)
BEGIN
    SELECT * FROM tests WHERE userId = user_Id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE createTest(
    IN p_name varchar(100),
    IN p_userId int(11),
    IN p_createdOn date,
    IN p_finishedOn date,
    IN p_score int(11),
    IN p_questions varchar(100),
    IN p_chapters varchar(100),
    IN p_time int(11),
    IN p_difficulty int(11)
)
BEGIN
    INSERT INTO tests (name,userId,createdOn,finishedOn,score,questions,chapters,time,difficulty) VALUES (p_name,p_userId,p_createdOn,p_finishedOn,p_score,p_questions,p_chapters,p_time,p_difficulty);
END //

DELIMITER ;
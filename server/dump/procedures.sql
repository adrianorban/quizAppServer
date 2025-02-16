CREATE DATABASE  IF NOT EXISTS `nodejs_login` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nodejs_login`;

DELIMITER //

CREATE PROCEDURE getUserTests(IN user_Id INT)
BEGIN
    SELECT * FROM tests WHERE userId = user_Id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE getTestQuestions(IN test_Id INT)
BEGIN
    -- Select * from tqLink INNER JOIN questions ON tqLink.questionId = questions.id where tqLink.testId=test_Id;
    SELECT tqLink.id, question, questions.id AS questionId, explanation, tqLink.answers,
    GROUP_CONCAT(answers.answer  separator '# ') answer, 
    GROUP_CONCAT(answers.correctAnswer  separator '# ') correctAnswer,
    GROUP_CONCAT(answers.id  separator '# ') answersIds 
    FROM tqLink 
    JOIN questions ON questions.id=tqLink.questionId 
    JOIN answers ON questions.id=answers.questionId
    WHERE tqLink.testId=test_Id
    GROUP BY tqLink.id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE createTest(
    IN p_name varchar(100),
    IN p_userId int(100),
    IN p_createdOn date,
    IN p_finishedOn date,
    IN p_score int(11),
    IN p_questions int(11),
    IN p_chapters varchar(100),
    IN p_time int(11),
    IN p_difficulty int(11)
)
BEGIN
    INSERT INTO tests (name,userId,createdOn,finishedOn,score,questions,chapters,time,difficulty) VALUES (p_name,p_userId,p_createdOn,p_finishedOn,p_score,p_questions,p_chapters,p_time,p_difficulty);
    CALL addqtLink(LAST_INSERT_ID(), p_chapters, p_questions, p_difficulty);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE addqtLink(
	IN p_testId INT(11),
    IN p_category VARCHAR(200),
    IN p_questionsNr INT(11),
    IN p_difficulty INT(11)
)
BEGIN
DECLARE finished INTEGER DEFAULT 0;
DECLARE qId INT(11);
DECLARE QuestionsIds CURSOR FOR SELECT id FROM questions WHERE INSTR(p_category, category) AND `difficulty`<= p_difficulty ORDER BY RAND() LIMIT p_questionsNr;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN QuestionsIds;
createQTLink: LOOP
	FETCH QuestionsIds INTO qId;
	IF finished = 1 THEN 
		  LEAVE createQTLink;
	END IF;
INSERT INTO tqLink (testId, questionId) VALUES (p_testId,qId);
END LOOP createQTLink;
END //

DELIMITER ;
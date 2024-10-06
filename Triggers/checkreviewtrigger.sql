-- Remarks check review trigger : This checks if the review is pending then payment request is not allowed.

CREATE OR REPLACE TRIGGER check_review_trigger
BEFORE INSERT ON PROJECT_REVIEW
FOR EACH ROW
DECLARE
    max_next_review_date DATE;
BEGIN
    
    SELECT MAX(NEXT_REVIEW_DATE) INTO max_next_review_date
    FROM PROJECT_REVIEW
    WHERE PROJECT_ID = :NEW.PROJECT_ID
    AND PROJECT_ID IN (SELECT PROJECT_ID FROM PROJECT WHERE STATUS = 'RUNNING');

   
    IF max_next_review_date IS NOT NULL AND max_next_review_date < SYSDATE THEN
        
        raise_application_error(-20001, 'Review is pending; payment request not allowed.');
    END IF;
END;
/

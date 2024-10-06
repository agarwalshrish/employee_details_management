-- Remarks displays list of all the delayed projects.

CREATE OR REPLACE FUNCTION get_delayed_projects 
RETURN SYS_REFCURSOR 
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT *
        FROM PROJECT p
        WHERE TO_DATE (PROJECT_START_DATE) + TO_NUMBER (APPROVED_DURATION) < SYSDATE AND p.STATUS = 'RUNNING';
    RETURN v_cursor;
END get_delayed_projects;
/



  

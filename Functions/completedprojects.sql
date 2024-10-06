-- REMARKS displays list of all the completed projects.

CREATE OR REPLACE FUNCTION get_completed_projects RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT p.PROJECT_ID, pr.PROJECT_ID AS REVIEW_PROJECT_ID, p.STATUS
        FROM PROJECT p
        , PROJECT_REVIEW pr where p.PROJECT_ID = pr.PROJECT_ID
        And p.STATUS = 'COMPLETED';

    RETURN v_cursor;
END;
/



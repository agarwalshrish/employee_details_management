-- Remarks displays list of all the running projects.

CREATE OR REPLACE FUNCTION get_running_projects RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT p.PROJECT_ID, p.STATUS
        FROM PROJECT p
        WHERE p.STATUS = 'ONGOING';

    RETURN v_cursor;
END;
/
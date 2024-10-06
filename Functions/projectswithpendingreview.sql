-- Remarks displays the list of the project whose review is pending

CREATE OR REPLACE FUNCTION get_projects_with_pending_review 
RETURN SYS_REFCURSOR 
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT DISTINCT p.*
        FROM PROJECT p
        INNER JOIN PROPOSAL_TABLE pr ON p.PROPOSAL_ID = pr.PROPOSAL_ID
        WHERE pr.STATUS = 'PENDING';
        
    RETURN v_cursor;
END get_projects_with_pending_review;
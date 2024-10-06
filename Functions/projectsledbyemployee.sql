-- Remarks displays projects led by a particular employee.

CREATE OR REPLACE FUNCTION LIST_PROJECTS_LED_BY_EMPLOYEE (
    p_employee_id IN EMPLOYEE_DETAILS.EMP_ID%TYPE
) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT * 
        FROM PROJECT  
        WHERE PROPOSAL_ID IN (
            SELECT PROPOSAL_ID
            FROM PROPOSAL_TABLE
            WHERE EMP_ID = p_employee_id
        );

    RETURN v_cursor;
END LIST_PROJECTS_LED_BY_EMPLOYEE;
/

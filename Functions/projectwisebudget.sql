-- Remarks displays the budget of the a particular project.

CREATE OR REPLACE FUNCTION GET_PROJECT_BUDGET (p_project_id IN PROJECT.PROJECT_ID%TYPE) RETURN NUMBER IS
    v_approved_budget PROJECT.APPROVED_BUDGET%TYPE;
BEGIN
    SELECT APPROVED_BUDGET INTO v_approved_budget
    FROM PROJECT
    WHERE PROJECT_ID = p_project_id;

    RETURN v_approved_budget;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; 
END GET_PROJECT_BUDGET;
/
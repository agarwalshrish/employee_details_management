-- Remarks displays the name of the project according to project id.

CREATE OR REPLACE FUNCTION GET_PROJECT_NAME (p_project_id IN PROJECT.PROJECT_ID%TYPE) RETURN VARCHAR2 IS
    v_project_name PROPOSAL_TABLE.PROJECT_TITLE%TYPE;
BEGIN
    SELECT PROJECT_TITLE INTO v_project_name
    FROM PROPOSAL_TABLE
    WHERE PROPOSAL_ID = p_project_id;

    RETURN v_project_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; 
END GET_PROJECT_NAME;
/

--Remarks displays the review detail for a particular project.

CREATE OR REPLACE FUNCTION 
GET_PROJECT_REVIEW_DETAILS(
	p_project_id IN NUMBER
)
RETURN SYS_REFCURSOR
AS
	v_cursor SYS_REFCURSOR;
BEGIN 
OPEN v_cursor FOR
	SELECT *
	FROM PROJECT_REVIEW
	WHERE PROJECT_ID = p_project_id;


	RETURN v_cursor;
END GET_PROJECT_REVIEW_DETAILS;
/
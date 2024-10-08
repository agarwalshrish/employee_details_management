-- Remarks displays the list of the projects waiting for their approval.

CREATE OR REPLACE FUNCTION 
GET_PROJECTS_WAITING_FOR_APPROVAL
RETURN SYS_REFCURSOR
AS
	v_cursor SYS_REFCURSOR;
BEGIN 
	OPEN v_cursor FOR
	SELECT *
	FROM PROPOSAL_TABLE
	WHERE STATUS = 'PENDING';


	RETURN v_cursor;

END GET_PROJECTS_WAITING_FOR_APPROVAL;
/
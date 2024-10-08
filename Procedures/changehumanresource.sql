-- REMARKS CHANGE_HUMAN_RESOURCE - change the no. of human resources for a particular project. 

CREATE OR REPLACE PROCEDURE
CHANGE_HUMAN_RESOURCE(
	p_RESOURCE_ID IN NUMBER,
	p_NEW_HUMAN_RESOURCE IN NUMBER
) AS
BEGIN
	UPDATE PROPOSAL_TABLE
	SET HUMAN_RESOURCE = p_NEW_HUMAN_RESOURCE
	WHERE PROPOSAL_ID = p_RESOURCE_ID;

	COMMIT;
END CHANGE_HUMAN_RESOURCE;
/

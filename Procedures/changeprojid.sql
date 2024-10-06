-- REAMRKS CHANGE_PROJECT_ID - change the project id

CREATE OR REPLACE PROCEDURE
CHANGE_PROJECT_ID(
	p_resource_id IN NUMBER,
	p_new_project_id IN NUMBER
) AS
BEGIN
	UPDATE HUMAN_RESOURCE
	SET PROJECT_ID = p_new_project_id 
	WHERE RESOURCE_ID = p_resource_id;
	
	COMMIT;
END CHANGE_PROJECT_ID;
/




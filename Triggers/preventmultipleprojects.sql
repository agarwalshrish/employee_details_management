-- Remarks Prevent Multiple Projects: This prevents multiple projects to a particular Human Resource.

CREATE OR REPLACE TRIGGER prevent_multiple_projects BEFORE INSERT OR UPDATE ON HUMAN_RESOURCE FOR EACH ROW
DECLARE
running_projects_count NUMBER;
BEGIN
SELECT COUNT(*)   INTO running_projects_count  FROM HUMAN_RESOURCE hr WHERE hr.RESOURCE_ID = :NEW.RESOURCE_ID  AND hr.PROJECT_ID IN (SELECT PROJECT_ID FROM PROJECT WHERE STATUS = 'running');
if  running_projects_count>0 THEN
RAISE_APPLICATION_ERROR(-20001, 'Employee is already assigned to another running project.');
END if;
END;
/
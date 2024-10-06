-- Remarks gives a list of the whose status is new

CREATE OR REPLACE FUNCTION get_new_started_projects_count(project_start_date IN DATE, end_date IN DATE) 
RETURN NUMBER 
IS
    total_projects NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO total_projects
    FROM PROJECT p
    WHERE PROJECT_START_DATE BETWEEN project_start_date AND end_date
    AND STATUS = 'NEW'
    AND (to_date(p.project_start_date) + p.approved_duration) BETWEEN project_start_date AND end_date;

    RETURN total_projects;
END;
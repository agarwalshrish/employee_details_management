-- Remarks total number of  completed projects with in specified period.

CREATE OR REPLACE FUNCTION total_completed_projects(project_start_date IN DATE, end_date IN DATE)
  RETURN NUMBER
IS
  total_completed NUMBER := 0;
BEGIN
  SELECT COUNT(*)
  INTO total_completed
  FROM PROJECT p
  JOIN PROPOSAL_TABLE pt ON p.PROPOSAL_ID = pt.PROPOSAL_ID
  WHERE pt.STATUS = 'COMPLETED'
  AND (to_date(p.project_start_date) + p.approved_duration) BETWEEN project_start_date AND end_date;

  RETURN total_completed;
END;
/
-- Remarks total expense on r&d within specified period

CREATE OR REPLACE FUNCTION total_expense_in_rd(start_date IN DATE, end_date IN DATE)
  RETURN NUMBER
IS
  total_expense NUMBER := 0;
BEGIN
  SELECT SUM(pt.PROPOSED_BUDGET)
  INTO total_expense
  FROM PROPOSAL_TABLE pt
  JOIN PROJECT p ON pt.PROPOSAL_ID = p.PROPOSAL_ID
  WHERE pt.STATUS = 'COMPLETED'
  AND pt.PROPOSED_OUTCOME = 'RD'
  AND (to_date(p.project_start_date) + p.approved_duration) BETWEEN start_date AND end_date;

  RETURN total_expense;
END;
/
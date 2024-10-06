-- Remarks displays the total payment of the project wrt to project id.

CREATE OR REPLACE FUNCTION display_project_wise_total_payment RETURN SYS_REFCURSOR IS
v_cursor SYS_REFCURSOR;
BEGIN
	OPEN v_cursor FOR
		SELECT p.PROJECT_NAME, SUM(pr.AMOUNT_OF_PAYMENT) AS TOTAL_PAYMENT
		FROM PROJECT p
		JOIN PAYMENT pr ON p.PROJECT_ID = pr.PAYMENT_REQUEST_ID
	     	GROUP BY p.PROJECT_NAME
            	ORDER BY p.PROJECT_NAME;
     RETURN v_cursor;
END;
/
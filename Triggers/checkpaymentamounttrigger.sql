-- Remarks Check payment amount : This checks the amount of payment exceeds approved budget then payment is not allowed.

CREATE OR REPLACE TRIGGER check_payment_amount_trigger
BEFORE INSERT ON PAYMENT_REQUESTION
FOR EACH ROW
DECLARE
    v_total_paid_amount NUMBER(10);
    v_approved_budget NUMBER(10);
BEGIN                                                                        
    SELECT NVL(SUM(AMOUNT_OF_PAYMENT), 0)
    INTO v_total_paid_amount
    FROM PAYMENT
    WHERE PAYMENT_REQUEST_ID IN (SELECT PAYMENT_REQUEST_ID FROM PAYMENT_REQUESTION WHERE PROJECT_ID = :NEW.PROJECT_ID);

    SELECT APPROVED_BUDGET INTO v_approved_budget
    FROM PROJECT
    WHERE PROJECT_ID = :NEW.PROJECT_ID;

    IF v_total_paid_amount + :NEW.AMOUNT > v_approved_budget THEN
        RAISE_APPLICATION_ERROR(-20001, 'Payment amount exceeds approved budget; payment not allowed.');
    END IF;
END;
/



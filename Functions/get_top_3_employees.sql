-- Remarks the top 3 employees who havr successfully completed maximum number of projects.

CREATE OR REPLACE FUNCTION get_top_3_employees RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
         select * from employee_details where emp_id in (select emp_id from (select emp_id,count (*) from  (select emp_id,project_id from
 project inner join proposal_table on project.proposal_id = proposal_table.proposal_id where project.status ='completed') group by emp_id order by count (*) desc ) where rownum <= 3);
    RETURN v_cursor;
END get_top_3_employees;
/
-- Find the total billing amount per person

with date_data as (
    SELECT *,LEAD(bill_date,1,'2078-12-31') OVER(partition by emp_name order by bill_date) as bill_date_limit from monu.dbo.billings 
),
final_data as (select d.*,bill_hrs from date_data d 
INNER join HoursWorked hw on d.emp_name = hw.emp_name and  work_date BETWEEN bill_date and bill_date_limit
)
select emp_name,sum(bill_rate * bill_hrs) as total_amount from final_data
group by emp_name

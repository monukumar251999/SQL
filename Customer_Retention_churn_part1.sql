-- Customer Retention and churn metrics:

/*
Customer retention is a company’s ability to turn the customer into repeat buyers and prevent then from switching to a competitor .
It indicates whether your product and quality of your services please your  existing customer reward program(cc company).
Wallet cash back (paytm/gpay)
Zomato pro swiggy super
Retention period
*/

select month(this_month.order_date)  as month_date,count(distinct last_month.cust_id)from transactions this_month
left join transactions last_month on this_month.order_date = last_month.order_date
and datediff(month,this_month.order_date,last_month.order_date)=1
group by month(this_month.order_date)




--write a query to provide the nth occurance of sunday from given date
--sunday -1
--monday - 2
--friday-6


declare @today_date date = '2022-01-01';
--select @today_date

declare @n int = 3;
--select @n


select dateadd(week,@n-1,dateadd(day,8-DATEPART(WEEKDAY,@today_date),@today_date));

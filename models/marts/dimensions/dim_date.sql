with dates as (
    select dateadd(day, seq4(), '2020-01-01'::date) as date
    from table(generator(rowcount => 1825)) -- 5 years
)

select
    date,
    extract(year from date) as year,
    extract(month from date) as month_number,
    date_trunc('month', date) as first_day_of_month,
    last_day(date) as last_day_of_month,
    extract(quarter from date) as quarter,
    extract(dayofweek from date) as day_of_week,
    case when dayname(date) in ('Sat', 'Sun') then 'Weekend' else 'Weekday' end as day_type
from dates
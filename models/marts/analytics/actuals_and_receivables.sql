with actual_payments as (
    select 
        da.customer_id,
        sp.song_id || '/' || sp.device_id as song_device_id,
        'actual' as type,
        c.customer_name,
        'song_played' as function,
        sp.revenue_dollars as amount
    from {{ ref('fact_song_performance') }} sp
    join {{ ref('dim_devices_allocated') }} da on sp.device_id = da.device_id
    join {{ ref('dim_customer_registered') }} c on da.customer_id = c.customer_id
    
    union all
    
    select
        da.customer_id,
        cf.id as song_device_id,
        'actual' as type,
        c.customer_name,
        'device_sold' as function,
        cf.amount
    from {{ ref('fact_cash_flow') }} cf
    join {{ ref('dim_devices_allocated') }} da on cf.id = da.device_id
    join {{ ref('dim_customer_registered') }} c on da.customer_id = c.customer_id
    where cf.source_type = 'device_sale'
),

receivable_amounts as (
    select
        da.customer_id,
        sp.song_id || '/' || sp.device_id as song_device_id,
        'receivable' as type,
        c.customer_name,
        'song_played' as function,
        count(*) * 1.00 as amount  -- $1 per play expected
    from {{ ref('dim_song_listened') }} sp
    join {{ ref('dim_devices_allocated') }} da on sp.device_id = da.device_id
    join {{ ref('dim_customer_registered') }} c on da.customer_id = c.customer_id
    group by 1,2,3,4,5

    union all 
    
    select
        da.customer_id,
        da.device_id as song_device_id,
        'receivable' as type,
        c.customer_name,
        'device_sold' as function,
        dp.device_price as amount
    from {{ ref('dim_devices_allocated') }} da
    join {{ ref('dim_devices_purchased') }} dp on da.device_id = dp.device_id
    join {{ ref('dim_customer_registered') }} c on da.customer_id = c.customer_id
)

select * from actual_payments
union all 
select * from receivable_amounts
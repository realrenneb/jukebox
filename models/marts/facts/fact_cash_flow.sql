with device_transactions as (
    select 
        date_sold as transaction_date,
        device_price as amount,
        device_name as item_name,
        customer_id::varchar as id,
        'device_sale' as source_type -- can later be update to use seed based on business logic if required
    from {{ ref('fact_device_sales') }}
),

song_transactions as (
    select 
        performance_date as transaction_date,
        revenue_dollars as amount,
        song_name as item_name,
        song_id::varchar as id,
        'song_played' as source_type -- can later be update to use seed based on business logic if required
    from {{ ref('fact_song_performance') }}
),

stock_costs as (
    select
        date_purchased as transaction_date,
        device_price * -1 as amount,
        device_name as item_name,
        device_id::varchar as id,
        'stock_purchased' as source_type -- can later be update to use seed based on business logic if required
    from {{ ref('dim_devices_purchased') }}
)

select * from device_transactions
union all
select * from song_transactions
union all
select * from stock_costs
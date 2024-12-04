with location_registered as (

    select
        customer_id,
        contact_phone_num,
        location_id,
        latitude,
        longitude,
        occurred_at as installation_date

    from {{ ref('stg_location_registered') }}

)
select * from location_registered

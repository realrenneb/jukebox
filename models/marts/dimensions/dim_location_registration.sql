with location_registered as (

    select
        customer_id,
        contact_phone_num,
        location_id,
        latitude,
        longitude,
        TO_CHAR(to_date(occurred_at, 'DD/MM/YYYY HH24:MI:SS.FF'), 'DD/MM/YYYY') as date_installed

    from {{ ref('stg_location_registered') }}

)
select * from location_registered

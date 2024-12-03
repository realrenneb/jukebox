with location_registered as (

    select
        customerid as customer_id,
        contactphonenumber as contact_phone_num,
        locationid as location_id,
        latitude,
        longitude,
        occurredat as occurred_at

    from {{ source('customer', 'location_registered') }}

)
select * from location_registered
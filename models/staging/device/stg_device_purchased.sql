with device_purchased as (

    select
        devicedetails as device_details,
        deviceid as device_id,
        occurredat as occurred_at,

    from {{ source('device', 'device_purchased') }}

)
select * from device_purchased
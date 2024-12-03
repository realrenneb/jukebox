with device_allocated as (

    select
        devicedetails as device_details,
        deviceid as device_id,
        locationallocatedid as location_allocated_id ,
        occurredat as occurred_at,
        sellingagent as selling_agent

    from {{ source('device', 'device_allocated') }}

)
select * from device_allocated
with device_id_mapping as (
   select * from {{ ref('device_id_mapping') }}
),

devices_allocated as (
   select 
       coalesce(m.new_device_id, da.device_id) as device_id,
       PARSE_JSON(device_details):DeviceName::varchar as device_name,
       PARSE_JSON(device_details):DevicePrice::number as device_price,
       PARSE_JSON(selling_agent):AgentId::varchar as agent_id,
       PARSE_JSON(selling_agent):AgentName::varchar as agent_name,
       da.location_allocated_id as location_id,
       lr.customer_id,
       TO_CHAR(TO_DATE(da.occurred_at, 'DD/MM/YYYY HH24:MI:SS.FF'), 'DD/MM/YYYY') as date_sold
   from {{ ref('stg_device_allocated') }} da
   left join device_id_mapping m on da.device_id = m.old_device_id
   left join {{ ref('dim_location_registration') }} lr on da.location_allocated_id = lr.location_id
)

select * from devices_allocated


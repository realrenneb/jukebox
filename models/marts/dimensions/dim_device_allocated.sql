with device_allocated as (

select 
   device_id,
   PARSE_JSON(device_details):DeviceName::varchar as device_name,
   PARSE_JSON(device_details):DevicePrice::number as device_price,
   PARSE_JSON(selling_agent):AgentId::varchar as agent_id,
   PARSE_JSON(selling_agent):AgentName::varchar as agent_name,
   location_allocated_id as location_id,
   TO_CHAR(TO_DATE(occurred_at, 'DD/MM/YYYY HH24:MI:SS.FF'), 'DD/MM/YYYY') as date_sold,
from {{ ref('stg_device_allocated') }}

)
select * from device_allocated
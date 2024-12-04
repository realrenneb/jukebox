with devices_purchased as (

select 
   device_id,
   PARSE_JSON(device_details):DeviceTypeName::varchar as device_name,
   REPLACE(PARSE_JSON(device_details):DevicePrice::varchar, '$', '')::number as device_price,
   PARSE_JSON(device_details):SerialNumber::varchar as serial_number,
   PARSE_JSON(device_details):DeviceTypeId::varchar as type_id,
   to_char(to_date(occurred_at), 'DD/MM/YYYY') as date_purchased,
from {{ ref('stg_device_purchased') }}

)
select * from devices_purchased
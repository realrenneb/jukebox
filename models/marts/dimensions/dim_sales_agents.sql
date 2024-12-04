select distinct
   PARSE_JSON(selling_agent):AgentId::varchar as agent_id,
   PARSE_JSON(selling_agent):AgentName::varchar as agent_name
from {{ ref('stg_device_allocated') }}
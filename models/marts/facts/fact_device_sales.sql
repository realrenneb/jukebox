with device_sold as (
   select 
       p.customer_id,
       c.customer_name,
       p.payment_amount,
       p.date_received,
       p.time_received,
       da.device_id,
       da.device_name,
       da.device_price,
       da.agent_id,
       da.agent_name,
       da.date_sold,
       lr.date_installed
   from {{ ref('dim_payments_received') }} p
   join {{ ref('dim_location_registration') }} lr
       on p.customer_id = lr.customer_id
   join {{ ref('dim_devices_allocated') }} da 
       on lr.location_id = da.location_id
       and to_date(p.date_received, 'DD/MM/YYYY') <= to_date(lr.date_installed, 'DD/MM/YYYY')
   join {{ ref('dim_customer_registered') }} c
       on p.customer_id = c.customer_id
   where p.payment_amount >= da.device_price
)

select * from device_sold
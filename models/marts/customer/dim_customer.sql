with customer_dim as (
    select 
        customer_id,
        customer_name,
        customer_id_num,
        customer_email,
        customer_phone_num,
        address,
        customer_dob,
        occured_at as created_at
    from {{ ref('stg_customer_registered') }}
)
select * from customer_dim

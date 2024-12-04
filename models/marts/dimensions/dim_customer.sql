with customer_dim as (
    select 
        customer_id,
        customer_name,
        customer_id_num,
        customer_email,
        customer_phone_num,
        address,
        customer_dob,
        TO_CHAR(to_date(occurred_at, 'DD/MM/YYYY HH24:MI:SS.FF'), 'DD/MM/YYYY') as date_onboarded
    from {{ ref('stg_customer_registered') }}
)
select * from customer_dim
with customer_registered as (

    select
        customerdateofbirth as customer_dob,
        customeremail as customer_email,
        customerid as customer_id,
        customeridentitynumber as customer_id_num,
        customername as customer_name,
        customerphonenumber as customer_phone_num,
        legaladdress as address,
        occuredat as occured_at

    from {{ source('customer', 'customer_registered') }}

)
select * from customer_registered
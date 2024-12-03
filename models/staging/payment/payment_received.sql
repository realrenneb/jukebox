with payment_received as (

    select
        payment
        
    from {{ source('payment', 'payment_received') }}

)
select * from payment_received
with payment_received as (
   select
       PARSE_JSON(payment):CustomerId::varchar as customer_id,
       PARSE_JSON(payment):PaymentAmount::numeric as payment_amount,
       PARSE_JSON(payment):PaymentId::varchar as payment_id,
       TO_CHAR(TO_TIMESTAMP(PARSE_JSON(payment):OccurredAt::varchar, 'YYYY-MM-DD"T"HH24:MI:SS"Z"'), 'DD/MM/YYYY') as date_received,
       TO_CHAR(TO_TIMESTAMP(PARSE_JSON(payment):OccurredAt::varchar, 'YYYY-MM-DD"T"HH24:MI:SS"Z"'), 'HH24:MI:SS') as time_received
   from {{ ref('stg_payment_received') }}
)
select * from payment_received

{{config(materialized='table')}}


with tg1 as
(
select a.c_key,
a.c_details,
a.c_phone,
b.ordercustkey,
b.O_ORDERSTATUS
from {{ref('stg_customer')}} as a
inner join {{ref('orders')}} b
on a.c_key=b.ordercustkey
)
select * from tg1
{{config(materialized='table')}}

with tg1 as 
(
    select O_ORDERKEY as orderkey,
    O_CUSTKEY as ordercustkey,
    try_cast(O_ORDERDATE as DATE) as orderdate ,
    date_trunc('month',try_cast(O_ORDERDATE as DATE)) as month_date,
    case
    when O_ORDERSTATUS ='O' then 'open'
    when O_ORDERSTATUS ='F' then 'fill'
    when O_ORDERSTATUS ='P' then 'processing'
    end O_ORDERSTATUS
    from {{source('snowflake_data','raw_order')}}

)
select * from tg1

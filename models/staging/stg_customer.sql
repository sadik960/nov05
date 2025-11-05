{{config(materialized='table')}}

with tg1 as
(
    select try_cast(C_CUSTKEY as int) as c_key,
        concat(C_NAME, '+', C_ADDRESS) as c_details,
        c_nationkey,
        c_phone from {{ source('snowflake_data','raw_customer')}}
)
select * from tg1

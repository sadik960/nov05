{{ config(materialized='table') }}

WITH tb1 as(
    select * from
{{source('snapshot_tables','snap_customers_check')}} where DBT_VALID_TO is null
)
select * from tb1

{% snapshot snap_check %}

    {{
     config(
     strategy='check',
     unique_key='c_key',
     check_cols=['c_details','c_phone','ordercustkey','O_ORDERSTATUS'],
    )
 }}

select 
    *
from {{ ref('dim_orders') }} 

{% endsnapshot %}

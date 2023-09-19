{{ config(
    materialized='view',
    order_by=['datetime']
) }}

select distinct on (track_id, method, success) *
from {{ source('src_actions', 'src_actions') }}
where event == 'session_start'


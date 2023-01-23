select 
    count(distinct session_guid) as distinct_session_id
    
from {{ ref('stg_greenery__events')}}
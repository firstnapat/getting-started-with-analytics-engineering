 with unique_session as (
  select 
    count(distinct session_guid) as session_count_with_add_to_cart
    
  
  from {{ ref('stg_greenery__events') }}
  where event_type = 'add_to_cart'
 )
 , total_sessions as (
    select * from {{ ref('int_total_sessions')}}
 )
 select 
  unique_session.session_count_with_add_to_cart::float/total_sessions.distinct_session_id::float as add_to_cart
 from unique_session, total_sessions
 
 
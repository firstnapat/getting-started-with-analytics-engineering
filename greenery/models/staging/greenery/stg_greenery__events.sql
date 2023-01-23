with source as (  

    select * from {{ source('greenery', 'events') }}

)
, renamed_casted as (

    select 
        event_id as event_guid
        , session_id as session_guid
        , user_id as user_guid
        , page_url
        , created_at as created_at_utc
        , event_type
        , order_id as order_guid
        , product_id as product_guid

    from source 

)
-- , not_null as (
    
--     select 
--         event_guid
--         , session_guid
--         , user_guid
--         , page_url
--         , created_at_utc
--         , event_type
--         , order_guid
--         , product_guid
--     from renamed_casted
--     where order_guid is not null and product_guid is not null
-- )

, final as (

    select 
        event_guid
        , session_guid
        , user_guid
        , page_url
        , created_at_utc
        , event_type
        , order_guid
        , product_guid
    from renamed_casted

)

select * from final
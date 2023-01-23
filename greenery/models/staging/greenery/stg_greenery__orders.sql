with source as (  

    select * from {{ source('greenery', 'orders') }}

)
, renamed_casted as (

    select 
        order_id as order_guid
        , user_id as user_guid
        , promo_id as promo_guid
        , address_id as address_guid
        , created_at as created_at_utc
        , order_cost as order_cost_float
        , shipping_cost as shipping_cost_float
        , order_total as order_total_float
        , tracking_id as tracking_guid
        , shipping_service
        , estimated_delivery_at as estimated_delivery_at_utc
        , delivered_at as delivered_at_utc
        , status

    from source 

)
, not_null as (
    
    select 
        order_guid
        , user_guid
        , promo_guid
        , address_guid
        , created_at_utc
        , order_cost_float
        , shipping_cost_float
        , order_total_float
        , tracking_guid
        , shipping_service
        , estimated_delivery_at_utc
        , delivered_at_utc
        , status
    from renamed_casted
    where promo_guid is not null and tracking_guid is not null and shipping_service is not null and estimated_delivery_at_utc is not null and delivered_at_utc is not null
)

, final as (

    select 
       order_guid
        , user_guid
        , promo_guid
        , address_guid
        , created_at_utc
        , order_cost_float
        , shipping_cost_float
        , order_total_float
        , tracking_guid
        , shipping_service
        , estimated_delivery_at_utc
        , delivered_at_utc
        , status
    from not_null

)

select * from final
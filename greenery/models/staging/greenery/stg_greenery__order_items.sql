with source as (  

    select * from {{ source('greenery', 'order_items') }}

)
, renamed_casted as (

    select 
        order_id as order_guid
        , product_id as product_guid
        , quantity as quantity_integer

    from source 

)
, final as (

    select 
        order_guid
        , product_guid
        , quantity_integer

    from renamed_casted

)

select * from final
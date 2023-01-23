with source as (  

    select * from {{ source('greenery', 'products') }}

)
, renamed_casted as (

    select 
        product_id as products_guid
        , name
        , price as price_float
        , inventory as inventory_integer
        
    from source 

)
, final as (
    
    select 
        products_guid
        , name
        , price_float
        , inventory_integer

    from renamed_casted
    
)

select * from final
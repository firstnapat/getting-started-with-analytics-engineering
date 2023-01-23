with source as (  

    select * from {{ source('greenery', 'promos') }}

)
, renamed_casted as (

    select 
        promo_id as promo_guid
        , discount as discount_integer
        , status 
        
    from source 

)
, final as (
    
    select 
        promo_guid
        , discount_integer
        , status

    from renamed_casted
    
)

select * from final
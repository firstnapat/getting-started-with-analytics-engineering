with source as (  

    select * from {{ source('greenery', 'users') }}

)
, renamed_casted as (

    select 
        user_id as user_guid
        , first_name
        , last_name
        , email
        , phone_number
        , created_at as created_at_utc
        , updated_at as updated_at_utc
        , address_id as address_guid 
        
    from source 

)
, final as (
    
    select 
        user_guid
        , first_name
        , last_name
        , email
        , phone_number
        , created_at_utc
        , updated_at_utc
        , address_guid 

    from renamed_casted
    
)

select * from final
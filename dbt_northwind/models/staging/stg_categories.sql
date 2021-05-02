with categories as (
    select
        category_id
        , category_name
        , description
        , picture
    from 
        {{source('northwind_raw', 'dim_categories')}}
)

select * from categories
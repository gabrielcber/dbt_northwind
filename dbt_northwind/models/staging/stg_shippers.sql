with shippers as (
    select 
        shipper_id
        , company_name
        , phone
    from
        {{source('northwind_raw', 'dim_shippers')}}
)

select * from shippers
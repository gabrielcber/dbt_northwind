with shippers as (
    select 
        shipper_id as shipper_sk
        , company_name
        , phone
    from
        {{ref('stg_shippers')}}
)

select * from shippers
order by shipper_sk asc
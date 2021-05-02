with region as(
    select
        region_id as region_sk
        , region_description
    from
        {{source('northwind_raw', 'dim_region')}}
)

select * from region
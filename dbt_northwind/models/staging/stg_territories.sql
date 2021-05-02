with territories as (
    select
        territory_id as territory_sk
        , territory_description
        , region_id
    from
        {{source('northwind_raw', 'dim_territories')}}
)

select * from territories
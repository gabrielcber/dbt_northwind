with us_states as (
    select
        state_id
        , state_name
        , state_abbr
        , state_region
    from
        {{source('northwind_raw', 'dim_us_states')}}
)

select * from us_states
with employee_territories as (
    select
        employee_id
        , territory_id
    from
        {{source('northwind_raw', 'dim_employee_territories')}}
)

select * from employee_territories
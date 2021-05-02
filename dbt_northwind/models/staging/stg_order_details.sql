with order_details as (
    select
        order_id
        , product_id
        , unit_price
        , quantity
        , discount
    from
        {{source('northwind_raw', 'dim_order_details')}}
)

select * from order_details
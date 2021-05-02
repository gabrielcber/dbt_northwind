with joined as(
    select
        row_number() over (order by order_details.order_id) as order_index
        , order_details.order_id
        , order_details.product_id
        , order_details.unit_price
        , order_details.quantity
        , order_details.discount
        , orders.customer_id
        , orders.employee_id
        , orders.order_date
        , orders.required_date
        , orders.shipped_date
        , orders.ship_via
        , orders.freight
        , orders.ship_name
        , orders.ship_address
        , orders.ship_city
        , orders.ship_region
        , orders.ship_postal_code
        , orders.ship_country
    from {{ref('stg_order_details')}} order_details
    left join {{ref('stg_orders')}} orders on order_details.order_id = orders.order_id
)

, adding_sk as (
    select
        /* primary key */
        {{ dbt_utils.surrogate_key(['order_id', 'order_index']) }} as order_sk

        /* foreign keys */
        , customer_id as customer_fk
        , employee_id as employee_fk
        , product_id as product_fk
        , ship_via as shipper_fk

        /* fields for orders */
        , order_id
        , unit_price
        , quantity
        , discount
        , order_date
        , required_date
        , shipped_date
        , freight
        , ship_name
        , ship_address
        , ship_city
        , ship_region
        , ship_postal_code
        , ship_country
    from
        joined
)

select * from adding_sk
order by order_id asc
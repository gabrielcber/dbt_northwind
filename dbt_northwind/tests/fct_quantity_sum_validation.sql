with quantity_validation as(
    select 
        sum(quantity) as sum_val
    from {{ref('fct_orders')}}
    where FORMAT_DATETIME("%B, %Y", order_date) = 'June, 1997'
)

select * from quantity_validation where sum_val != 1635
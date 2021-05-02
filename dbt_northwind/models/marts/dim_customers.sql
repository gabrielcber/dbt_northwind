with customers as (
    select 
        customer_id as customer_sk
        , company_name
        , contact_name
        , contact_title
        , address
        , city
        , region
        , postal_code
        , country
        , phone
        , fax
    from
        {{ref('stg_customers')}}
)

select * from customers
order by customer_sk asc
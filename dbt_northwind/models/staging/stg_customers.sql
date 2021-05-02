with customers as (
    select 
        Index
        , customer_id
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
        {{source('northwind_raw', 'dim_customers')}}
)

select * from customers
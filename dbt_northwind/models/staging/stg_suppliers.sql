with suppliers as(
    select
        supplier_id as supplier_sk
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
        , homepage
    from
        {{source('northwind_raw', 'dim_suppliers')}}
)

select * from suppliers
with joined as (
    select 
        /* primary key */
        products.product_id as product_sk

        /* foreign keys */
        , products.supplier_id as supplier_fk
        , products.category_id as category_fk

        /* fields for products dimension */
        , products.product_name
        , products.quantity_per_unit
        , products.unit_price
        , products.units_in_stock
        , products.units_on_order
        , products.reorder_level
        , case when products.discontinued = 1 then True else False end as is_discontinued
        , categories.category_name as category_name
        , categories.description as category_description
        , categories.picture as category_picture
        , suppliers.company_name as supp_company_name
        , suppliers.contact_name as supp_contact_name
        , suppliers.contact_title as supp_contact_title
        , suppliers.address as supp_address
        , suppliers.city as supp_city
        , suppliers.region as supp_region
        , suppliers.postal_code as supp_postal_code
        , suppliers.country as supp_country
        , suppliers.phone as supp_phone
        , suppliers.fax as supp_fax
        , suppliers.homepage as supp_homepage
    from 
        {{ref('stg_products')}} products
    left join {{ref('stg_suppliers')}} suppliers on products.supplier_id = suppliers.supplier_sk
    left join {{ref('stg_categories')}} categories on products.category_id = categories.category_sk
)

select * from joined
order by product_sk asc
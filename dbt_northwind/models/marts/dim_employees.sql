with selection as (
    select 
        /* primary key */
        employee_id as employee_sk

        /* fields for employees dimension */
        , last_name
        , first_name
        , title
        , title_of_courtesy
        , birth_date
        , hire_date
        , address
        , city
        , region
        , postal_code
        , country
        , home_phone
        , extension
        , photo
        , notes
        , reports_to
        , photo_path
    from
        {{ref('stg_employees')}}
)

select * from selection
order by employee_sk asc
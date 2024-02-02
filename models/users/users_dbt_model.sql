
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with source_data as (

    select u.id, g.id as cohort_id, g.display_name as cohort_name, g.type as group_type  
    from user u left join user_group_role ugr on u.id = ugr.user_id
    left join "GROUP" g on ugr.group_id = g.id

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null

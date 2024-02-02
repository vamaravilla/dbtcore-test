
-- Use the `ref` function to select from other models

select id, cohort_id, cohort_name
from {{ ref('users_dbt_model') }}
where group_type = 'cohort'

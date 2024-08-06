with
  models_out_of_sla as (
    select
      model
      , max(deployment_started_at) as last_deployment_ts
      , datediff('hour', max(deployment_started_at), 
    getdate()
) as hours_since_refreshed
    from
      "northwind"."dbt_landradeesilva_meta"."stg_dbt_model_deployments"
    group by
      1
    having
      max(deployment_started_at) < dateadd('hour', -24, getdate())
  )
select
  count(1)
from
  models_out_of_sla
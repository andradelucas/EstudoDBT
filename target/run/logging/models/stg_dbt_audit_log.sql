

  create view "northwind"."dbt_landradeesilva_meta"."stg_dbt_audit_log__dbt_tmp" as (
    with audit as (

    select * from "northwind"."dbt_landradeesilva_meta"."dbt_audit_log"

),

with_id as (

    select

        *,

        md5(cast(coalesce(cast(event_name as varchar), '') || '-' || coalesce(cast(event_model as varchar), '') || '-' || coalesce(cast(invocation_id as varchar), '') as varchar)) as event_id

    from audit

)

select * from with_id
  ) ;
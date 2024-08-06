create table if not exists "northwind"."dbt_landradeesilva_meta"."dbt_audit_log"
        (
        
            event_name varchar,
        
            event_timestamp 
    timestamp without time zone
,
        
            event_schema varchar,
        
            event_model varchar,
        
            event_user varchar,
        
            event_target varchar,
        
            event_is_full_refresh boolean,
        
            invocation_id varchar
        
        )

    

    insert into "northwind"."dbt_landradeesilva_meta"."dbt_audit_log" (
        event_name,
        event_timestamp,
        event_schema,
        event_model,
        event_user,
        event_target,
        event_is_full_refresh,
        invocation_id
    )

    values (
        'run completed',
        
    
    getdate()

,
        '',
        '',
        'admin',
        'default',
        FALSE,
        'a98fdc96-5504-4601-83e6-3e1cf5eb5c36'
    );

    commit;



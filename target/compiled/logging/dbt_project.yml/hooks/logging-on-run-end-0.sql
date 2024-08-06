
    

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
        '8f57580d-28f0-4ab7-9372-523c0f8bbcca'
    );

    commit;



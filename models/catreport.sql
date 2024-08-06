{{

    config(
            -- como se fosse uma tabela temporaria, pois ela não vai para o banco
            -- mas pode ser utilizada com o comando ref para poder referenciar 
            -- dentro de outro modelo
        -- materialized = 'ephemeral'
        
        -- aqui forçamos  modelo ser criado como tabela
      --  materialized = 'table'

       -- aqui vai acrescentar um novo registro na tabela existente, assim que
       -- o modelo rodar novamente     
            materialized = 'incremental',
            unique_key = 'category_id'
    )

}}




SELECT * FROM {{source('sources','categories')}}
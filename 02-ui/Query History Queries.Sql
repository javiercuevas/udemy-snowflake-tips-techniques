SELECT *
FROM "SNOWFLAKE"."ACCOUNT_USAGE"."QUERY_HISTORY"
WHERE USER_NAME = 'RANDYMINDER'
//    AND start_time >= '2021-05-1'
//    AND database_name = 'Udemy'
//    AND EXECUTION_STATUS <> 'SUCCESS'
ORDER BY start_time DESC;

SELECT *
FROM TABLE(information_schema.QUERY_HISTORY_BY_WAREHOUSE('COMPUTE_XSMALL'))
ORDER BY start_time desc;    

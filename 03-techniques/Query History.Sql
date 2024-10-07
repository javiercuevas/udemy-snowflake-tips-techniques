// Retrieve all queries submitted by any user
SELECT *
FROM table(information_schema.QUERY_HISTORY())
ORDER BY start_time desc;

// Retrieve all queries submitted by a particular user
SELECT *
FROM table(information_schema.QUERY_HISTORY_BY_USER('RandyMinder'))
ORDER BY start_time desc;

// Retrieve all queries submitted by a particular user, within a specified time period. The time
// period must fall within the last 7 days or an error will occur.
SELECT *
FROM table(information_schema.QUERY_HISTORY_BY_USER(
    User_NAME => 'RandyMinder',
    end_time_range_start => to_timestamp_ltz('2021-5-18 07:00:00.000 -0400'),
    end_time_range_end => to_timestamp_ltz('2021-5-18 08:00:00.000 -0400')))   
ORDER BY start_time desc;

// Retrieve all queries submitted by a particular warehouse
SELECT *
FROM table(information_schema.QUERY_HISTORY_BY_WAREHOUSE(WAREHOUSE_NAME => 'COMPUTE_XSMALL', RESULT_LIMIT => 5000))
ORDER BY start_time desc;

// Retrieve all queries submitted in a particular session
SELECT *
FROM table(information_schema.QUERY_HISTORY_BY_SESSION(SESSION_ID => 373773824217094))
ORDER BY start_time desc;


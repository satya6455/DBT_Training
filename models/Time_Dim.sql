-- models/staging/stg_bike_trips.sql

with bike_trips as (

    select 
        RIDE_ID,
        STARTED_AT,
        ENDED_AT,
        STARTED_AT::DATE AS START_DATE,
        ENDED_AT::DATE AS END_DATE,
        EXTRACT(DAY FROM STARTED_AT) AS START_DAY,
        DAYNAME(STARTED_AT) AS START_DAY_NAME,

        CASE 
            WHEN DAYNAME(STARTED_AT) IN ('Sat', 'Sun') THEN 'Holiday'
            ELSE 'Business Day'
         END AS DAY_TYPE
       

        
    from {{ source('DEMO', 'BIKE_DATA') }}

)

select 
    RIDE_ID,
    STARTED_AT as trip_start_time,
    ENDED_AT as trip_end_time,
    START_DATE,
    END_DATE,
    START_DAY,
    START_DAY_NAME,
    DAY_TYPE
from bike_trips

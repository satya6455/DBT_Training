-- models/staging/stg_weather.sql

with Daily_Weather as (

    select 
        CITY_NAME, CLOUDS, LAT,LON, PRESSURE
    from {{ source('DEMO', 'WEATHER') }}

)
select 
    CITY_NAME, 
    CLOUDS,
    round (AVG(LAT))      as AVG_LAT,
    round(AVG(LON))     as AVG_LON,
    round(AVG(PRESSURE)) as AVG_PRESSURE
from Daily_Weather
group by CITY_NAME, CLOUDS



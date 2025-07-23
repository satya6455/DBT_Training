with Bike_Station as (
    select distinct 
     RIDE_ID,STARTED_AT,DATE( STARTED_AT) As Started_Date,start_station_id,start_station_name,start_lat, start_lng
    
    from {{ source('DEMO', 'BIKE_DATA') }}
    limit 10
)

select * from Bike_Station
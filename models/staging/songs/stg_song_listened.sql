with song_listened as (

    select
        songid as song_id,
        SONGCOMPLETEDTIME as SONG_COMPLETED_TIME,
        deviceid as device_id,
        occurredat as occurred_at

    from {{ source('song', 'song_listened') }}

)
select * from song_listened
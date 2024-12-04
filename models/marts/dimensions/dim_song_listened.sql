with song_listened as (

select
    song_id,
    device_id,
    song_completed_time,
    TO_CHAR(to_timestamp_ntz(occurred_at), 'DD/MM/YYYY') as date_played,
    TO_CHAR(to_timestamp_ntz(occurred_at), 'HH24:MI:SS') as time_played
from {{ ref('stg_song_listened') }}

)
select * from song_listened
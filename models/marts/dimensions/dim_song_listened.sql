with song_listened as (

select
    song_id,
    device_id,
    song_completed_time,
    occurred_at
from {{ ref('stg_song_listened') }}

)
select * from song_listened
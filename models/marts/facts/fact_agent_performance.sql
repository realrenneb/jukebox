with song_play_bonus as (
    select
        da.agent_id,
        da.device_id,
        COUNT(*) as total_plays,
        COUNT(*) * 0.01 as play_bonus,
        date_trunc('month', to_timestamp(sl.date_played, 'DD/MM/YYYY')) as commission_month
    from {{ ref('dim_song_listened') }} sl
    join {{ ref('dim_devices_allocated') }} da on sl.device_id::varchar = da.device_id
    group by 1, 2, 5
)
select * from song_play_bonus
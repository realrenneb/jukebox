with song_removed as (
    select
        song_id,
        TO_CHAR(to_timestamp_ntz(occurred_at), 'DD/MM/YYYY') as date_removed,
        TO_CHAR(to_timestamp_ntz(occurred_at), 'HH24:MI:SS') as time_removed
    from {{ ref('stg_song_removed') }}
)
select * from song_removed
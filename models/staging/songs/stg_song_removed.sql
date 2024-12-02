with song_removed as (

    select
        songid as song_id,
        occurredat as occurred_at

    from {{ source('song', 'song_removed') }}

)
select * from song_removed
with song_published as (

    select
        songid as song_id,
        SONGDETAILS as song_details,
        occurredat as occured_at

    from {{ source('song', 'song_published') }}

)
select * from song_published
with song_published as (

select 
    song_id,
    PARSE_JSON(song_details):ArtistName::varchar as artist_name,
    PARSE_JSON(song_details):SongName::varchar as song_name,
    PARSE_JSON(song_details):AlbumName::varchar as album_name,
    PARSE_JSON(song_details):SongLength::varchar as song_length,
    TO_CHAR(to_timestamp_ntz(occurred_at), 'DD/MM/YYYY') as date_published,
    TO_CHAR(to_timestamp_ntz(occurred_at), 'HH24:MI:SS') as time_published
from {{ ref('stg_song_published') }}

)
select * from song_published
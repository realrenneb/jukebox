with song_published as (

select 
    song_id,
    PARSE_JSON(song_details):ArtistName::varchar as artist_name,
    PARSE_JSON(song_details):SongName::varchar as song_name,
    PARSE_JSON(song_details):AlbumName::varchar as album_name,
    PARSE_JSON(song_details):SongLength::varchar as song_length,
    occurred_at as date_published
from {{ ref('stg_song_published') }}

)
select * from song_published
with song_performance as (
   select 
       sl.song_id,
       sl.device_id,
       sp.artist_name,
       sp.song_name,
       count(*) as total_plays,
       count(*) * 1.00 as revenue_dollars,
       TO_CHAR(to_timestamp(sl.date_played, 'DD/MM/YYYY'), 'DD/MM/YYYY') as performance_date
   from {{ ref('dim_song_listened') }} sl
   left join {{ ref('dim_song_published') }} sp 
       on sl.song_id = sp.song_id
   group by 1,2,3,4,7
)

select * from song_performance
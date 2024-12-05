{% macro get_song_genre(artist_name, day_of_week) %} -- use as further analysis for song genre updated in analytical layer
   case 
       when {{ artist_name }} in ('Johnny Cash', 'Dolly Parton', 'George Strait') then 'Country'
       when {{ artist_name }} in ('Drake', 'Kendrick Lamar', 'J. Cole') then 'Hip Hop'
       when {{ artist_name }} in ('Beyonce', 'Usher', 'Chris Brown') then 'R&B'
       when {{ artist_name }} in ('Ed Sheeran', 'Taylor Swift', 'Adele') then 'Pop'
       when {{ day_of_week }} in (5,6,7) and {{ artist_name }} in ('Calvin Harris', 'Avicii', 'David Guetta') then 'Dance'
       else 'Other'
   end
{% endmacro %}
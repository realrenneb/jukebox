{% macro get_revenue_type(device_name) %} -- update analytical layer: {{ get_revenue_type('device_name') }} as revenue_type
    case 
        when {{ device_name }} like '%MusicMaker3000%' then 'Premium'
        when {{ device_name }} like '%Classic%' then 'Standard'
        else 'Basic'
    end
{% endmacro %}

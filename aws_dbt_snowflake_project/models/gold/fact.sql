{% set congigs = [
    {
        "table" : "AIRBNB.GOLD.OBT",
        "columns": "GOLD_OBT.BOOKING_ID,GOLD_OBT.LISTING_ID,GOLD_OBT.HOST_ID,GOLD_OBT.TOTAL_BOOKING_AMOUNT,GOLD_OBT.SERVICE_FEE,GOLD_OBT.CLEANING_FEE,GOLD_OBT.ACCOMMODATES,GOLD_OBT.BEDROOMS,GOLD_OBT.BATHROOMS,GOLD_OBT.PRICE_PER_NIGHT,GOLD_OBT.RESPONSE_RATE",
        "alias": "GOLD_obt"
    },
    {
        "table": "AIRBNB.GOLD.DIM_LISTINGS",
        "columns":"",
        "alias": "DIM_LISTINGS",
        "join_condition":"GOLD_obt.listing_id = DIM_listings.listing_id"
    },
    {
        "table":"AIRBNB.GOLD.DIM_HOSTS",
        "columns":"",
        "alias":"DIM_hosts",
        "join_condition":"GOLD_obt.host_id= DIM_hosts.host_id" 
    }
]%}

SELECT
    {{congigs[0]['columns']}}
FROM
    {%for config in congigs %}
    {% if loop.first %}
        {{config['table']}} AS {{config['alias']}}
    {%else%}
        LEFT JOIN {{config['table']}} AS {{config['alias']}}
        ON {{config['join_condition']}}
        {%endif%}
        {%endfor%}


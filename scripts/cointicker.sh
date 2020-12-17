#!/bin/bash
rate=$(curl -sf https://api.coindesk.com/v1/bpi/currentprice.json | jq ".bpi.USD.rate" | xargs | cut -d, --output-delimiter '' -f 1,2 )
last_update=$(curl -sf https://api.coindesk.com/v1/bpi/currentprice.json | jq ".time.updated")
result=$(awk '{print $1*$2}' <<<"${rate} 0.02851031")

echo "BTC $result $"

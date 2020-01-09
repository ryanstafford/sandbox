#!/bin/sh
#/usr/bin/curl -f -s -o ~/.config/conky/weather 'wttr.in/?format=1'
if curl api.darksky.net &> /dev/null
then
  json="$(curl -s https://api.darksky.net/forecast/$DARKSKY_API_KEY/$(cat ~/.config/conky/ip | jq .Lat),$(cat ~/.config/conky/ip | jq .Long))"
  temp=$(printf %.0f $(echo $json | jq .currently.temperature))
  moon_phase=$(echo $json | jq '.daily.data[0].moonPhase')
  wind_bearing=$(echo $json | jq '.currently.windBearing')
  wind_direction=(↓ ↙ ← ↖ ↑ ↗ → ↘)
  moon_phases=(🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘)
  moon_phase=${moon_phases[$(printf %.0f $(echo "$moon_phase*8" | bc -l))]}
  wind_direction=${wind_direction[$(printf %.0f $(echo "$wind_bearing/360*8" | bc -l))]}
  icon=$(echo $json | jq .currently.icon | sed "s/\"//g")
  declare -A icons
  icons=( ["clear-day"]="☀" ["clear-night"]="$moon_phase" ["rain"]="☔" ["snow"]="🌨️" ["sleet"]="🌨️" ["wind"]="🌫$wind_direction" ["fog"]="🌁" ["cloudy"]="☁️" ["partly-cloudy-day"]="⛅" ["partly-cloudy-night"]="☁️" )
  echo $temp°${icons[$icon]} > ~/.config/conky/weather
else
  echo no network
fi

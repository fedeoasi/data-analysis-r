mkdir -p data

function download_data(){
  sleep 0.2
  wget -O "data/$1_$2.json" http://ergast.com/api/f1/$2/drivers/$1/qualifying.json
}

download_data 'alonso' '2016'
download_data 'button' '2016'

download_data 'hamilton' '2016'
download_data 'rosberg' '2016'

download_data 'vettel' '2016'
download_data 'raikkonen' '2016'

download_data 'hamilton' '2017'
download_data 'vettel' '2017'

download_data 'alonso' '2007'
download_data 'hamilton' '2007'

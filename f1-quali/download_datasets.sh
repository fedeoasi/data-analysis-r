mkdir -p data

function download_data(){
  sleep 0.2
  wget -O "data/$1_$2.json" http://ergast.com/api/f1/$2/drivers/$1/qualifying.json
}

#wget -O "data/vettel_2017.json" http://ergast.com/api/f1/2017/drivers/vettel/qualifying.json
#wget -O "data/hamilton_2017.json" http://ergast.com/api/f1/2017/drivers/hamilton/qualifying.json
#wget -O "data/hamilton_2016.json" http://ergast.com/api/f1/2016/drivers/hamilton/qualifying.json
#wget -O "data/rosberg_2016.json" http://ergast.com/api/f1/2016/drivers/rosberg/qualifying.json
#wget -O "data/hamilton_2007.json" http://ergast.com/api/f1/2007/drivers/hamilton/qualifying.json
#wget -O "data/alonso_2007.json" http://ergast.com/api/f1/2007/drivers/alonso/qualifying.json

download_data 'alonso' '2016'
download_data 'button' '2016'
download_data 'hamilton' '2016'

mkdir -p data

function download_data(){
  FILE=data/$1_$2.json
  if [ ! -f $FILE ]; then
    sleep 0.2
    wget -O $FILE http://ergast.com/api/f1/$2/circuits/$1/qualifying.json
  fi
}

CIRCUIT_IDS="hungaroring spa monza marina_bay sepang suzuka americas rodriguez interlagos yas_marina"

for c in $CIRCUIT_IDS
do
  download_data $c 2016
  download_data $c 2017
done  


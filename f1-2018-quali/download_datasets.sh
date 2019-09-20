mkdir -p data


function download_data(){
  FILE=data/$1_$2.json
  if [ ! -f $FILE ]; then
    sleep 0.2
    wget -O $FILE http://ergast.com/api/f1/$2/circuits/$1/qualifying.json
    sed -i -e '$a\' $FILE  
  fi
}

CIRCUIT_IDS="albert_park bahrain shanghai BAK catalunya monaco villeneuve ricard red_bull_ring"

for c in $CIRCUIT_IDS
do
  download_data $c 2018
done  
 

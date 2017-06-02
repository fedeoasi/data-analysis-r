mkdir -p data

function download_data(){
  FILE=data/$1_$2.json
  if [ ! -f $FILE ]; then
    sleep 0.2
    wget -O $FILE http://ergast.com/api/f1/$2/drivers/$1/qualifying.json
  fi
}

download_data 'alonso' '2016'
download_data 'button' '2016'

download_data 'hamilton' '2016'
download_data 'rosberg' '2016'

download_data 'hamilton' '2015'
download_data 'rosberg' '2015'

download_data 'hamilton' '2014'
download_data 'rosberg' '2014'

download_data 'vettel' '2016'
download_data 'raikkonen' '2016'

download_data 'hamilton' '2017'
download_data 'vettel' '2017'

download_data 'alonso' '2007'
download_data 'hamilton' '2007'

download_data 'alonso' '2010'
download_data 'vettel' '2010'
download_data 'webber' '2010'

download_data 'alonso' '2011'
download_data 'vettel' '2011'
download_data 'webber' '2011'

download_data 'alonso' '2012'
download_data 'vettel' '2012'

download_data 'alonso' '2013'
download_data 'vettel' '2013'

#!/usr/bin/env bash

if [[ -z "$DIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi
source $DIR/../contained

export CONTAINED_DEBUG=1

while read line; do
    
    value=$(awk '{ print $1}' <<<$line)
    expval=$(awk '{ print $2}' <<<$line)
    testval=$(get_uri_to_imgname $value)

    if [ ! "${testval}" == "${expval}" ]
    then
         echo "Test failed: $value returned $testval instead of $expval"
     fi

done <<EOM
docker://quay.io/cyverse/kallisto:0.43.1--hdf51.8.17_0 quay.io-cyverse-kallisto-0.43.1--hdf51.8.17_0.img
shub://quay.io/cyverse/kallisto:0.43.1--hdf51.8.17_0 quay.io-cyverse-kallisto-0.43.1--hdf51.8.17_0.img
quay.io/cyverse/kallisto:0.43.1--hdf51.8.17_0 quay.io-cyverse-kallisto-0.43.1--hdf51.8.17_0.img
quay.io/cyverse/kallisto:latest quay.io-cyverse-kallisto-latest.img
quay.io/cyverse/kallisto quay.io-cyverse-kallisto.img
cyverse/kallisto:0.43.1--hdf51.8.17_0 cyverse-kallisto-0.43.1--hdf51.8.17_0.img
cyverse/kallisto:latest cyverse-kallisto-latest.img
cyverse/kallisto cyverse-kallisto.img
kallisto:0.43.1--hdf51.8.17_0 kallisto-0.43.1--hdf51.8.17_0.img
kallisto:latest kallisto-latest.img
kallisto kallisto.img
EOM

exit 0
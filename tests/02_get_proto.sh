#!/usr/bin/env bash

if [[ -z "$DIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi
source $DIR/../contained

export CONTAINED_DEBUG=1

while read line; do
    
    value=$(awk '{ print $1}' <<<$line)
    expval=$(awk '{ print $2}' <<<$line)
    testval=$(get_reg_protocol $value)
    
    echo -e "Test: $expval\t$testval"

    if [ ! "${testval}" == "${expval}" ]
    then
         echo "Test failed: $value returned $testval instead of $expval"
     fi

done <<EOM
docker://index.docker.io/sd2e/base:latest docker://
shub://singularity-hub/sd2e/base:latest shub://
ftp://ftp.ncbi.nlm.nih.gov/public/genomes 
http://www.sd2e.org/ 
https://hub.docker.com/u/sd2e 
agave://data.iplantcollaborative.org/vaughn/public/text.txt 
EOM

exit 0

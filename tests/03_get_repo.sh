#!/usr/bin/env bash

if [[ -z "$DIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi
source $DIR/../contained

export CONTAINED_DEBUG=1

while read line; do
    
    value=$(awk '{ print $1}' <<<$line)
    expval=$(awk '{ print $2}' <<<$line)
    testval=$(get_uri_to_repo $value)
    
    echo -e "Test: $expval\t$testval"

    if [ ! "${testval}" == "${expval}" ]
    then
         echo "Test failed: $value returned $testval instead of $expval"
     fi

done <<EOM
docker://index.docker.io/sd2e/base:latest index.docker.io/sd2e/base:latest
index.docker.io/sd2e/base:latest index.docker.io/sd2e/base:latest
sd2e/base:latest sd2e/base:latest
sd2e/base sd2e/base
base base
base:ubuntu16 base:ubuntu16
EOM

exit 0

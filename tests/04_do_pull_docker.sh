#!/usr/bin/env bash

if [[ -z "$DIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

export CONTAINED_DEBUG=1
export CONTAINED_ENGINE="docker"
source $DIR/../contained

while read line; do
    
    value=$(awk '{ print $1}' <<<$line)
    expval=$(awk '{ print $2}' <<<$line)
    testval=$(do_pull $value)
    testval=$?

    echo -e "Test: $value - $expval\t$testval"

    if [ ! "${testval}" == "${expval}" ]
    then
         echo "Test failed: $value returned $testval instead of $expval"
     fi

done <<EOM
shub://singularity-hub.org/opensciencegrid/osgvo-tensorflow-gpu:latest 1
docker://index.docker.io/sd2e/base:latest 1
docker://index.docker.io/sd2e/base:ubuntu14 0
index.docker.io/sd2e/base:ubuntu14 0
sd2e/base:ubuntu14 0
sd2e/base:ubuntu16 0
sd2e/base:centos69 0
alpine36 1
quay.io/biocontainers/kallisto:0.43.1--hdf51.8.17_0 0
EOM

exit 0

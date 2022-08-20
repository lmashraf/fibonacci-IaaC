#!/usr/bin/env bash

__usage="
Usage: $(basename $0) [OPTIONS]

  Please provide a substring of the pods you wish to show the logs for.
    [OPTIONS]       server | client | worker | redis | postgres | ingress | ...
  
  For example:
    ./get_all_logs.sh server
"

if [ -z "$1" ]
    then
        echo "$__usage";
        exit
fi

POD_SUBSTRING=$1

for p in $(kubectl get pods | grep ^${POD_SUBSTRING}- | cut -f 1 -d ' '); do 
    echo ------------------------------------------------------
    echo $p 
    echo ------------------------------------------------------
    kubectl logs $p
done

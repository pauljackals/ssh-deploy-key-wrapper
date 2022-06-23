#!/bin/bash

for last in ${!#}; do :; done

key_file=$(mktemp -u)
trap "rm -f $key_file" EXIT

eval last=$last

ssh-add -L | grep --word-regexp --max-count=1 $last > $key_file

ssh -i $key_file "$@"

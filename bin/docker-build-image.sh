#!/usr/bin/env bash
s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
a="$SCRIPT_HOME/.." ;                a=$(cd "$a" && pwd) ; APP_HOME="$a"
nameid='bxdoan'
image_name='start_nodejs'

cd "$APP_HOME"
    docker build -t "${nameid}/${image_name}"   .
                 #t aka tag of the image   #build image from :current_folder/Dockerfile
cd --

# aftermath check
echo
docker image ls | grep -iE "${nameid}/${image_name}|REPOSITORY"
#!/usr/bin/env bash
s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME="$s"  # get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
a="$SCRIPT_HOME/.." ;                a=$(cd "$a" && pwd) ; APP_HOME="$a"
nameid='bxdoan'
image_name='start_nodejs'
docker_name='bxd_nodejs_start'

cd "$APP_HOME"
    # stop if any running container exists
    c=bxd_nodejs_start; docker stop $c; docker rm $c

    # load custom mapped exposed-port if nay - default 3000 if not specified
    env="$SCRIPT_HOME/.env"
    if [[ -f $env ]]; then source $env; fi
    if [[ -z $PORT ]]; then PORT=3030; fi
    # run it
    docker run  --name ${docker_name}  -d                             -p $PORT:3030  "${nameid}/${image_name}"
                #container name         #run as daemon aka background  #port mapping  #image name
cd --


# aftermath check
echo
docker ps | grep -E "${image_name}|IMAGE"
echo "
Container log can be viewed by (press ^C to exit watch)
watch docker logs ${docker_name}
The api is ready to serve when we can see 'api server started at port=${PORT}
"

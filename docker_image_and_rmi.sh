exit 0

function template(){

}

docker images
docker image ls
docker image rm kevin/demo:1.0.1
docker rmi kevin/demo:1.0.1
docker rmi kevin/demo:latest
docker image tag kevin/demo:1.0.1 first comm
docker image push registry-host:5000/myadmin/rhel-httpd:latest
docker rmi -f $(docker images -aq)，刪除所有映像檔
docker login --username=yourhubusername --email=youremail@company.com
docker tag bb38976d03cf yourhubusername/verse_gapminder:firsttry
docker push yourhubusername/verse_gapminder

exit 0

function run_nginx(){
    uwsgi  --master \
        --threads 4 \
        --enable-threads \
        --wsgi-file=restful.py  \
        --shared-socket 0.0.0.0:443 \
        --https =0,certificate.crt,private.key
}

function template() {
    run docker \
    --name test_redis \
    -dit --rm \
    -p 5000:5000 \
    --cpus='0.5' \
    --memory='2gb' \
    -v $PWD:/usr/local/etc/redis \
    -env KEVIN='kevin' \
    --env CONTAINER_VARIABLE=”test” \
    --env-file ./env.list \
    --network smoking_network \
    kevin/cicd-demo
}

function run_ubuntu() {
    docker run -dit \
    --name mysql_mock\
    ubuntu:18.04 /bin/bash
}

function run_mysql() {
    docker run \
    --name mysql -dit \
    --rm \
    -p 3306:3306 \
    --cpus='0.5' \
    --memory='2gb' \
    -e MYSQL_DATABASE=products \
    -e MYSQL_ROOT_PASSWORD=testpassword \
    mysql:8.2.0
}

function run_redis() {
    docker run \
    --name redis_demo -dit \
    --rm \
    -p 6379:6379 \
    --cpus='0.5' \
    --memory='2gb' \
    redis:7.2.3 \
    --requirepass $REDIS_PASSWORD
}

function run_gitlib_runner() {
    docker run -dit \
      --rm \
      gitlab/gitlab-runner:latest
}

function run_backend_service(){
    docker run -dit --rm -p 5000:80 kevin/cicd-demo:1.0.1 /bin/sh
}

function run_gitlab_runner(){
    docker run --rm -d gitlab/gitlab-runner:latest
    docker exec -it ec5 /bin/sh
}

reference: https://docs.docker.com/engine/reference/commandline/run/

docker run --rm -d kevin/cicd-demo:1.0.1
docker run --rm -dit gitlab/gitlab-runner --help
docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest
docker run -d \
  gitlab/gitlab-runner:latest

-d      即使離開容器，仍繼續保持
-t      Allocate a pseudo-tty
-i      Keep STDIN open even if not attached
--rm    容器停止即刪除
/bin/bash   /bin/bash or sh

docker run -it --storage-opt size=120G fedora /bin/bash
docker run -d --tmpfs /run:rw,noexec,nosuid,size=65536k my_image /bin/bash
docker run -v ./host:/slave  -i -t ubuntu /bin/bash
docker run --read-only  -i -t ubuntu /bin/bash
docker run --read-only --mount type=volume,target=/icanwrite busybox touch /icanwrite/here
docker run -p 127.0.0.1:80:8080/tcp ubuntu bash
docker run --expose 80 ubuntu bash
docker run --pull=missing hello-world (default)
docker run --pull=missing hello-world
docker run --pull=never hello-world
docker run -e VAR1=value1 --env MYVAR2=foo --env-file ./env.list ubuntu bash
docker run -l my-label --label com.example.foo=bar ubuntu bash
docker run --label-file ./labels ubuntu bash
docker network create my-net
docker run -itd --network=my-net busybox
docker run --volumes-from 777f7dc92da7 --volumes-from ba8c0c54f0f2:ro -i -t ubuntu pwd

images
gitlab/gitlab-runner
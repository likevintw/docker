function run_mysql() {
    docker run \
    --name mysql -dit \
    --rm \
    -p 3306:3306 \
    --cpus='0.5' \
    --memory='1gb' \
    -e MYSQL_DATABASE=app \
    -e MYSQL_ROOT_PASSWORD=1qazxsw2 \
    -e MYSQL_USER=customer \
    -e MYSQL_PASSWORD=customerpass \
    mysql:8.2.0
}
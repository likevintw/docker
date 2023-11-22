exit 0


function build_with_others_name() {
    docker build \
        --build-arg="APP_VERSION=v0.0.1" \
        -f name.dockerfile \
        --tag kevin/demo:1.0.1 \
        .
}

# --build-arg  using ${GO_VERSION} in dockerfile
# -f  file name, default Dockerfile or name.dockerfile
# -t  tag
# .   dockerfile location

docker build \
    --tag kevin/cicd-demo:1.0.1 \
    .

FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y curl
RUN curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" && apt-get install -y gitlab-runner && gitlab-runner --version

RUN apt-get install -y mysql-server && mysql --version
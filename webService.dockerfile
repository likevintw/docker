#
# Darkenet GPU Dockerfile
# @author Leo Ye (leoye@leedarson.com)
# v1.0.0
#

FROM alpine:3.18.4
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y pkg-config python3-pip

WORKDIR /service

COPY . /ai_service
WORKDIR /ai_service/application/requirement


RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirement.txt

WORKDIR /ai_service/application/src
CMD ["python3", "main.py"]


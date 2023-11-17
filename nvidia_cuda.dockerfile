#
# Darkenet GPU Dockerfile
# @author Leo Ye (leoye@leedarson.com)
# v1.0.0
#

FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
ENV DEBIAN_FRONTEND=noninteractive


# Update Ubuntu Software repository
RUN apt-get update && apt-get install -y \
    vim redis-tools libsm6 libxext6 libxrender-dev curl screen

# Install python3
RUN apt-get install -y software-properties-common autoconf automake libtool libopencv-dev
RUN apt-get install -y build-essential python3-pip git pkg-config
RUN pip3 install --upgrade pip

# ---------------------------------------
# build repo
WORKDIR /ai_service
RUN git clone https://github.com/AlexeyAB/darknet && \
    cd darknet && \
    # git checkout darknet_yolo_v4_pre && \
    # for Nvidia T4, the architecture is compute_75
    # original, the architecture is compute_61
    sed -i '/^#.* arch=compute_75/s/^#//' Makefile && \
    sed -i 's/GPU=0/GPU=1/' Makefile && \
    sed -i 's/CUDNN=0/CUDNN=1/' Makefile && \
    sed -i 's/OPENCV=0/OPENCV=1/' Makefile && \
    sed -i 's/LIBSO=0/LIBSO=1/' Makefile && \
    make && \
    cp libdarknet.so ../

# ---------------------------------------
COPY . /ai_service
WORKDIR /ai_service/application/requirement
RUN pip3 install --no-cache-dir -r requirement.txt

# ---------------------------------------
WORKDIR /ai_service/application/src
CMD ["python3", "restful.py"]

# defaults command
#CMD ["bash"]

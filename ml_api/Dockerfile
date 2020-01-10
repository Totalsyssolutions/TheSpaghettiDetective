FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
WORKDIR /app
EXPOSE 3333
RUN apt update && \
    apt install --no-install-recommends -y libsm6 libxrender1 libfontconfig1 python3-pip python3-setuptools vim ffmpeg wget curl && \
    rm -rf /var/lib/apt/lists/* && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

RUN pip install --upgrade pip
ADD requirements.txt requirements_x86_64.txt ./
RUN pip install -r requirements_x86_64.txt

WORKDIR /app
EXPOSE 3333

ADD . /app
RUN cp bin/model_$(uname --m).so bin/model.so && \
	cp bin/model_gpu_$(uname --m).so bin/model_gpu.so
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN wget --quiet -O model/model.weights $(cat model/model.weights.url | tr -d '\r')

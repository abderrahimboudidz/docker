FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

COPY requirements.txt  /tmp/requirements.txt  

RUN apt-get -y update

RUN apt-get install -y \
        apt-utils 
RUN apt-get -y update

RUN apt-get install -y \
        sudo
RUN apt-get -y upgrade --no-install-recommends
		
RUN apt-get install -y \
        build-essential 

RUN apt-get install -y \
        libcurl3-dev 

RUN apt-get install -y \
        libfreetype6-dev 

RUN apt-get install -y \
        libhdf5-serial-dev 

RUN apt-get install -y \
        libzmq3-dev 

RUN apt-get install -y \
        pkg-config 

RUN apt-get install -y \
        rsync 

RUN apt-get install -y \
        software-properties-common 

RUN apt-get install -y \
        unzip 

RUN apt-get install -y \
        zip 

RUN apt-get install -y \
        zlib1g-dev 

RUN apt-get install -y \
        wget

RUN apt-get install -y \
        git
        
RUN apt-get install -y \
        libsm6 

RUN apt-get install -y \
        python-dev

RUN apt-get install -y \
        libhunspell-dev
      
RUN apt-get install -y \
        hunspell-fr
		
RUN apt-get install -y \
        vim nano	
ARG _PY_SUFFIX=3
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}.6

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    ${PYTHON} \
    ${PYTHON}-pip

RUN ${PIP} --no-cache-dir install --upgrade \
    pip \
    setuptools

# Some TF tools expect a "python" binary
#RUN ln -s $(which ${PYTHON}) /usr/local/bin/python

RUN ${PIP} install \
    -r /tmp/requirements.txt   

FROM smyle/caffe-base
RUN apt-get update && apt-get install -y graphviz
RUN mkdir -p /opt/caffe/build/tools
RUN mkdir /digits
WORKDIR /digits
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt
ENV PATH="$PATH:/opt/caffe/"
RUN mkdir -p /opt/caffe/build/tools
RUN ln -s /opt/caffe/distribute/bin/caffe.bin /opt/caffe/build/tools/caffe
ADD . /digits

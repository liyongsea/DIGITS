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

RUN cd /opt && mkdir nvidia_installers && cd nvidia_installers && wget http://us.download.nvidia.com/XFree86/Linux-x86_64/346.72/NVIDIA-Linux-x86_64-346.72.run && chmod +x NVIDIA-Linux-x86_64-346.72.run && ./NVIDIA-Linux-x86_64-346.72.run -s -N --no-kernel-module

# anaconda
RUN cd /tmp && wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh && chmod +x Anaconda-2.3.0-Linux-x86_64.sh && bash Anaconda-2.3.0-Linux-x86_64.sh -b && apt-get install screen 

ENV PATH="/root/anaconda/bin:$PATH"
RUN conda update conda && conda update ipython ipython-notebook ipython-qtconsole -y && rm /tmp/Anaconda-2.3.0-Linux-x86_64.sh

ADD . /digits

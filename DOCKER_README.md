#Caffe

This is an introduction to run caffe and digits inside a docker image.

## NVIDIA config

First check your nvidia driver installation by:
```bash
$ nvidia-smi
$ ls -al /dev | grep nvidia
```


if you get:
```bash
$ crw-rw-rw-   1 root root    195,   0 Jul 22 01:05 nvidia0
$ crw-rw-rw-   1 root root    195, 255 Jul 22 01:04 nvidiactl
$ crw-rw-rw-   1 root root    251,   0 Jul 22 18:51 nvidia-uvm
```
if nvidia-uvm is missing, run:
```bash
$ sudo add-apt-repository ppa:xorg-edgers/ppa -y && sudo apt-get update 
$ sudo apt-get install nvidia-yourversion-uvm -y
```

## DIGITS

Clone this repo then generate a docker file with your nvidia version
```bash
$ sed "s/YOUR_VERSION/nv_version/g" Dockerfile_example.txt > Dockerfile
```

Then constrct your docker image by:

```bash
$ docker-compose build
```

docker run -d --privileged=true -p 8888:8888 -t -i -v ~/Workspace/notebook:/notebook digits_notebook bash
docker exec -i -t your_id bash

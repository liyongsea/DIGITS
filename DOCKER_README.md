# DIGITS DOCKER IMAGE

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

Clone this repo.

Then checkout your nvidia version by typing
```bash
$ nvidia-smi
```
Generate a docker file with your nvidia version. **you should remplace my_version by your own nvidia version, for example, my_version = 346.72**

```bash
$ sed "s/VERSION/my_version/g" Dockerfile_example.txt > Dockerfile
```

Then build your docker image by:

```bash
$ docker-compose build
```
## Work with docker caffe

In order to work with the docker image, you should run it in the background, and run your functions by calling **docker exec**.

First, run a docker image in background. 
* **digits_notebook** is the id of our image (to view all the docker images on your machine, type **docker images**);.
* **/bin/bash** is the command to run on the machine.
* **--privileged=true**. give the image access to your devices, typecally, your GPU

```bash
$ docker run -d --name=c_id --privileged=true -p 8888:8888 -t -i -v home/ubuntu/Workspace/notebook:/notebook digits_notebook bash
```

To access into the docker image
```bash
$ docker exec -i -t c_id bash
```

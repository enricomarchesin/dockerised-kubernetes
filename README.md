# Dockerised Kubernetes 


> _**Great for training and experiments!**_


You can now deploy the super-lightweight [k3s](https://github.com/rancher/k3s) Kubernetes cluster from Rancher (using [k3s](https://github.com/rancher/k3s)).

The cluster is packaged for easy to setup training classes using Docker-in-Docker, and with the help of [ttyd](https://github.com/tsl0922/ttyd) and [inlets](https://github.com/alexellis/inlets).


## Start a (lightweight!) Kubernetes Cluster

```sh
docker-compose up cluster
```

The console of the master machine can be reached at:

> http://localhost:8022/

From there you can run the usual `kubectl` commands, for example:

```sh
kubectl get po -A
```

A pre-configured `nginx`-based load balancer is setup on port `8081`:

> http://localhost:8081/

Also note that a pre-configured Docker Registry is started with the cluster, and can be referenced in tags like this `registry.dev/webapp:1.0` in commands like:

```sh
docker push registry.dev/webapp:1.0
```

Note that registry images are peristed inside the folder `./registry/data/`.


## Download Docker images for preloading them

To save time and bandwidth, you can download the minimum set of images needed to startup the cluster

```sh
./docker/images/save.sh
```

Also, if you want to preload other images in the Kubernetes nodes, save the Docker tar archives in the folder `./docker/images/preload/`: look at the file `./docker/images/save.sh` to see how easily you can do it.


## Start student machines

First install and start an inlet server on a publicly accessible server:

```sh
curl -sLS https://get.inlets.dev | sh
inlets server --port=8080 --token 123456
```

Then copy the sample `.env-example` file to `.env` and fill it with the correct values for the env vars defined:

```txt
INLETS_TOKEN=123456
INLETS_REMOTE=inlets.server.ext:8080
INLETS_DOMAIN=publicserver.ext:8080
INLETS_PREFIX=m
```

Configure a few DNS entries with the form `INLETS_PREFIX`{1..20}.`INLETS_DOMAIN`, for example `m1.publicserver.ext`.

Finally you can start the number of student machines you need, with a command like:

```sh
docker-compose up machine1 machine2 machine3
```

Each student will be able to access its own machine shell at the urls:

> http://m1.publicserver.ext:8080

The default load balancer is configured to respond at:

> http://publicserver.ext:8080


## Don't forget!

To stop the services run:

```sh
docker-compose down
```

Note that registry images are peristed inside the folder `./registry/data/`.

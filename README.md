# Dockerised Kubernetes 


> _**Great for training and experiments!**_


You can now deploy the super-lightweight Kubernetes cluster, using the [k3d](https://github.com/rancher/k3s) project by Rancher.

The cluster is packaged for training classes that are easy to setup, thanks to Docker-in-Docker, and with the help of [ttyd](https://github.com/tsl0922/ttyd) and [inlets](https://github.com/alexellis/inlets).


## Start a (lightweight!) Kubernetes Cluster

```sh
docker-compose up cluster
```

The console of the master machine can be reached at:

> http://localhost:50022/

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

To save time and bandwidth, you can download the minimum set of images needed to startup the `k3s` cluster using the script:

```sh
./docker/images/save.sh
```

Also, if you want to preload other images in the Kubernetes nodes, save the Docker tar archives in the folder `./docker/images/preload/`: look at the file `./docker/images/save.sh` to see how easily you can do it.


## Start publicly accessible student machines

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
```

Setup a `publicserver.ext` host entry and a wildcard A record for `*.publicserver.ext`. Idf your DNS server/provider does not support wildcars hosts, configure a few DNS entries with the form `ssh`{1..20}.`INLETS_DOMAIN` (for example `ssh0.publicserver.ext`). You can also setup a `www.publicserver.ext` CNAME entry to `publicserver.ext` host.


Finally you can start the number of student machines you need, with a command like:

```sh
docker-compose up machine3
```

You can replace the number `3` in `machine3` above with number from 1 to 20.

The student machines are then reachable at:

> http://localhost:50122/
> http://localhost:50222/
> http://localhost:50322/
> ...
> http://localhost:51922/
> http://localhost:52022/

Each student will also be able to access its own machine shell at the urls:

> http://ssh1.publicserver.ext:8080
> http://ssh2.publicserver.ext:8080
> http://ssh3.publicserver.ext:8080
> [...]
> http://ssh19.publicserver.ext:8080
> http://ssh20.publicserver.ext:8080

The default load balancer is configured to respond at:

> http://publicserver.ext:8080
> http://www.publicserver.ext:8080


## Don't forget!

To stop the services run:

```sh
docker-compose down
```

Note that registry images are persisted inside the folder `./registry/data/`.

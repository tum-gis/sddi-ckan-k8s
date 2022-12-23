<h1 align="center">SDDI CKAN for Kubernetes</h1>

<p align="center">
    <em>an application stack for <a title="SDDI CKAN" href="https://github.com/tum-gis/SDDI-CKAN-Docker">SDDI CKAN</a> in a Kubernetes cluster</em>
    <br />
    <br />
    <a href="https://github.com/tum-gis/sddi-ckan-k8s/issues">Report Bug</a>
    ·
    <a href="https://github.com/tum-gis/sddi-ckan-k8s/issues">Request Feature</a>
    <br />
    <br />
    <a href="https://github.com/tum-gis/sddi-ckan-k8s/releases" title="Latest release">
    <img src="https://img.shields.io/github/v/release/tum-gis/sddi-ckan-k8s?sort=semver">
  </a>
</p>

**Warning**:
> This repository is in development. Use it at your own risk!

## :inbox_tray: Components

* [CKAN](https://ckan.org/)
  * World leading open source data management system
* [PostgreSQL](https://www.postgresql.org/) with [PostGIS](https://postgis.net/)
  spatial extension
  * Open source database with powerful support for spatial data
* [Apache Solr](https://solr.apache.org/)
  * Open source search, navigation, and indexing engine
* [Redis](https://redis.io/)
  * Open source in-memory database
* [CKAN Datapusher](https://github.com/ckan/datapusher)
  * A standalone web service that pushes data files from a CKAN site resources into its DataStore
* [NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/)
  * Route traffic to the applications of the stack
  * Optional dependency, usually not required
* [cert-manager](https://cert-manager.io/docs/)
  * Automatic SSL certificate issuing from e.g. Let's Encrypt
  * Optional dependency, usually not required

## :question: Getting started

To get this up an running in seconds, check out the [examples](examples). You will find examples for:

* [Basic example for a local cluster using Docker Desktop](examples/docker-desktop/)
* [Basic example for a local cluster using `minikube`](examples/minikube/)

The documentation for this helm chart is available in [sddi-ckan/charts](sddi-ckan/charts).

## :grey_exclamation: Requirements

* Kubernetes cluster with Kubernetes `>= v1.20`
  * For testing 2 -3 nodes with 2-4 CPUs and 4-8 GiB RAM will be sufficient
  * Persistent storage using a suitable
    [StorageClass](https://kubernetes.io/docs/concepts/storage/storage-classes/),
    usually a default for managed Kubernetes clusters.

## Mangaged Kubernetes services provisioning

Examples on how to provision a managed Kubernetes service for this Helm chart are available in the
[provisioning](provisioning) folder.

## :rocket: Usage

1. Get a fully-qualified domain name (FQDN) and configure it to point to the public IP address of
   the LoadBalancer service of your Nginx ingress controller.

2. Add and update Helm repo

   ```console
   helm repo add sddi-ckan https://tum-gis.github.io/sddi-ckan-k8s
   helm repo update
   ```

3. Create a configuration file according to your needs: `my-values.yml`

4. Install the stack

   ```console
   helm install ckan sddi-ckan/sddi-ckan \
     -n ckan --create-namespace \
     --atomic --wait \
     --values my-values.yml
   ```

## :hammer_and_wrench: Contributing

Bug fixes, issue reports and contributions are greatly appreciated.

### Contributors

* This repo is based on the CKAN [Docker images](https://github.com/keitaroinc/docker-ckan)
  and [Helm charts](https://github.com/keitaroinc/ckan-helm) of
  [Keitaro](https://github.com/keitaroinc). Many thank's for your great work!

<a href="https://github.com/tum-gis/sddi-ckan-k8s/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=tum-gis/sddi-ckan-k8s" />
</a>

## :construction_worker: Building

### Build Chart documentation

To generate a markdown documentation for this chart
using [norwoodj/helm-docs](https://github.com/norwoodj/helm-docs)
run this from the repo root.

```shell
docker run --rm --volume "$PWD/sddi-ckan/charts:/helm-docs" -u $(id -u) jnorwood/helm-docs:latest
```

## :memo: License

This Helm chart is distributed under the Apache License 2.0. See [LICENSE](LICENSE) for more information.

## :handshake: Thanks

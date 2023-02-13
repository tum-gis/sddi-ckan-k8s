<h1 align="center">SDDI CKAN for Kubernetes</h1>

<p align="center">
    <em>
      Helm chart for a <a title="SDDI" href="https://www.asg.ed.tum.de/gis/projekte/sddi/">SDDI</a>
      enabled <a title="CKAN" href="https://ckan.org/">CKAN</a> catalog
    </em>
    <br />
    <br />
    <a href="https://github.com/tum-gis/sddi-ckan-k8s/issues">Report Bug</a>
    ·
    <a href="https://github.com/tum-gis/sddi-ckan-k8s/issues">Request Feature</a>
    <br />
    <br />
    <a href="https://github.com/tum-gis/sddi-ckan-k8s/releases" title="Latest release">
    <img src="https://img.shields.io/github/v/release/tum-gis/sddi-ckan-k8s?sort=semver&style=for-the-badge">
  </a>
</p>

This chart deploys a self contained [CKAN data catalog](https://ckan.org) with all of its dependencies. CKAN is extended to support the [Smart District Data Infrastructure (SDDI)](https://www.asg.ed.tum.de/en/gis/projects/smart-district-data-infrastructure/).

## :zzz: TL;DR

Deploy a basic SDDI-CKAN setup in a Kubernetes cluster with
[`ingress-nginx`](https://kubernetes.github.io/ingress-nginx) and
[`cert-manager`](https://cert-manager.io/)
available and a FQDN (e.g. `www.my-sddi-ckan.de`) pointing to your Ingress controller.

```bash
helm repo add sddi-ckan "https://tum-gis.github.io/sddi-ckan-k8s"
helm repo update
helm install ckan sddi-ckan/sddi-ckan \
  --atomic --wait -n ckan --create-namespace \
  --set 'global.ingress.domains={"www.my-sddi-ckan.de"}' \
  --set 'ckan.siteUrl={"https://www.my-sddi-ckan.de"}' \
  --set 'global.ingress.issuerEmail=myemailaddress@example.de'
```

For local testing check out the [examples](examples).

## :book: Table of content

- [:zzz: TL;DR](#zzz-tldr)
- [:book: Table of content](#book-table-of-content)
- [:package: Application stack](#package-application-stack)
- [:question: Getting started](#question-getting-started)
- [:grey\_exclamation: Requirements](#grey_exclamation-requirements)
- [:page\_with\_curl: Documentation](#page_with_curl-documentation)
- [Managed Kubernetes services provisioning](#managed-kubernetes-services-provisioning)
- [:rocket: Basic usage](#rocket-basic-usage)
- [:hammer\_and\_wrench: Contributing](#hammer_and_wrench-contributing)
  - [:construction\_worker: Repository setup](#construction_worker-repository-setup)
    - [Build Chart documentation](#build-chart-documentation)
  - [Contributors](#contributors)
- [:memo: License](#memo-license)
- [:handshake: Thanks](#handshake-thanks)

## :package: Application stack

The following applications can be deployed with the Helm chart in this repository.

- [CKAN](https://ckan.org/)
  - World leading open source data management system
- [PostgreSQL](https://www.postgresql.org/) with [PostGIS](https://postgis.net/)
  spatial extension
  - Open source database with powerful support for spatial data
- [Apache Solr](https://solr.apache.org/)
  - Open source search, navigation, and indexing engine
- [Redis](https://redis.io/)
  - Open source in-memory database
- [CKAN Datapusher](https://github.com/ckan/datapusher)
  - A standalone web service that pushes data files from a CKAN site resources into its DataStore
- [NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/)
  - Route traffic to the applications of the stack
  - Optional dependency, usually not required
- [cert-manager](https://cert-manager.io/docs/)
  - Automatic SSL certificate issuing from e.g. Let's Encrypt
  - Optional dependency, usually not required

## :question: Getting started

To get this up an running in seconds, check out the [examples](examples). You will find examples for:

- [Basic example for a local cluster using Docker Desktop](examples/docker-desktop/)
- [Basic example for a local cluster using `minikube`](examples/minikube/)

## :grey_exclamation: Requirements

- Kubernetes cluster with Kubernetes `>= v1.20`

  - For testing 2 -3 nodes with 2-4 CPUs and 4-8 GiB RAM will be sufficient

  - Persistent storage using a suitable
    [StorageClass](https://kubernetes.io/docs/concepts/storage/storage-classes/),
    usually a default for managed Kubernetes clusters.

## :page_with_curl: Documentation

The chart is documented in the chart directory: [charts/sddi-ckan](charts/sddi-ckan)

The documentation for internal dependencies is located in their folders too:

- [ckan](charts/sddi-ckan/charts/ckan)
- [datapusher](charts/sddi-ckan/charts/datapusher)
- [PostgreSQL/PostGIS](charts/sddi-ckan/charts/postgis)
- [Redis](charts/sddi-ckan/charts/redis)
- [Solr](charts/sddi-ckan/charts/solr)
- [certIssuer](charts/sddi-ckan/charts/certIssuer)

External dependencies are documented here:

- [ingress-nginx](https://kubernetes.github.io/ingress-nginx/)
- [cert-manager](https://cert-manager.io/docs/)

## Managed Kubernetes services provisioning

Examples on how to provision a managed Kubernetes service to deploy this
Helm chart are available in the [provisioning](provisioning) folder.

## :rocket: Basic usage

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

### :construction_worker: Repository setup

#### Build Chart documentation

The documentation of this chart is located in this repository in the
[charts/sddi-ckan](charts/sddi-ckan) folder and consists of Markdown files,
that are generated using
[norwoodj/helm-docs](https://github.com/norwoodj/helm-docs).
To keep the documentation in sync with the source files, it is recommended
to use [`pre-commit`](https://github.com/pre-commit/pre-commit) to automatically
update the docs with every commit.

To setup `pre-commit` to automatically update the documentation before each
commit, follow the steps described in [norwoodj/helm-docs: Usage](https://github.com/norwoodj/helm-docs#usage) and use the [.pre-commit-config.yaml](.pre-commit-config.yaml)
in this repo.

To update the Markdown documentation manually using Docker run this from
the repo root.

```shell
docker run --rm -u $(id -u) --name helm-docs \
    --volume "$PWD/sddi-ckan/charts:/helm-docs" \
  jnorwood/helm-docs:latest
```

### Contributors

<a href="https://github.com/tum-gis/sddi-ckan-k8s/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=tum-gis/sddi-ckan-k8s" />
</a>

## :memo: License

This Helm chart is distributed under the Apache License 2.0. See [LICENSE](LICENSE) for more information.

## :handshake: Thanks

- This repo is inspired by the
  [CKAN Helm chart](https://github.com/keitaroinc/ckan-helm) by
  [Keitaro](https://github.com/keitaroinc). Many thank's for your great work!

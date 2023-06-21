<h1 align="center">SDDI CKAN for Kubernetes</h1>

<p align="center">
  <em>
    Helm chart for a <a title="SDDI" href="https://www.asg.ed.tum.de/gis/projekte/sddi/">SDDI</a>
    enabled <a title="CKAN" href="https://ckan.org/">CKAN</a> catalog
  </em>
  <br />
  <br />
  <a href="https://github.com/tum-gis/sddi-ckan-k8s/issues/new/choose">Report bug</a>
  ·
  <a href="https://github.com/tum-gis/sddi-ckan-k8s/issues/new/choose">Request feature</a>
  <br />
  <br />
  <a href="https://github.com/tum-gis/sddi-ckan-k8s/releases" title="Latest release">
    <img src="https://img.shields.io/github/v/release/tum-gis/sddi-ckan-k8s?sort=semver">
  </a>
  </a>
  <a href="https://github.com/tum-gis/sddi-ckan-k8s/blob/main/CHANGELOG.md">
    <img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/tum-gis/sddi-ckan-k8s/chart-releaser.yml?label=Helm%20release&logo=helm">
  </a>
  <br />
  <a href="https://doi.org/10.5281/zenodo.7760480">
    <img src="https://zenodo.org/badge/DOI/10.5281/zenodo.7760480.svg" alt="DOI" />
  </a>
</p>

This chart deploys a self contained [CKAN data catalog](https://ckan.org) with all of its dependencies.
CKAN is extended to support the
[Smart District Data Infrastructure (SDDI)](https://www.asg.ed.tum.de/en/gis/projects/smart-district-data-infrastructure/).

## :zzz: TL;DR

Deploy a basic SDDI-CKAN setup in a Kubernetes cluster with
[`ingress-nginx`](https://kubernetes.github.io/ingress-nginx) and
[`cert-manager`](https://cert-manager.io/)
**pre-installed** and a
[FQDN](https://en.wikipedia.org/wiki/Fully_qualified_domain_name)
(e.g. `www.my-sddi-ckan.de`) pointing to your Ingress controller.

```bash
helm repo add sddi-ckan "https://tum-gis.github.io/sddi-ckan-k8s"
helm repo update
helm install ckan sddi-ckan/sddi-ckan \
  --atomic --wait -n ckan --create-namespace \
  --set 'global.ingress.domains={www.my-sddi-ckan.de}' \
  --set 'ckan.siteUrl=https://www.my-sddi-ckan.de' \
  --set 'global.ingress.certManager.issuerEmail=myemailaddress@example.de'
```

After the Helm deployment has finished, your SDDI CKAN instance is available
at the FQDN you specified.
The default username and password are: `admin: changeMe`.

Instructions for *local* testing with e.g. `minikube` or `Docker Desktop` check out the [examples](examples) section.

> **Note:** To try out
> `alpha`/`beta` [releases](https://github.com/tum-gis/sddi-ckan-k8s/releases),
> add the [`--devel`](https://helm.sh/docs/helm/helm_install/#options)
> option to the `helm install` command.

## :book: Table of content

- [:zzz: TL;DR](#zzz-tldr)
- [:book: Table of content](#book-table-of-content)
- [:package: Application stack](#package-application-stack)
- [:question: Getting started](#question-getting-started)
- [:grey\_exclamation: Requirements](#grey_exclamation-requirements)
- [:page\_with\_curl: Documentation](#page_with_curl-documentation)
- [:cloud: Managed Kubernetes services provisioning](#cloud-managed-kubernetes-services-provisioning)
- [:rocket: Basic usage](#rocket-basic-usage)
- [:hammer\_and\_wrench: Contributing](#hammer_and_wrench-contributing)
  - [Repository setup](#repository-setup)
    - [Build Chart documentation](#build-chart-documentation)
  - [Contributors](#contributors)
    - [Github contributors to this repo](#github-contributors-to-this-repo)
- [:mortar\_board: Research](#mortar_board-research)
  - [Publications](#publications)
  - [Cite this repository](#cite-this-repository)
- [:handshake: Thanks](#handshake-thanks)
- [:memo: License](#memo-license)

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

- Kubernetes cluster with Kubernetes `>= v1.23.0`

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

## :cloud: Managed Kubernetes services provisioning

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

### Repository setup

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

[Marija Knezevic](https://www.asg.ed.tum.de/en/gis/our-team/staff/marija-knezevic/) and
[Bruno Willenborg](https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/)
at Technical University of Munich, Chair of Geoinformatics
realized the current SDDI CKAN [Docker images](https://github.com/tum-gis/ckan-docker)
and [Helm chart](https://github.com/tum-gis/sddi-ckan-k8s) and updated the
CKAN SDDI extensions ([ckanext-grouphierarchy](https://github.com/tum-gis/ckanext-grouphierarchy-sddi),
[ckanext-relation](https://github.com/tum-gis/ckanext-relation-sddi)) initially implemented by
[Mandana Moshrefzadeh](https://www.linkedin.com/in/mandana-moshrefzadeh-a4666454)
and [Wolfgang Deigele](https://www.linkedin.com/in/wolfgang-deigele-329673189).

The core concepts, documentation, and [initial implementation](https://github.com/tum-gis/SDDI-CKAN-Docker)
for SDDI were realized at Technical University of Munich, Chair of Geoinformatics by:

- [Mandana Moshrefzadeh](https://www.linkedin.com/in/mandana-moshrefzadeh-a4666454): Landeshauptstadt München, Kommunalreferat – GeodatenService
- [Prof. Thomas H. Kolbe](https://www.asg.ed.tum.de/gis/unser-team/lehrstuhlangehoerige/prof-thomas-h-kolbe/):
  Technical University of Munich, Chair of Geoinformatics
- [Dr. Andreas Donaubauer](https://www.asg.ed.tum.de/gis/unser-team/lehrstuhlangehoerige/dr-andreas-donaubauer/):
  Technical University of Munich, Chair of Geoinformatics
- [Marija Knezevic](https://www.asg.ed.tum.de/gis/unser-team/lehrstuhlangehoerige/marija-knezevic/):
  Technical University of Munich, Chair of Geoinformatics
- [Bruno Willenborg](https://www.asg.ed.tum.de/gis/unser-team/lehrstuhlangehoerige/bruno-willenborg/):
  Technical University of Munich, Chair of Geoinformatics
- [Kanishk Chaturvedi](https://www.linkedin.com/in/dr-kanishk-chaturvedi), Software AG
- [Son H. Nguyen](https://www.asg.ed.tum.de/en/gis/our-team/staff/son-h-nguyen/), Technical University of Munich, Chair of Geoinformatics
- [Wolfgang Deigele](https://www.linkedin.com/in/wolfgang-deigele-329673189), ESRI Deutschland

<p align="center" height="100" line-height="100">
  <a href="https://www.asg.ed.tum.de/gis/startseite/" target="_blank">
    <img src="https://github.com/tum-gis/sddi-ckan-k8s/blob/main/docs/img/tum_logo_h50.png"
    alt="Technical University of Munich, Chair of Geoinformatics" height="50"/>
  </a>
</p>

#### Github contributors to this repo

<a href="https://github.com/tum-gis/sddi-ckan-k8s/graphs/contributors">
  <img height="40" src="https://contrib.rocks/image?repo=tum-gis/sddi-ckan-k8s" />
</a>

## :mortar_board: Research

An overview of the Smart District Data Infrastructure (SDDI) Project is available
at the Chair of Geoinformatics, Technical University of Munich
[homepage](https://www.asg.ed.tum.de/gis)
in [english](https://www.asg.ed.tum.de/en/gis/projects/smart-district-data-infrastructure/)
and [german](https://www.asg.ed.tum.de/gis/projekte/sddi/).

### Publications

The full list of SDDI related publications is available
[here](https://www.asg.ed.tum.de/gis/projekte/sddi/#c11942). Some key publications
are listed below:

- [**Knezevic et al. (2022)**](https://mediatum.ub.tum.de/node?id=1689713):
  *Managing Urban Digital Twins with an Extended Catalog Service*,
  Proceedings of the 7th International Smart Data and Smart Cities (SDSC) Conference 2022, ISPRS Annals of Photogrammetry, Remote Sensing and Spatial Information Sciences,
  [PDF download / DOI](https://doi.org/10.5194/isprs-annals-X-4-W3-2022-119-2022).

- [**Deigele, W. et al. (2021)**](https://mediatum.ub.tum.de/node?id=1684529):
  *Leitfaden – Geobasierter Digitaler Zwilling nach der SDDI-Methode*,
  Ed.: Bayern Innovativ, ZD.B – Themenplattform Smart Cities and Regions.

- [**Gackstetter, D. et al. (2021)**](https://mediatum.ub.tum.de/node?id=1636657):
  *Smart Rural Areas Data Infrastructure (SRADI) – an information logistics framework for digital agriculture based on open standards*,
  41. GIL-Jahrestagung 2021 - Fokus: Informations- und Kommunikationstechnologie in kritischen Zeiten, Gesellschaft für Informatik e.V. (GI), [PDF download / DOI](https://dl.gi.de/bitstream/handle/20.500.12116/35656/GIL2021_Gackstetter_109-114.pdf?sequence=1&isAllowed=y).

- [**Kolbe, T. H. et al. (2020)**](https://mediatum.ub.tum.de/node?id=1554725):
  *The Data Integration Challenge in Smart City Projects*,
  Chair of Geoinformatics, Technical University of Munich,
  [PDF download / DOI](https://mediatum.ub.tum.de/doc/1554725/671062.pdf).

- [**Moshrefzadeh, M. et al. (2020)**](https://mediatum.ub.tum.de/node?id=1540127):
  *Towards a Distributed Digital Twin of the Agricultural Landscape*,
  Journal of Digital Landscape Architecture (5),
  [PDF download / DOI](https://gispoint.de/fileadmin/user_upload/paper_gis_open/DLA_2020/537690019.pdf).

- [**Moshrefzadeh, M. et al. (2017)**](https://mediatum.ub.tum.de/node?id=1350813):
  *Integrating and Managing the Information for Smart Sustainable Districts - The Smart District Data Infrastructure (SDDI)*,
  In: Kolbe, Thomas H.; Bill, Ralf; Donaubauer, Andreas (Hrsg.): Geoinformationssysteme 2017 – Beiträge zur 4. Münchner GI-Runde. . Wichmann Verlag,
  [PDF download / DOI](https://mediatum.ub.tum.de/download/1350813/1350813.pdf).

- [**Moshrefzadeh, M. and T.H. Kolbe (2016)**](https://mediatum.ub.tum.de/node?id=1304877):
  *Smart Data Infrastructure for Smart and Sustainable Cities*,
  DDSS 2016,
  [PDF download / DOI](https://mediatum.ub.tum.de/doc/1304877/797209.pdf).

### Cite this repository

To cite this repository, please use the DOI provided by [Zenodo](https://zenodo.org).
If you want to reference a specific release version of the software, click the badge
and navigate to the desired version on the page.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7760480.svg?style=flat-square)](https://doi.org/10.5281/zenodo.7760480)

## :handshake: Thanks

We would like to thank following institutions and persons for their contributions
to the SDDI concepts, tools, documentations, education, and funding:

- [ZD.B-Themenplattform Smart Cities and Regions](https://www.bayern-innovativ.de/de/netzwerke-und-thinknet/uebersicht-digitalisierung/digitales-planen-und-bauen-smart-cities-and-regions/seite/zd-b-themenplattform-smart-cities-and-regions):
  Willi Steincke at [Bayern Innovativ GmbH](https://www.bayern-innovativ.de/de?gclid=Cj0KCQjwk7ugBhDIARIsAGuvgPZkLiU4AhX1Xz-07vLIt0vpixwjF1wCrHau3PkGEMyl2ZoU_pn1hPMaAnALEALw_wcB)
  und [Lutz Morich](https://www.linkedin.com/in/lutz-morich-in), for funding and supporting the SDDI development for several years.

- [Bayerisches Staatsministerium für Digitales](https://www.stmd.bayern.de/) for funding the
  [project TwinBy](https://twinby.bayern) and Stefan Bobinger for many contributions to SDDI concepts and documentation.

- [Digital Twin Munich / Digitaler Zwilling München](https://muenchen.digital/twin/),
  [Connected Urban Twins (CUT) research project](https://www.connectedurbantwins.de/en/),
  [SAVeNoW research project](https://savenow.de/en/),
  [eit Climate-KIC](https://www.climate-kic.org/) (SDDI research project)
  for funding the work on SDDI concepts and implementation.

- [Tome Petrovski](https://github.com/TomeCirun) :raised_hands: for professional support
  with CKAN and CKAN extension development.

- [KEITARO](https://www.keitaro.com/) for their [CKAN Docker images](https://github.com/keitaroinc/docker-ckan)
  and [CKAN Helm chart](https://github.com/keitaroinc/ckan-helm) that inspired this work.

<p align="center" height="100" line-height="100">
  <a href="https://twinby.bayern" target="_blank">
    <img src="https://github.com/tum-gis/sddi-ckan-k8s/blob/main/docs/img/twinBy_logo_h50.png"
    alt="TwinBy" height="50"/>
  </a>
  <br />
  <br />
  <a href="https://www.stmd.bayern.de" target="_blank">
    <img src="https://github.com/tum-gis/sddi-ckan-k8s/blob/main/docs/img/bsd_logo_h50.png"
    alt="Bayerische Staatsministerium für Digitales" height="50" />
  </a>
  <br />
  <br />
  <a href="https://www.bayern-innovativ.de" target="_blank">
    <img src="https://github.com/tum-gis/sddi-ckan-k8s/blob/main/docs/img/bayernInnovativ_logo_h50.png"
    alt="Bayern Innovativ GmbH" height="50"/>
  </a>
</p>

## :memo: License

This Helm chart is distributed under the Apache License 2.0. See [LICENSE](LICENSE) for more information.

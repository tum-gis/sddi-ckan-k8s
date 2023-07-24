# sddi-ckan

![Version: 1.1.3](https://img.shields.io/badge/Version-1.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.1.2](https://img.shields.io/badge/AppVersion-1.1.2-informational?style=flat-square)

Helm Chart for a SDDI enabled CKAN catalog. See [CHANGELOG](https://github.com/tum-gis/sddi-ckan-k8s/blob/main/CHANGELOG.md) for changes.

**Homepage:** <https://github.com/tum-gis/sddi-ckan-k8s>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Willenborg | <b.willenborg@tum.de> | <https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/> |

## Source Code

* <https://github.com/tum-gis/sddi-ckan-k8s>
* <https://www.asg.ed.tum.de/en/gis/projects/smart-district-data-infrastructure>
* <https://github.com/tum-gis/ckan-docker>

## Requirements

Kubernetes: `>= 1.23.0`

| Repository | Name | Version |
|------------|------|---------|
|  | certIssuer | * |
|  | ckan | * |
|  | datapusher | * |
|  | postgis | * |
|  | redis | * |
|  | solr | * |
| https://charts.jetstack.io | cert-manager(cert-manager) | ~1.11.0 |
| https://kubernetes.github.io/ingress-nginx | ingress-nginx(ingress-nginx) | ~4.4.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cert-manager.enabled | bool | `false` | Enable/disable cert-manager. |
| certIssuer.enabled | bool | `true` | Enable/disable namespace Issuers for cert-manager. |
| datapusher.enabled | bool | `true` | Enable/disable Datapusher |
| fullnameOverride | string | `""` | Override fullname |
| global.datapusher.db.auth.password | string | `"changeMe"` | Jobs database password. If set, this values will overwrite the value in the Datapusher chart. |
| global.datapusher.db.auth.username | string | `"datapusher"` | Jobs database username. If set, this values will overwrite the value in the Datapusher chart. |
| global.datapusher.db.dbname | string | `"datapusher_jobs"` | Jobs database name. If set, this values will overwrite the value in the Datapusher chart. |
| global.datapusher.db.enabled | bool | `true` | Enable/disable PostgreSQL as database backend for [Datapusher](https://github.com/ckan/datapusher#high-availability-setup). |
| global.datapusher.db.host | string | `"postgis"` | Jobs database host. If set, this values will overwrite the value in the Datapusher chart. |
| global.datapusher.db.port | int | `5432` | Jobs database port. If set, this values will overwrite the value in the Datapusher chart. |
| global.datastore.auth.ro.password | string | `"changeMe"` | CKAN datastore database read-only password. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.datastore.auth.ro.username | string | `"datastore_ro"` | CKAN datastore database read-only username. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.datastore.auth.rw.password | string | `"changeMe"` | CKAN datastore database read-write password. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.datastore.auth.rw.username | string | `"datastore_rw"` | CKAN datastore database read-write username. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.datastore.dbname | string | `"datastore"` | CKAN datastore database name. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.datastore.host | string | `"postgis"` | CKAN datastore database host. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.datastore.port | int | `5432` | CKAN datastore database port. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.db.auth.password | string | `"changeMe"` | Database password for the CKAN database user. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.db.auth.postgresPassword | string | `"changeMe"` | Postgres database password. This is the password of the database superuser. Used to set `POSTGRES_PASSWORD`, see [Postgres Docker docs](https://hub.docker.com/_/postgres/) for more. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.db.auth.postgresUsername | string | `"postgres"` | Postgres database username. This is the username of the database superuser. Used to set `POSTGRES_USERNAME`, see [Postgres Docker docs](https://hub.docker.com/_/postgres/) for more. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.db.auth.username | string | `"ckan"` | Database username for the CKAN database. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.db.dbname | string | `"ckan_default"` | Database name of the CKAN database. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.db.host | string | `"postgis"` | Database host of the CKAN database. |
| global.db.port | int | `5432` | Database port of the CKAN database. |
| global.db.postgresDbname | string | `"postgres"` | Postgres database username. This is the name of the default superuser database. Used to set `POSTGRES_DB`, see [Postgres Docker docs](https://hub.docker.com/_/postgres/) for more. This is used in the PostGIS chart for database initialization. If set, this values will overwrite the value in the PostGIS chart. |
| global.ingress.certManager.issuerEmail | string | `"me@example.com"` | eMail address for ACME registration with Let's Encrypt. Only used for issuerType = namespace. |
| global.ingress.certManager.issuerName | string | `"letsencrypt-staging"` | Name of the Issuer to use. For certManager.type = namespace `letsencrypt-staging`, `letsencrypt-production` and `self-signed` are available. |
| global.ingress.certManager.issuerType | string | `"namespace"` | Type of [cert-manager](https://cert-manager.io/docs/) Issuer: Use either "namespace" or "cluster". |
| global.ingress.className | string | `"nginx"` | Name of the [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class) to use in Ingress routes. |
| global.ingress.domains | list | `["localhost"]` | List of [FQDNs](https://de.wikipedia.org/wiki/Fully-Qualified_Host_Name) for this Ingress. Note: All FQDNs will be used for Ingress hosts and TLS certificate. The global setting overwrites this setting in subcharts. |
| ingress-nginx.enabled | bool | `false` | Enable/disable Nginx ingress controller. |
| nameOverride | string | `""` | Override name |
| postgis.enabled | bool | `true` | Enable/disable database instance. Disable, if an external database is used. |
| redis.enabled | bool | `true` | Enable/disable Redis instance. Disable, if an external Redis instance is used. |
| solr.enabled | bool | `true` | Enable/disable Apache Solr instance. Disable, if an external Solr instance is used. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

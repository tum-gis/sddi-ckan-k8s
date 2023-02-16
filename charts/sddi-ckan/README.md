# sddi-ckan

![Version: 0.3.2](https://img.shields.io/badge/Version-0.3.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

Helm Chart for a SDDI enabled CKAN catalog. See [CHANGELOG](https://github.com/tum-gis/sddi-ckan-k8s/blob/main/CHANGELOG.md) for changes.

**Homepage:** <https://github.com/tum-gis/sddi-ckan-k8s>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Willenborg | <b.willenborg@tum.de> | <https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/> |

## Source Code

* <https://github.com/tum-gis/sddi-ckan-k8s>
* <https://www.asg.ed.tum.de/en/gis/projects/smart-district-data-infrastructure>

## Requirements

Kubernetes: `>= 1.23.0`

| Repository | Name | Version |
|------------|------|---------|
|  | certIssuer | * |
|  | ckan | * |
|  | datapusher | * |
|  | postgis | * |
|  | postgresql-ha-initializer | * |
|  | redis | * |
|  | solr | * |
| https://charts.bitnami.com/bitnami | postgresql-ha(postgresql-ha) | >=9.4.11 |
| https://charts.jetstack.io | cert-manager(cert-manager) | ~1.11.0 |
| https://kubernetes.github.io/ingress-nginx | ingress-nginx(ingress-nginx) | ~4.4.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cert-manager.enabled | bool | `false` | Enable/disable cert-manager. |
| certIssuer.enabled | bool | `true` | Enable/disable namespace Issuers for cert-manager. |
| datapusher.enabled | bool | `true` | Enable/disable Datapusher |
| fullnameOverride | string | `""` | Override fullname |
| global.datastore.auth.ro.password | string | `"changeMe"` | CKAN datastore database read-only password. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.datastore.auth.ro.username | string | `"datastore_ro"` | CKAN datastore database read-only username. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.datastore.auth.rw.password | string | `"changeMe"` | CKAN datastore database read-write password. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.datastore.auth.rw.username | string | `"datastore_rw"` | CKAN datastore database read-write username. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.datastore.dbname | string | `"datastore"` | CKAN datastore database name. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.datastore.host | string | `"postgis-hl"` | CKAN datastore database host. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.datastore.port | int | `5432` | CKAN datastore database port. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.db.auth.password | string | `"changeMe"` | Database password of the ro user. Database RO username for CKAN and CKAN datastore DB. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.db.auth.username | string | `"ckan"` | Database password of the ro user. Database RO username for CKAN and CKAN datastore DB. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.db.dbname | string | `"ckan_default"` | Database name. This is used in database charts for CKAN database initialization. If set, this values will overwrite the value in the database chart. |
| global.db.host | string | `"postgis-hl"` | CKAN database host. |
| global.db.port | int | `5432` | CKAN database port. |
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

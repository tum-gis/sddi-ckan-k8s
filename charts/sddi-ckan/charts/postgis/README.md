# postgis

![Version: 0.6.1](https://img.shields.io/badge/Version-0.6.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 14-3.3](https://img.shields.io/badge/AppVersion-14--3.3-informational?style=flat-square)

A Helm chart for sa simple PostGIS database pre-configured for CKAN.

**Homepage:** <https://github.com/tum-gis/sddi-ckan-k8s/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Willenborg | <b.willenborg@tum.de> | <https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/> |

## Source Code

* <https://github.com/tum-gis/sddi-ckan-k8s/tree/main/sddi-ckan/charts/charts/postgis>
* <https://registry.hub.docker.com/r/postgis/postgis/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| component | string | `"database"` | Role of PostGIS database in this chart |
| datapusher.auth.password | string | `"changeMe"` |  |
| datapusher.auth.username | string | `"datapusher"` |  |
| datapusher.dbname | string | `"datapusher_jobs"` |  |
| datapusher.host | string | `"postgis"` |  |
| datapusher.port | int | `5432` |  |
| datastore.auth.ro.password | string | `"changeMe"` | CKAN datastore database read-only password. Note: This values is overwritten by `global.datastore.auth.ro.password`, if set. |
| datastore.auth.ro.username | string | `"datastore_ro"` | CKAN datastore database read-only username. Note: This values is overwritten by `global.datastore.auth.ro.username`, if set. |
| datastore.auth.rw.password | string | `"changeMe"` | CKAN datastore database read-write password. Note: This values is overwritten by `global.datastore.auth.rw.password`, if set. |
| datastore.auth.rw.username | string | `"datastore_rw"` | CKAN datastore database read-write username. Note: This values is overwritten by `global.datastore.auth.rw.username`, if set. |
| datastore.dbname | string | `"datastore"` | CKAN datastore database name. Note: This values is overwritten by `global.datastore.dbname`, if set. |
| db.auth.password | string | `"changeMe"` | Database password for the CKAN database user. Note: This values is overwritten by `global.db.auth.password`, if set. |
| db.auth.postgresPassword | string | `"changeMe"` | Postgres database password. This is the password of the database superuser. Used to set `POSTGRES_PASSWORD`, see [Postgres Docker docs](https://hub.docker.com/_/postgres/) for more. Note: This values is overwritten by `global.db.auth.postgresPassword`, if set. |
| db.auth.postgresUsername | string | `"postgres"` | Postgres database username. This is the username of the database superuser. Used to set `POSTGRES_USERNAME`, see [Postgres Docker docs](https://hub.docker.com/_/postgres/) for more. Note: This values is overwritten by `global.db.auth.postgresUsername`, if set. |
| db.auth.username | string | `"ckan"` | Database username for the CKAN database. Note: This values is overwritten by `global.db.auth.username`, if set. |
| db.dbname | string | `"ckan_default"` | Database name of the CKAN database. Note: This values is overwritten by `global.db.dbname`, if set. |
| db.port | int | `5432` | Database port. Note: This values is overwritten by `global.db.port`, if set. |
| db.postgresDbname | string | `"postgres"` | Postgres database username. This is the name of the default superuser database. Used to set `POSTGRES_DB`, see [Postgres Docker docs](https://hub.docker.com/_/postgres/) for more. Note: This values is overwritten by `global.db.postgresDbname`, if set. |
| debug.queryLogging | bool | `false` | Enable/disable query logging |
| enabled | bool | `true` | Enable/disable PostGIS database |
| extraEnv | object | `{}` | Extra environment variables for PostGIS. |
| fullnameOverride | string | `"postgis"` | Override fullname |
| image.pullPolicy | string | `"IfNotPresent"` | [Image pull policy](https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy) |
| image.repository | string | `"postgis/postgis"` | [Image repository](https://kubernetes.io/docs/concepts/containers/images/) |
| image.tag | string | `""` | Overrides the image tag whose default is the chart `appVersion`. |
| imagePullSecrets | list | `[]` | [Image pull secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| loadBalancer.enabled | bool | `false` | Create a LoadBalancer service for external Database access |
| nameOverride | string | `""` | Override name |
| nodeSelector | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Storage [access modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) |
| persistence.annotations | object | `{}` | Additional annotations for PVC Set helm.sh/resource-policy: keep to avoid deletion of PVC on helm upgrade/uninstall |
| persistence.capacity | string | `"4Gi"` | Storage [capacity](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#capacity) |
| persistence.mountPath | string | `"/mydata"` | Mount path of the storage. Omit trailing `/` ! |
| persistence.pgdataSubPath | string | `"/pgdata"` | Subpath inside `mountPath` for the postgres data folder |
| persistence.storageClassName | string | `nil` | StorageClass to use, leave empty to use default StorageClass. |
| podAnnotations | object | `{}` | Additional pod annotations |
| podSecurityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| resources | object | `{}` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| securityContext | string | `nil` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [k8S: Taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

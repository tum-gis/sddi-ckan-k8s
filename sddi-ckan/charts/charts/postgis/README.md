# postgis

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 14-3.3-alpine](https://img.shields.io/badge/AppVersion-14--3.3--alpine-informational?style=flat-square)

A Helm chart a simple PostGIS database pre-configured for CKAN

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
| datastore.auth.ro.password | string | `"changeMe"` | CKAN datastore database read-only password. Note: This values is overwritten by `global.datastore.auth.ro.password`, if set. |
| datastore.auth.ro.username | string | `"datastore_ro"` | CKAN datastore database read-only username. Note: This values is overwritten by `global.datastore.auth.ro.username`, if set. |
| datastore.auth.rw.password | string | `"changeMe"` | CKAN datastore database read-write password. Note: This values is overwritten by `global.datastore.auth.rw.password`, if set. |
| datastore.auth.rw.username | string | `"datastore_rw"` | CKAN datastore database read-write username. Note: This values is overwritten by `global.datastore.auth.rw.username`, if set. |
| datastore.dbname | string | `"datastore"` | CKAN datastore database name. Note: This values is overwritten by `global.datastore.dbname`, if set. |
| datastore.host | string | `"postgis-hl"` | CKAN datastore database host. Note: This values is overwritten by `global.datastore.host`, if set. |
| datastore.port | int | `5432` | CKAN datastore database port. Note: This values is overwritten by `global.datastore.port`, if set. |
| db.auth.password | string | `"changeMe"` | CKAN database username. Note: This values is overwritten by `global.db.auth.password`, if set. |
| db.auth.username | string | `"ckan"` | CKAN database username. Note: This values is overwritten by `global.db.auth.username`, if set. |
| db.dbname | string | `"ckan_default"` | CKAN database name. Note: This values is overwritten by `global.db.dbname`, if set. |
| db.host | string | `"postgis"` | CKAN database host. Note: This values is overwritten by `global.db.host`, if set. |
| db.port | int | `5432` | CKAN database port. Note: This values is overwritten by `global.db.port`, if set. |
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
| resources.limits.cpu | string | `"2000m"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.limits.memory | string | `"4Gi"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.requests.cpu | string | `"1000m"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.requests.memory | string | `"2Gi"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| securityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [k8S: Taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

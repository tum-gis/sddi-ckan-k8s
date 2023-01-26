# postgis

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 14-3.3-alpine](https://img.shields.io/badge/AppVersion-14--3.3--alpine-informational?style=flat-square)

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
| auth.password | string | `"changeMe"` | Database password of the rw user. Database RW username for CKAN and CKAN datastore DB. Note: This value is overwritten by `global.db.auth.password`, if set. |
| auth.username | string | `"ckan"` | Database username of the rw user. Database RW username for CKAN and CKAN datastore DB. Note: This value is overwritten by `global.db.auth.username`, if set. |
| authRO.password | string | `"changeMe"` | Database password of the ro user. Database RO username for CKAN and CKAN datastore DB. Note: This value is overwritten by `global.db.authRO.password`, if set. |
| authRO.username | string | `"datastore_ro"` | Database password of the ro user. Database RO username for CKAN and CKAN datastore DB. Note: This value is overwritten by `global.db.authRO.username`, if set. |
| component | string | `"database"` | Role of PostGIS database in this chart |
| dbname | string | `"ckan_default"` | Database name |
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
| port | int | `5432` | Database port |
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

# solr

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat-square) ![AppVersion: 2.11-solr9-spatial](https://img.shields.io/badge/AppVersion-2.11--solr9--spatial-informational?style=flat-square)

A Helm chart for Solr pre-configured for CKAN  and ckanext-spatial.

**Homepage:** <https://github.com/tum-gis/sddi-ckan-k8s/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Willenborg | <b.willenborg@tum.de> | <https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/> |

## Source Code

* <https://github.com/tum-gis/sddi-ckan-k8s/tree/main/sddi-ckan/charts/charts/solr>
* <https://github.com/ckan/ckan-solr>
* <https://github.com/ckan/ckanext-spatial>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalSearchFields.enabled | bool | `true` | Enable/disable additional search fields |
| additionalSearchFields.fields | list | `["<field name=\"topic\" type=\"string\" indexed=\"true\" stored=\"true\" multiValued=\"true\"/>"]` | List of additional search field XML snippets |
| affinity | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| component | string | `"index"` | Role of Solr in this chart |
| enabled | bool | `true` | Enable/disable Solr |
| extraInitContainers | list | `[]` | Sets additional [`initContainers`](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/). The initContainers specified here, are appended to the ones specified in `initContainers`. |
| extraVolumeMounts | list | `[]` | Sets additional [`volumeMounts`](https://kubernetes.io/docs/concepts/storage/volumes). The volumeMounts specified here, are appended to the ones specified in `volumeMounts`. |
| extraVolumes | list | `[]` | Sets additional [`volumes`](https://kubernetes.io/docs/concepts/storage/volumes). The volumes specified here, are appended to the ones specified in `volumes`. |
| fullnameOverride | string | `"solr"` | Override fullname |
| image.pullPolicy | string | `"IfNotPresent"` | [Image pull policy](https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy) |
| image.repository | string | `"ckan/ckan-solr"` | [Image repository](https://kubernetes.io/docs/concepts/containers/images/) |
| image.tag | string | `""` | Overrides the image tag whose default is the chart `appVersion`. |
| imagePullSecrets | list | `[]` | [Image pull secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| initContainers | list | See `values.yml` for the list of default initContainers. | Sets [`initContainers`](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/). Set to `[]` to disable the default initContainers. Set to any list of initContainer definitions to overwrite the default initContainers. Use `extraInitContainers` to extend the default initContainers. |
| loadBalancer.enabled | bool | `false` | Enable/disable a LoadBalancer service for external Database access |
| nameOverride | string | `""` | Override name |
| nodeSelector | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Storage [access modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) |
| persistence.annotations | string | `nil` | Annotations for PVCs Set helm.sh/resource-policy: keep to avoid deletion of PVC on helm upgrade/uninstall |
| persistence.capacity | string | `"4Gi"` | Storage [capacity](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#capacity) |
| persistence.storageClassName | string | `nil` | StorageClass to use, leave empty to use default StorageClass. |
| podAnnotations | object | `{}` | Additional pod annotations |
| podSecurityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| resources | object | `{}` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| securityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| service.port | int | `8983` | Service port for http |
| service.type | string | `"ClusterIP"` | Type of service for http |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [k8s: Taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| volumeMounts | list | See [`values.yml`](values.yml) for the list of default volumeMounts. | Sets [`volumeMounts`](https://kubernetes.io/docs/concepts/storage/volumes). Set to `[]` to disable the default volumeMounts. Set to any list of volumeMount definitions to overwrite the default volumeMounts. Use `extraVolumeMounts` to extend the default volumeMounts. |
| volumes | list | See [`values.yml`](values.yml) for the list of default volumes. | Sets [`volumes`](https://kubernetes.io/docs/concepts/storage/volumes). Set to `[]` to disable the default volumes. Set to any list of volume definitions to overwrite the default volumes. Use `extraVolumes` to extend the default volumes. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)

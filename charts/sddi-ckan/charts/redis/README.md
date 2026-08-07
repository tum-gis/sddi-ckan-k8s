# redis

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.4.2-alpine](https://img.shields.io/badge/AppVersion-7.4.2--alpine-informational?style=flat-square)

A Helm chart for basic Redis for use with CKAN.

**Homepage:** <https://github.com/tum-gis/sddi-ckan-k8s/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Willenborg | <b.willenborg@tum.de> | <https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/> |

## Source Code

* <https://github.com/tum-gis/sddi-ckan-k8s/tree/main/sddi-ckan/charts/charts/redis>
* <https://hub.docker.com/_/redis>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| autoscaling.enabled | bool | `false` | Enable/disable pod autoscaling, if disabled `replicaCount` is used to set number of pods. Check requirements of [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| autoscaling.maxReplicas | int | `5` | Maximum number of replicas |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | string | `nil` | [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| autoscaling.targetMemoryUtilizationPercentage | string | `nil` | [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| component | string | `"cache"` | Role of Redis in this chart |
| enabled | bool | `true` | Enable/disable Redis |
| fullnameOverride | string | `"redis"` | Override fullname |
| image.pullPolicy | string | `"IfNotPresent"` | [Image pull policy](https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy) |
| image.repository | string | `"redis"` | [Image repository](https://kubernetes.io/docs/concepts/containers/images/) |
| image.tag | string | `""` | Overrides the image tag whose default is the chart `appVersion`. |
| imagePullSecrets | list | `[]` | [Image pull secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| loadBalancer | object | `{"enabled":false}` | Create an additional LoadBalancer service for external redis access |
| nameOverride | string | `""` | Override name |
| nodeSelector | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Mount path of the storage. Omit trailing `/` ! |
| persistence.annotations | string | `nil` | Annotations for PVCs Set helm.sh/resource-policy: keep to avoid deletion of PVC on helm upgrade/uninstall |
| persistence.capacity | string | `"4Gi"` | Storage [capacity](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#capacity) |
| persistence.enabled | bool | `true` | Enable/disable persistent data storage |
| persistence.save | string | `"60 1"` | Redis [save](https://redis.io/commands/save/) args |
| persistence.storageClassName | string | `nil` | StorageClass to use, leave empty to use default StorageClass. |
| podAnnotations | object | `{}` | Additional pod annotations |
| podSecurityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| replicaCount | int | `1` | Number of replicas. Only used if `autoscaling.enabled = false`. |
| resources | object | `{}` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| securityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| service.port | int | `6379` | Service port for http |
| service.type | string | `"ClusterIP"` | Type of service for http |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [k8S: Taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |


# datapusher

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.17](https://img.shields.io/badge/AppVersion-0.0.17-informational?style=flat-square)

A Helm chart for CKAN Datapusher

**Homepage:** <https://github.com/tum-gis/sddi-ckan-k8s>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Willenborg | <b.willenborg@tum.de> | <https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/> |

## Source Code

* <https://github.com/tum-gis/sddi-ckan-k8s>
* <https://github.com/tum-gis/sddi-ckan-k8s/tree/main/sddi-ckan/charts/charts/datapusher>
* <https://github.com/keitaroinc/docker-ckan>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| autoscaling.enabled | bool | `false` | Enable/disable pod autoscaling, if disabled `replicaCount` is used to set number of pods. Check requirements of [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| autoscaling.maxReplicas | int | `5` | Maximum number of replicas |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | string | `nil` | [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| autoscaling.targetMemoryUtilizationPercentage | string | `nil` | [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| chunkSize | string | `"16384"` | Size of chunks of the data that is being downloaded in bytes |
| component | string | `"datapusher"` | Role of CKAN Datapusher in this chart |
| datapusherRewriteResources | string | `"True"` | Enable or disable (boolean) whether Datapusher should rewrite resources uploaded to CKAN's filestore, since Datapusher takes the CKAN Site URL value for generating the resource URL. Default: False |
| datapusherRewriteUrl | string | `"http://ckan:5000/"` | Sets the rewrite URL that Datapusher will rewrite resources that are uploaded to CKAN's filestore. Default: http://ckan:5000 |
| datapusherSslVerify | string | `"False"` | Enable or disable (boolean) verification of SSL when trying to get resources. Default: True |
| downloadTimeout | string | `"30"` | Timeout limit of the download request |
| enabled | bool | `true` | Enable/disable CKAN Datapusher |
| extraEnv | object | `{}` | Extra environment variables. Values need to be quoted. This can be used to overwrite or extend [CKAN settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-configuration-file). See [ckanext-envvars](https://github.com/okfn/ckanext-envvars) for variable naming conventions. |
| fullnameOverride | string | `"datapusher"` | Override fullname |
| image.pullPolicy | string | `"IfNotPresent"` | [Image pull policy](https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy) |
| image.repository | string | `"ghcr.io/keitaroinc/datapusher"` | [Image repository](https://kubernetes.io/docs/concepts/containers/images/) |
| image.tag | string | `""` | Overrides the image tag whose default is the chart `appVersion`. |
| imagePullSecrets | list | `[]` | [Image pull secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| insertRows | string | `"250"` | Number of rows to take from the data and upload them as chunks to datastore |
| maxContentLength | string | `"10485760"` | Maximum size of content to be uploaded in bytes. |
| nameOverride | string | `""` | Override name |
| nodeSelector | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Additional pod annotations |
| podSecurityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| replicaCount | int | `1` | Number of replicas. Only used if `autoscaling.enabled = false`. |
| resources.limits.cpu | string | `"1000m"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.limits.memory | string | `"500Mi"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.requests.cpu | string | `"250m"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.requests.memory | string | `"256Mi"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| securityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| service.port | int | `8000` | Service port |
| service.type | string | `"ClusterIP"` | Type of service |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [k8S: Taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

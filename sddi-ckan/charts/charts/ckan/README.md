# ckan

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.9.5](https://img.shields.io/badge/AppVersion-2.9.5-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalSettings | string | `"# other ckan settings\n# an even more settings\n\n"` |  |
| affinity | object | `{}` |  |
| auth.allow_dataset_collaborators | bool | `false` |  |
| auth.anon_create_dataset | bool | `false` |  |
| auth.create_dataset_if_not_in_organization | bool | `false` |  |
| auth.create_default_api_keys | bool | `false` |  |
| auth.create_unowned_dataset | bool | `false` |  |
| auth.create_user_via_api | bool | `false` |  |
| auth.create_user_via_web | bool | `true` |  |
| auth.public_activity_stream_detail | bool | `true` |  |
| auth.public_user_details | bool | `true` |  |
| auth.roles_that_cascade_to_sub_groups | string | `"admin editor member"` |  |
| auth.user_create_groups | bool | `false` |  |
| auth.user_create_organizations | bool | `false` |  |
| auth.user_delete_groups | bool | `false` |  |
| auth.user_delete_organizations | bool | `false` |  |
| autoscaling.enabled | bool | `false` | Enable/disable pod autoscaling, if disabled `replicaCount` is used to set number of pods. |
| autoscaling.maxReplicas | int | `5` | Maximum number of replicas |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| component | string | `"frontend"` |  |
| datapusher.callback_url_base | string | `"http://ckan-svc:5000/"` |  |
| datapusher.url | string | `"http://datapusher-svc:8000/"` |  |
| dataset."dataset.create_on_ui_requires_resources" | bool | `false` |  |
| datastore.auth.ro.password | string | `"changeMe"` |  |
| datastore.auth.ro.username | string | `"datastore_ro"` |  |
| datastore.auth.rw.password | string | `"changeMe"` |  |
| datastore.auth.rw.username | string | `"ckan"` |  |
| datastore.dbname | string | `"datastore"` |  |
| datastore.host | string | `"postgis-svc-headless"` |  |
| datastore.port | int | `5432` |  |
| db.auth.password | string | `"changeMe"` |  |
| db.auth.username | string | `"ckan"` |  |
| db.dbname | string | `"ckan_default"` |  |
| db.host | string | `"postgis-svc-headless"` |  |
| db.port | int | `5432` |  |
| enabled | bool | `true` |  |
| extraEnv | object | `{}` | Extra environment variables. Values need to be quoted. |
| favicon | string | `"/base/images/favicon.ico"` |  |
| fullnameOverride | string | `"ckan"` | Override fullname |
| image.credentials | object | `{"email":"someone@host.com","password":"changeMe","registry":"quay.io","secretName":"ckan-sct-pull","username":"user"}` | Create a image pully secret of type kubernetes.io/dockerconfigjson |
| image.credentials.email | string | `"someone@host.com"` | Image registry eMail address |
| image.credentials.password | string | `"changeMe"` | Image registry password |
| image.credentials.registry | string | `"quay.io"` | Image registry |
| image.credentials.secretName | string | `"ckan-sct-pull"` | Name of the image pull secret to create |
| image.credentials.username | string | `"user"` | Image registry username |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/keitaroinc/ckan"` | Image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[{"name":"ckan-sct-pull"}]` | [Image pull secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress | object | `{"annotations":null,"certManager":{"issuerEmail":"me@example.com","issuerName":"letsencrypt-staging","issuerType":"namespace"},"className":"nginx","domains":[],"enabled":true,"subpath":null}` | Ingress configuration |
| ingress.annotations | string | `nil` | Additional Ingress annotations |
| ingress.certManager.issuerEmail | string | `"me@example.com"` | eMail address for ACME registration with Let's Encrypt. Only used for issuerType = namespace. |
| ingress.certManager.issuerName | string | `"letsencrypt-staging"` | Name of the Issuer to use. For certManager.type = namespace `letsencrypt-staging`, `letsencrypt-prod` and `self-signed` are available. |
| ingress.certManager.issuerType | string | `"namespace"` | Type of [cert-manager](https://cert-manager.io/docs/) Issuer: Use either "namespace" or "cluster". |
| ingress.className | string | `"nginx"` | Name of the [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class) to use in Ingress routes. |
| ingress.domains | list | `[]` | List of [FQDNs](https://de.wikipedia.org/wiki/Fully-Qualified_Host_Name) for this Ingress. Note: All FQDNs will be used for Ingress hosts and TLS certificate. The global setting overwrites this setting. Note: The first domain in the list will be used as CKAN serviceRootURL and MQTT host. |
| ingress.enabled | bool | `true` | Enable/disable ingress |
| ingress.subpath | string | `nil` | Make CKAN available at a subpath. By default caddy will be available from [DOMAIN]/ Don't append or prepend :// or / |
| liveness.failureThreshold | int | `6` |  |
| liveness.initialDelaySeconds | int | `30` |  |
| liveness.periodSeconds | int | `10` |  |
| liveness.timeoutSeconds | int | `10` |  |
| locale.default | string | `"de"` |  |
| locale.filtered_out | string | `"en_GB"` |  |
| locale.offered | string | `"de en"` |  |
| locale.order | string | `"de en pt_BR ja it cs_CZ ca es fr el sv sr sr@latin no sk fi ru de pl nl bg ko_KR hu sa sl lv"` |  |
| maxUploadSizeMB | int | `250` |  |
| nameOverride | string | `nil` | Override name |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.annotations | string | `nil` |  |
| persistence.capacity | string | `"4Gi"` | Storage [capacity](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#capacity) |
| persistence.enabled | bool | `true` |  |
| persistence.storageClassName | string | `nil` | StorageClass to use, leave empty to use default StorageClass. |
| persistence.storagePath | string | `"/var/lib/ckan"` | Mount path of the storage. Omit trailing `/` ! |
| plugins | string | `"envvars image_view text_view recline_view datastore datapusher"` |  |
| podAnnotations | object | `{}` | Additional pod annotations |
| podSecurityContext | object | `{}` |  |
| readiness.failureThreshold | int | `6` |  |
| readiness.initialDelaySeconds | int | `30` |  |
| readiness.periodSeconds | int | `10` |  |
| readiness.timeoutSeconds | int | `10` |  |
| redis.url | string | `"redis://redis-svc-headless:6379/0"` |  |
| replicaCount | int | `1` | Number of replicas. Only used if autoscaling.enabled = false |
| resources.limits.cpu | string | `"500m"` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"250m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| securityContext | object | `{}` |  |
| service.port | int | `5000` | Service port for http |
| service.type | string | `"ClusterIP"` | Type of service for http |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| siteDescription | string | `"This is my CKAN instance for stuff."` |  |
| siteId | string | `"my ckan_instance"` |  |
| siteLogo | string | `"/base/images/group_icons/work.svg"` |  |
| siteTitle | string | `"My CKAN Instance"` |  |
| siteUrl | string | `"https://my-ckan.de"` |  |
| smtp.mailFrom | string | `"postmaster@domain.com"` |  |
| smtp.password | string | `"smtpPassword"` |  |
| smtp.server | string | `"smtpServerURLorIP:port"` |  |
| smtp.startTls | string | `"true"` |  |
| smtp.tls | string | `"enabled"` |  |
| smtp.user | string | `"smtpUser"` |  |
| solr.password | string | `nil` |  |
| solr.url | string | `"http://solr-svc-headless:8983/solr/ckan"` |  |
| solr.user | string | `nil` |  |
| sysadmin.email | string | `"user@example.de"` |  |
| sysadmin.enabled | bool | `true` |  |
| sysadmin.password | string | `"changeMe"` |  |
| sysadmin.user | string | `"admin"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

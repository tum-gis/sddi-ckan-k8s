# ckan

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.9.7](https://img.shields.io/badge/AppVersion-2.9.7-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| auth | object | `{"allow_dataset_collaborators":false,"anon_create_dataset":false,"create_dataset_if_not_in_organization":false,"create_default_api_keys":false,"create_unowned_dataset":false,"create_user_via_api":false,"create_user_via_web":true,"public_activity_stream_detail":true,"public_user_details":true,"roles_that_cascade_to_sub_groups":"admin editor member","user_create_groups":false,"user_create_organizations":false,"user_delete_groups":false,"user_delete_organizations":false}` | CKAN auth settings |
| autoscaling.enabled | bool | `false` | Enable/disable pod autoscaling, if disabled `replicaCount` is used to set number of pods. |
| autoscaling.maxReplicas | int | `5` | Maximum number of replicas |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| component | string | `"frontend"` |  |
| datapusher.callback_url_base | string | `"http://ckan:5000/"` |  |
| datapusher.formats | string | `"csv xls xlsx tsv application/csv application/vnd.ms-excel application/vnd.openxmlform"` |  |
| datapusher.url | string | `"http://datapusher:8000/"` |  |
| dataset.create_on_ui_requires_resources | bool | `false` |  |
| datastore.auth.ro.password | string | `"changeMe"` |  |
| datastore.auth.ro.username | string | `"datastore_ro"` |  |
| datastore.auth.rw.password | string | `"changeMe"` |  |
| datastore.auth.rw.username | string | `"ckan"` |  |
| datastore.dbname | string | `"datastore"` |  |
| datastore.host | string | `"postgis-hl"` |  |
| datastore.port | int | `5432` |  |
| db.auth.password | string | `"changeMe"` | Database password |
| db.auth.username | string | `"ckan"` | Database username |
| db.dbname | string | `"ckan_default"` | Database name |
| db.host | string | `"postgis-hl"` | Database host |
| db.port | int | `5432` | Database port |
| debug | bool | `false` | Enable CKAN debug mode |
| enabled | bool | `true` |  |
| extraEnv | object | `{}` | Extra environment variables. Values need to be quoted. This can be used to overwrite CKAN settings in production.ini. See [ckanext-envvars](https://github.com/okfn/ckanext-envvars) for variable naming conventions. |
| favicon | string | `"/webassets/images/favicon.ico"` | Path to CKAN favicon |
| featured.groups | string | `"dataset online-application online-service project software method device geoobject"` |  |
| featured.orgs | string | `"bayerische-vermessungsverwaltung lehrstuhl-fur-geoinformatik bayern-innovativ"` |  |
| fullnameOverride | string | `"ckan"` | Override fullname |
| image.credentials | object | `{"email":"someone@host.com","password":"changeMe","registry":"quay.io","secretName":"ckan-pull-sct","username":"user"}` | Create a image pully secret of type kubernetes.io/dockerconfigjson |
| image.credentials.email | string | `"someone@host.com"` | Image registry eMail address |
| image.credentials.password | string | `"changeMe"` | Image registry password |
| image.credentials.registry | string | `"quay.io"` | Image registry |
| image.credentials.secretName | string | `"ckan-pull-sct"` | Name of the image pull secret to create |
| image.credentials.username | string | `"user"` | Image registry username |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/keitaroinc/ckan"` | Image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[{"name":"ckan-pull-sct"}]` | [Image pull secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress | object | `{"annotations":null,"certManager":{"issuerEmail":"me@example.com","issuerName":"letsencrypt-staging","issuerType":"namespace"},"className":"nginx","domains":[],"enabled":true}` | Ingress configuration |
| ingress.annotations | string | `nil` | Additional Ingress annotations |
| ingress.certManager.issuerEmail | string | `"me@example.com"` | eMail address for ACME registration with Let's Encrypt. Only used for issuerType = namespace. |
| ingress.certManager.issuerName | string | `"letsencrypt-staging"` | Name of the Issuer to use. For certManager.type = namespace `letsencrypt-staging`, `letsencrypt-prod` and `self-signed` are available. |
| ingress.certManager.issuerType | string | `"namespace"` | Type of [cert-manager](https://cert-manager.io/docs/) Issuer: Use either "namespace" or "cluster". |
| ingress.className | string | `"nginx"` | Name of the [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class) to use in Ingress routes. |
| ingress.domains | list | `[]` | List of [FQDNs](https://de.wikipedia.org/wiki/Fully-Qualified_Host_Name) for this Ingress. Note: All FQDNs will be used for Ingress hosts and TLS certificate. The global setting overwrites this setting. Note: The first domain in the list will be used as CKAN serviceRootURL and MQTT host. |
| ingress.enabled | bool | `true` | Enable/disable ingress |
| liveness.failureThreshold | int | `6` | Failure threshold for the liveness probe |
| liveness.initialDelaySeconds | int | `60` | Initial delay for the liveness probe |
| liveness.periodSeconds | int | `10` | Check interval for the liveness probe |
| liveness.timeoutSeconds | int | `10` | Timeout interval for the liveness probe |
| locale.default | string | `"de"` |  |
| locale.filtered_out | string | `"en_GB"` |  |
| locale.offered | string | `"de en"` |  |
| locale.order | string | `"de en pt_BR ja it cs_CZ ca es fr el sv sr sr@latin no sk fi ru de pl nl bg ko_KR hu sa sl lv"` |  |
| maxUploadSizeMB | int | `250` | Max file upload size in MB. Note: This setting is mapped to the `nginx.ingress.kubernetes.io/proxy-body-size: "600m"` and `nginx.org/client-max-body-size: "600m"` CKAN Ingress annotations too. |
| nameOverride | string | `""` | Override name |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.annotations | string | `nil` | Additional annotations for PVCs Set helm.sh/resource-policy: keep to avoid deletion of PVC on helm upgrade/uninstall |
| persistence.capacity | string | `"4Gi"` | Storage [capacity](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#capacity) |
| persistence.enabled | bool | `true` | Enable/disable persistent data storage. |
| persistence.storageClassName | string | `nil` | StorageClass to use, leave empty to use default StorageClass. |
| persistence.storagePath | string | `"/var/lib/ckan"` | Mount path of the CKAN storage. Omit trailing `/`! This option is used for CKAN__STORAGE_PATH env var too! |
| plugins | string | `""` | Override CKAN plugins/extensions specified in the CKAN image Warning: Only edit this if you know what you are doing. If the plugin list does not match the plugins installed in the image errors can occur. |
| podAnnotations | object | `{}` | Additional pod annotations |
| podSecurityContext | object | `{}` |  |
| preview.direct | string | `"png jpg gif"` |  |
| preview.loadable | string | `"html htm rdf+xml owl+xml xml n3 n-triples turtle plain atom csv tsv rss txt json"` |  |
| readiness.failureThreshold | int | `6` | Failure threshold for the liveness probe |
| readiness.initialDelaySeconds | int | `60` | Initial delay for the liveness probe |
| readiness.periodSeconds | int | `10` | Check interval for the liveness probe |
| readiness.timeoutSeconds | int | `10` | Timeout interval for the liveness probe |
| redis.url | string | `"redis://redis-hl:6379/0"` |  |
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
| siteId | string | `"my_ckan_instance"` |  |
| siteLogo | string | `"/webassets/images/group_icons/work.svg"` | Path to CKAN site logo image |
| siteTitle | string | `"My CKAN instance"` |  |
| siteUrl | string | `"https://my-ckan.de"` | CKAN site url. This should match a domain name of CKAN specified in global.ingress.domains. https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-url |
| smtp.mailFrom | string | `"postmaster@domain.com"` |  |
| smtp.password | string | `"smtpPassword"` |  |
| smtp.server | string | `"smtpServerURLorIP:port"` |  |
| smtp.startTls | string | `"true"` |  |
| smtp.tls | string | `"enabled"` |  |
| smtp.user | string | `"smtpUser"` |  |
| solr.password | string | `nil` |  |
| solr.url | string | `"http://solr-hl:8983/solr/ckan"` |  |
| solr.user | string | `nil` |  |
| startup.failureThreshold | int | `6` | Failure threshold for the startup probe |
| startup.initialDelaySeconds | int | `60` | Inital delay seconds for the startup probe. Note: The CKAN pod may take some time to startup on slow systems, e.g. one testing clusters. Make sure to set this values high enough to avoid the pod being restarted before it has fully initialized. |
| startup.periodSeconds | int | `10` | Check interval for the startup probe |
| startup.timeoutSeconds | int | `10` | Timeout interval for the startup probe |
| sysadmin.email | string | `"user@example.de"` |  |
| sysadmin.enabled | bool | `true` |  |
| sysadmin.password | string | `"changeMe"` |  |
| sysadmin.user | string | `"admin"` |  |
| tolerations | list | `[]` |  |
| webassets | object | `{"path":"/srv/app/data/webassets"}` | Webassets settings |
| webassets.path | string | `"/srv/app/data/webassets"` | Webassets storage path |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

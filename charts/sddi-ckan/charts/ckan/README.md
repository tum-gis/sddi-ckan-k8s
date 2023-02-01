# ckan

![Version: 0.6.2](https://img.shields.io/badge/Version-0.6.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.9.7](https://img.shields.io/badge/AppVersion-2.9.7-informational?style=flat-square)

A Helm chart for SDDI enabled CKAN.

**Homepage:** <https://github.com/tum-gis/sddi-ckan-k8s/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Willenborg | <b.willenborg@tum.de> | <https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/> |

## Source Code

* <https://github.com/tum-gis/sddi-ckan-k8s/tree/main/sddi-ckan/charts/charts/ckan>
* <https://github.com/keitaroinc/docker-ckan>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| auth.allow_dataset_collaborators | bool | `false` | CKAN authorization settings. See [CKAN configuration docs](https://docs.ckan.org/en/latest/maintaining/configuration.html#authorization-settings). |
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
| autoscaling.enabled | bool | `false` | Enable/disable pod autoscaling, if disabled `replicaCount` is used to set number of pods. Check requirements of [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| autoscaling.maxReplicas | int | `5` | Maximum number of replicas |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas |
| autoscaling.targetCPUUtilizationPercentage | string | `nil` | [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| autoscaling.targetMemoryUtilizationPercentage | string | `nil` | [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| component | string | `"ckan"` | Role of CKAN in this chart |
| datapusher.api_token | string | `nil` | See [CKAN Datapusher settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datapusher-settings) |
| datapusher.callback_url_base | string | `"http://ckan:5000/"` | This should be set to cluster internal ckan service domain. # -- [CKAN DataPusher settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-datapusher-callback-url-base) |
| datapusher.formats | string | `"csv xls tsv application/csv"` |  |
| datapusher.url | string | `"http://datapusher:8000/"` | DataPusher endpoint of CKAN. This should be set to the cluster internal DataPusher service domain. |
| datastore.auth.ro.password | string | `"changeMe"` | CKAN datastore read only password, used to build `ckan.datastore.read_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.auth.ro.username | string | `"datastore_ro"` | CKAN datastore read only username, used to build `ckan.datastore.read_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.auth.rw.password | string | `"changeMe"` | CKAN datastore read write passowrd, used to build `ckan.datastore.write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.auth.rw.username | string | `"datastore_rw"` | CKAN datastore read write username, used to build `ckan.datastore.write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.dbname | string | `"datastore"` | CKAN datastore database name, used to build `ckan.datastore.read/write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.host | string | `"postgis-hl"` | CKAN datastore host, used to build `ckan.datastore.read/write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.port | int | `5432` | CKAN datastore port, used to build `ckan.datastore.read/write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| db.auth.password | string | `"changeMe"` | CKAN database password, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| db.auth.username | string | `"ckan"` | CKAN database username, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| db.dbname | string | `"ckan_default"` | CKAN database database name, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| db.host | string | `"postgis-hl"` | CKAN database host, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| db.port | int | `5432` | CKAN database port, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| debug | bool | `false` | Enable CKAN debug mode. Requires additional setup, see [CKAN configuration debug](https://docs.ckan.org/en/latest/maintaining/configuration.html#debug) |
| email.activity_streams_email_notifications | bool | `false` | [CKAN config activity stream](https://docs.ckan.org/en/latest/maintaining/configuration.html#activity-streams-settings) |
| enabled | bool | `true` | Enable/disable CKAN |
| extraEnv | object | `{}` | Extra environment variables. Values need to be quoted. This can be used to overwrite or extend [CKAN settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-configuration-file). See [ckanext-envvars](https://github.com/okfn/ckanext-envvars) for variable naming conventions. |
| favicon | string | `"/webassets/images/favicon.ico"` | Path to CKAN favicon. Custom logos will usually be located in `/webassets/`. See `webassets.path` setting. [CKAN config site_id](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-logo) |
| featured.groups | string | `"dataset online-application online-service project software method device geoobject"` | [CKAN featured groups settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-featured-groups) |
| featured.orgs | string | `"bayerische-vermessungsverwaltung lehrstuhl-fur-geoinformatik bayern-innovativ"` | [CKAN featured orgs settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-featured-orgs) |
| form.create_on_ui_requires_resources | bool | `false` | CKAN form settings, see [CKAN configuration form](https://docs.ckan.org/en/latest/maintaining/configuration.html#form-settings) |
| fullnameOverride | string | `"ckan"` | Override fullname |
| image.pullPolicy | string | `"IfNotPresent"` | [Image pull policy](https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy) |
| image.repository | string | `"ghcr.io/keitaroinc/ckan"` | [Image repository](https://kubernetes.io/docs/concepts/containers/images/) |
| image.tag | string | `""` | Overrides the image tag whose default is the chart `appVersion`. |
| imagePullSecrets | list | `[]` | [Image pull secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | string | `nil` | Additional Ingress annotations |
| ingress.certManager.issuerEmail | string | `"me@example.com"` | eMail address for ACME registration with Let's Encrypt. Only used for issuerType = namespace. |
| ingress.certManager.issuerName | string | `"letsencrypt-staging"` | Name of the Issuer to use. For certManager.type = namespace `letsencrypt-staging`, `letsencrypt-prod` and `self-signed` are available. |
| ingress.certManager.issuerType | string | `"namespace"` | Type of [cert-manager](https://cert-manager.io/docs/) Issuer: Use either "namespace" or "cluster". |
| ingress.className | string | `"nginx"` | Name of the [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class) to use in Ingress routes. |
| ingress.domains | list | `[]` | List of [FQDNs](https://de.wikipedia.org/wiki/Fully-Qualified_Host_Name) for this Ingress. Note: All FQDNs will be used for Ingress hosts and TLS certificate. Note: Set `siteUrl` accordingly! |
| ingress.enabled | bool | `true` | Enable/disable Ingress. |
| ingress.stickySessions.enabled | bool | `true` | Enable/disable sticks sessions, see [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/). |
| ingress.stickySessions.sessionCookie.affinityMode | string | `"balanced"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.changeOnFailure | string | `"true"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.maxAge | string | `"172800"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.name | string | `"route"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.path | string | `"/"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.secure | string | `"false"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| liveness.failureThreshold | int | `6` | Failure threshold for the liveness probe |
| liveness.initialDelaySeconds | int | `20` | Initial delay for the liveness probe |
| liveness.periodSeconds | int | `10` | Check interval for the liveness probe |
| liveness.timeoutSeconds | int | `10` | Timeout interval for the liveness probe |
| locale.default | string | `"de"` | CKAN default locale, see [CKAN internationalization settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#internationalisation-settings) |
| locale.filtered_out | string | `"en_GB"` | CKAN locales filtered out, see [CKAN internationalization settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#internationalisation-settings) |
| locale.offered | string | `"de en"` | CKAN locales offered, see [CKAN internationalization settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#internationalisation-settings) |
| locale.order | string | `"de en pt_BR ja it cs_CZ ca es fr el sv sr sr@latin no sk fi ru de pl nl bg ko_KR hu sa sl lv"` | CKAN locale order, see [CKAN internationalization settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#internationalisation-settings) |
| maxUploadSizeMB | int | `250` | Max file upload size in MB. Note: This setting is mapped to the `nginx.ingress.kubernetes.io/proxy-body-size: "600m"` and `nginx.org/client-max-body-size: "600m"` CKAN Ingress annotations too. |
| nameOverride | string | `""` | Override name |
| nodeSelector | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` | [k8s: Persistent volume access modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) |
| persistence.annotations | string | `nil` | Additional annotations for PVCs Set `helm.sh/resource-policy: keep` to avoid deletion of PVCs on helm upgrade/uninstall |
| persistence.capacity | string | `"4Gi"` | Storage [capacity](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#capacity) |
| persistence.enabled | bool | `true` | Enable/disable persistent data storage. Note: Persistence should only be disabled for testing! With persistence disabled CKAN data is stored in an ephemeral emptyDir volume! |
| persistence.storageClassName | string | `nil` | StorageClass to use, leave empty to use default StorageClass. |
| persistence.storagePath | string | `"/var/lib/ckan"` | Mount path of the CKAN storage. Omit trailing `/`! This option is used for CKAN__STORAGE_PATH env var too! |
| plugins | string | `""` | Override CKAN plugins/extensions specified in the CKAN image Warning: Only edit this if you know what you are doing. If the plugin list does not match the plugins installed in the image errors can occur. See and [CKAN configuration](https://docs.ckan.org/en/latest/maintaining/configuration.html#) [CKAN configuration plugins](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-plugins) |
| podAnnotations | object | `{}` | Additional pod annotations |
| podSecurityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| readiness.failureThreshold | int | `6` | Failure threshold for the liveness probe |
| readiness.initialDelaySeconds | int | `20` | Initial delay for the liveness probe |
| readiness.periodSeconds | int | `10` | Check interval for the liveness probe |
| readiness.timeoutSeconds | int | `10` | Timeout interval for the liveness probe |
| redis.url | string | `"redis://redis-hl:6379/0"` | Redis endpoint for CKAN. This should be set to cluster internal Redis service domain. [CKAN configuration Redis](https://docs.ckan.org/en/latest/maintaining/configuration.html#redis-settings) |
| replicaCount | int | `1` | Number of replicas. Only used if `autoscaling.enabled = false`. Note: `replicaCount > 1` requires to enable persistent data storage (`persistence.enabled = true`). |
| resources.limits.cpu | string | `"500m"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.limits.memory | string | `"1Gi"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.requests.cpu | string | `"250m"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| resources.requests.memory | string | `"256Mi"` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| securityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| service.port | int | `5000` | Service port for http |
| service.type | string | `"ClusterIP"` | Type of service for http |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| siteDescription | string | `"This is my CKAN instance for stuff."` | [CKAN config site_id](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-description) |
| siteId | string | `"default"` | [CKAN config site_id](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-id) |
| siteLogo | string | `"/base/images/ckan-logo.png"` | Path to CKAN site logo image. Custom logos will usually be located in `/webassets/`. See `webassets.path` setting. [CKAN config site_id](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-logo) |
| siteTitle | string | `"My CKAN instance"` | Title of the CKAN instance, displayed in Browser windows/tab name |
| siteUrl | string | `"https://my-ckan.de"` | CKAN site url. This should match a domain name of CKAN specified in `ingress.domains`/`global.ingress.domains`. [CKAN configuration site settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-url) |
| smtp.mailFrom | string | `"postmaster@domain.com"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.password | string | `"smtpPassword"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.server | string | `"smtpServerURLorIP:port"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.startTls | string | `"true"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.tls | string | `"enabled"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.user | string | `"smtpUser"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| solr.password | string | `nil` | # [CKAN configuration Solr user](https://docs.ckan.org/en/latest/maintaining/configuration.html#solr-password) |
| solr.url | string | `"http://solr-hl:8983/solr/ckan"` | Solr endpoint for CKAN. This should be set to cluster internal Solr service domain. [CKAN configuration Solr URL](https://docs.ckan.org/en/latest/maintaining/configuration.html#solr-url) |
| solr.user | string | `nil` | # [CKAN configuration Solr user](https://docs.ckan.org/en/latest/maintaining/configuration.html#solr-user) |
| startup.failureThreshold | int | `20` | Failure threshold for the startup probe |
| startup.initialDelaySeconds | int | `10` | Inital delay seconds for the startup probe. |
| startup.periodSeconds | int | `10` | Check interval for the startup probe |
| startup.timeoutSeconds | int | `10` | Timeout interval for the startup probe |
| sysadmin.email | string | `"user@example.de"` | CKAN admin eMail address |
| sysadmin.enabled | bool | `true` | Enable/disable creating of a CKAN admin user at first startup. |
| sysadmin.password | string | `"changeMe"` | CKAN admin password: Note: Min. password length = 8 chars! |
| sysadmin.user | string | `"admin"` | CKAN admin username |
| tolerations | list | `[]` | [k8S: Taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| webassets.path | string | `"/srv/app/data/webassets/"` | Webassets storage path, see [CKAN webassets settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#webassets-settings) This should point to the location of webassets in the CKAN image |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

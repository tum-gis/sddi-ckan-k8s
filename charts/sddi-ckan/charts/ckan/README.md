# ckan

![Version: 4.0.0](https://img.shields.io/badge/Version-4.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.0](https://img.shields.io/badge/AppVersion-3.0.0-informational?style=flat-square)

A Helm chart for SDDI enabled CKAN.

**Homepage:** <https://github.com/tum-gis/sddi-ckan-k8s/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Willenborg | <b.willenborg@tum.de> | <https://www.asg.ed.tum.de/en/gis/our-team/staff/bruno-willenborg/> |

## Source Code

* <https://github.com/tum-gis/sddi-ckan-k8s/tree/main/sddi-ckan/charts/charts/ckan>
* <https://github.com/tum-gis/ckan-docker>
* <https://github.com/keitaroinc/docker-ckan>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| activityStreams.emailNotifications | bool | `true` | [CKAN config activity stream](https://docs.ckan.org/en/latest/maintaining/configuration.html#activity-streams-settings) |
| activityStreams.enabled | bool | `true` | [CKAN config enable activity streams](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-activity-streams-enabled) |
| affinity | object | `{}` | [k8s: Assign pods to nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| apiToken.algorithm | string | `"HS256"` | [CKAN API token settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#api-token-jwt-algorithm) |
| apiToken.decodeSecret | string | `nil` | [CKAN API token settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#api-token-jwt-decode-secret): If left empty, a random 64 char alpha numeric string is generated. **Note:** In a production environment the default needs to be overwritten. Check the docs! Depending on `apiToken.algorithm` additional restrictions apply to this settings. |
| apiToken.encodeSecret | string | `nil` | [CKAN API token settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#api-token-jwt-encode-secret): If left empty, a random 64 char alpha numeric string is generated. **Note:** In a production environment the default needs to be overwritten. Check the docs! Depending on `apiToken.algorithm` additional restrictions apply to this settings. |
| apiToken.nBytes | int | `64` | [CKAN API token settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#api-token-nbytes) |
| auth.allow_dataset_collaborators | bool | `false` | CKAN authorization settings. See [CKAN configuration docs](https://docs.ckan.org/en/latest/maintaining/configuration.html#authorization-settings). |
| auth.anon_create_dataset | bool | `false` |  |
| auth.create_dataset_if_not_in_organization | bool | `false` |  |
| auth.create_default_api_keys | bool | `false` |  |
| auth.create_unowned_dataset | bool | `false` |  |
| auth.create_user_via_api | bool | `false` |  |
| auth.create_user_via_web | bool | `false` |  |
| auth.public_activity_stream_detail | bool | `true` |  |
| auth.public_user_details | bool | `false` |  |
| auth.roles_that_cascade_to_sub_groups | string | `"admin editor member"` |  |
| auth.user_create_groups | bool | `false` |  |
| auth.user_create_organizations | bool | `false` |  |
| auth.user_delete_groups | bool | `false` |  |
| auth.user_delete_organizations | bool | `false` |  |
| autoscaling.enabled | bool | `false` | Enable/disable pod autoscaling, if disabled `replicaCount` is used to set number of pods. Check requirements of [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| autoscaling.maxReplicas | int | `5` | Maximum number of replicas **Note:** Running multiple replicas requires to enable persistent data storage (`persistence.enabled = true`) and, if Pods run on different nodes, a storage that supports RWX. |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas. **Note:** Running multiple replicas requires to enable persistent data storage (`persistence.enabled = true`) and, if Pods run on different nodes, a storage that supports RWX. |
| autoscaling.targetCPUUtilizationPercentage | string | `nil` | [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| autoscaling.targetMemoryUtilizationPercentage | string | `nil` | [HorizontalPodAutoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/). |
| backgroundImage | string | `"../base/images/hero.jpg"` | Set URL or path to [CKAN SDDI background image](https://github.com/tum-gis/ckanext-grouphierarchy-sddi#personalisation). |
| clamav.enabled | bool | `false` | [Enable/disable ClamAV extension settings](https://github.com/DataShades/ckanext-clamav) **Note:** These setting only have effect, when the ClamAV extension is installed in the CKAN image. This option does not enable/disable the ClamAV extension in the image. |
| clamav.host | string | `"clamav"` | [ClamAV TCP/IP hostname](https://github.com/DataShades/ckanext-clamav#config-settings) |
| clamav.port | int | `3310` | [ClamAV TCP/IP hostname](https://github.com/DataShades/ckanext-clamav#config-settings) |
| clamav.socketType | string | `"tcp"` | [ClamAV connection mechanism](https://github.com/DataShades/ckanext-clamav#config-settings): For this chart `tcp` is the only supported option. |
| clamav.timeout | int | `3600` | [ClamAV connection timeout](https://github.com/DataShades/ckanext-clamav#config-settings) |
| clamav.uploadUnscanned | string | `"False"` | [Decide, if unscanned files are uploaded or not](https://github.com/DataShades/ckanext-clamav#config-settings) |
| component | string | `"ckan"` | Role of CKAN in this chart |
| datapusher.apiToken | string | `nil` | Datapusher API token, see [CKAN Datapusher settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datapusher-settings) |
| datapusher.callback_url_base | string | `"http://ckan:5000/"` | This should be set to cluster internal ckan service domain. [CKAN DataPusher settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-datapusher-callback-url-base) |
| datapusher.formats | string | `"csv xls tsv application/csv"` |  |
| datapusher.url | string | `"http://datapusher:8000/"` | DataPusher endpoint of CKAN. This should be set to the cluster internal DataPusher service domain. |
| datastore.auth.ro.password | string | `"changeMe"` | CKAN datastore read only password, used to build `ckan.datastore.read_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.auth.ro.username | string | `"datastore_ro"` | CKAN datastore read only username, used to build `ckan.datastore.read_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.auth.rw.password | string | `"changeMe"` | CKAN datastore read write password, used to build `ckan.datastore.write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.auth.rw.username | string | `"datastore_rw"` | CKAN datastore read write username, used to build `ckan.datastore.write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.dbname | string | `"datastore"` | CKAN datastore database name, used to build `ckan.datastore.read/write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.host | string | `"postgis"` | CKAN datastore host, used to build `ckan.datastore.read/write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| datastore.port | int | `5432` | CKAN datastore port, used to build `ckan.datastore.read/write_url` see [CKAN datastore settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#datastore-settings) |
| db.auth.password | string | `"changeMe"` | CKAN database password, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| db.auth.username | string | `"ckan"` | CKAN database username, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| db.dbname | string | `"ckan_default"` | CKAN database database name, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| db.host | string | `"postgis"` | CKAN database host, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| db.port | int | `5432` | CKAN database port, used to build `sqlalchemy.url` see [CKAN database settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#database-settings) |
| defaultViews | string | See [`values.yml`](values.yml) for the default values. | [CKAN config dafault_views](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-views-default-views): **Note**: Make sure the required view plugins are loaded! |
| enabled | bool | `true` | Enable/disable CKAN |
| extraEnv | object | `{}` | Extra environment variables. Values need to be quoted. This can be used to overwrite or extend [CKAN settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-configuration-file). See [ckanext-envvars](https://github.com/okfn/ckanext-envvars) for variable naming conventions. |
| extraInitContainers | list | `[]` | Sets additional [`initContainers`](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/). The initContainers specified here, are appended to the ones specified in `initContainers`. |
| extraVolumeMounts | list | `[]` | Sets additional [`volumeMounts`](https://kubernetes.io/docs/concepts/storage/volumes). The volumeMounts specified here, are appended to the ones specified in `volumeMounts`. |
| extraVolumes | list | `[]` | Sets additional [`volumes`](https://kubernetes.io/docs/concepts/storage/volumes). The volumes specified here, are appended to the ones specified in `volumes`. |
| favicon | string | `"/base/images/ckan.ico"` | Path to CKAN favicon. Custom logos will be located in e.g. `/webassets/`. See `webassets.path` setting. [CKAN config site_id](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-logo) |
| featured.groups | string | `"dataset online-application online-service project software method device geoobject"` | [CKAN featured groups settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-featured-groups) |
| featured.orgs | string | `"bayerische-vermessungsverwaltung lehrstuhl-fur-geoinformatik bayern-innovativ"` | [CKAN featured orgs settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-featured-orgs) |
| form.create_on_ui_requires_resources | bool | `true` | CKAN form settings, see [CKAN configuration form](https://docs.ckan.org/en/latest/maintaining/configuration.html#form-settings) |
| fullnameOverride | string | `"ckan"` | Override fullname |
| image.pullPolicy | string | `"IfNotPresent"` | [Image pull policy](https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy) |
| image.repository | string | `"ghcr.io/tum-gis/ckan-sddi"` | [Image repository](https://kubernetes.io/docs/concepts/containers/images/) |
| image.tag | string | `""` | Overrides the image tag whose default is the chart `appVersion`. |
| imagePullSecrets | list | `[]` | [Image pull secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{"nginx.ingress.kubernetes.io/proxy-connect-timeout":"360","nginx.ingress.kubernetes.io/proxy-read-timeout":"360","nginx.ingress.kubernetes.io/proxy-send-timeout":"360"}` | Additional Ingress annotations |
| ingress.annotations."nginx.ingress.kubernetes.io/proxy-connect-timeout" | string | `"360"` | Additional Ingress annotation for e.g. CORS, timeouts, SSL settings. See [nginx-ingress annotations docs](https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/nginx-configuration/annotations.md) for more. |
| ingress.certManager.issuerEmail | string | `"me@example.com"` | eMail address for ACME registration with Let's Encrypt. Only used for issuerType = namespace. |
| ingress.certManager.issuerName | string | `"letsencrypt-production"` | Name of the Issuer to use. For certManager.type = namespace `letsencrypt-staging`, `letsencrypt-production` and `self-signed` are available. |
| ingress.certManager.issuerType | string | `"namespace"` | Type of [cert-manager](https://cert-manager.io/docs/) Issuer: Use either "namespace" or "cluster". |
| ingress.className | string | `"nginx"` | Name of the [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class) to use in Ingress routes. |
| ingress.cors.enabled | bool | `true` | Enable/disable [CORS](https://de.wikipedia.org/wiki/Cross-Origin_Resource_Sharing). See [ingress-nginx cors settings](https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/nginx-configuration/annotations.md#enable-cors) for details on CORS configuration and default settings. Use `ingress.annotations` to overwrite the default configuration annotations. |
| ingress.domains | list | `[]` | List of [FQDNs](https://de.wikipedia.org/wiki/Fully-Qualified_Host_Name) for this Ingress. Note: All FQDNs will be used for Ingress hosts and TLS certificate. Note: Set `siteUrl` accordingly! |
| ingress.enabled | bool | `true` | Enable/disable Ingress. |
| ingress.stickySessions.enabled | bool | `false` | Enable/disable sticks sessions, see [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/). |
| ingress.stickySessions.sessionCookie.affinityMode | string | `"balanced"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.changeOnFailure | string | `"true"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.maxAge | string | `"172800"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.name | string | `"route"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.path | string | `"/"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.stickySessions.sessionCookie.secure | string | `"false"` | [Nginx Ingress Controller Sticky sessions](https://kubernetes.github.io/ingress-nginx/examples/affinity/cookie/) |
| ingress.tls.secretName | string | `nil` | Specify a custom tls secret name. This overwrites `global.ingress.tls.secretName`. |
| initContainers | list | See `values.yml` for the list of default initContainers. | Sets [`initContainers`](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/). Set to `[]` to disable the default initContainers. Set to any list of initContainer definitions to overwrite the default initContainers. Use `extraInitContainers` to extend the default initContainers. |
| licensesGroupUrl | string | See [`values.yml`](values.yml) for the default values. | [CKAN licences group url](https://docs.ckan.org/en/latest/maintaining/configuration.html#licenses-group-url): A URL pointing to a JSON file containing a list of license objects. |
| liveness.failureThreshold | int | `6` | Failure threshold for the liveness probe |
| liveness.initialDelaySeconds | int | `20` | Initial delay for the liveness probe |
| liveness.periodSeconds | int | `10` | Check interval for the liveness probe |
| liveness.timeoutSeconds | int | `10` | Timeout interval for the liveness probe |
| locale.default | string | `"de"` | CKAN default locale, see [CKAN internationalization settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#internationalisation-settings) |
| locale.filtered_out | string | `"en_GB"` | CKAN locales filtered out, see [CKAN internationalization settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#internationalisation-settings) |
| locale.offered | string | `"de en"` | CKAN locales offered, see [CKAN internationalization settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#internationalisation-settings) |
| locale.order | string | See [`values.yml`](values.yml) for the default values. | CKAN locale order, see [CKAN internationalization settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#internationalisation-settings) |
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
| preview.imageFormats | string | `"png jpeg jpg gif"` | [CKAN config ImageView](https://docs.ckan.org/en/latest/maintaining/configuration.html#image-view-settings): Image preview formats. |
| preview.jsonFormats | string | `"json"` | [CKAN config TextView](https://docs.ckan.org/en/latest/maintaining/configuration.html#text-view-settings): JSON preview formats. |
| preview.jsonpFormats | string | `"jsonp"` | [CKAN config TextView](https://docs.ckan.org/en/latest/maintaining/configuration.html#text-view-settings): JSONP preview formats. |
| preview.textFormats | string | `"txt plain"` | [CKAN config TextView](https://docs.ckan.org/en/latest/maintaining/configuration.html#text-view-settings): Text preview formats. |
| preview.xmlFormats | string | `"xml rdf rss"` | [CKAN config TextView](https://docs.ckan.org/en/latest/maintaining/configuration.html#text-view-settings): XML preview formats. |
| readiness.failureThreshold | int | `6` | Failure threshold for the liveness probe |
| readiness.initialDelaySeconds | int | `20` | Initial delay for the liveness probe |
| readiness.periodSeconds | int | `10` | Check interval for the liveness probe |
| readiness.timeoutSeconds | int | `10` | Timeout interval for the liveness probe |
| redis.url | string | `"redis://redis-hl:6379/0"` | Redis endpoint for CKAN. This should be set to cluster internal Redis service domain. [CKAN configuration Redis](https://docs.ckan.org/en/latest/maintaining/configuration.html#redis-settings) |
| replicaCount | int | `1` | Number of replicas. Only used if `autoscaling.enabled = false`. **Note:** Running multiple replicas requires to enable persistent data storage (`persistence.enabled = true`) and, if Pods run on different nodes, a storage that supports RWX. |
| resources | object | `{}` | [k8s: Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| sddiInitDataJson | string | `"init_data.json"` | Local path or URL to File path or URL to [CKAN SDDI `init_data.json`](https://github.com/tum-gis/ckanext-grouphierarchy-sddi/blob/main/ckanext/grouphierarchy/init_data.json). This file allows to specify pre-defined set of SDDI CKAN main categories, topics, and organizations. |
| security.redis.db | int | `1` |  |
| security.redis.host | string | `"redis-hl"` |  |
| security.redis.port | int | `6379` |  |
| securityContext | object | `{}` | [k8s: Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| service.port | int | `5000` | Service port for http |
| service.type | string | `"ClusterIP"` | Type of service for http |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| session.beakerSamesite | string | `nil` | defaults to "Lax" if left empty. |
| session.beakerSessionHttpOnly | string | `nil` | defaults to `True` if left empty. |
| session.beakerSessionKey | string | `"ckan-session"` | [CKAN beaker session key](https://docs.ckan.org/en/latest/maintaining/configuration.html#beaker-session-key), defaults to *ckan* if left empty. |
| session.beakerSessionSecret | string | `nil` | [CKAN beaker session secret](https://docs.ckan.org/en/latest/maintaining/configuration.html#beaker-session-secret): If left empty, a [64 char random AlphaNum](https://docs.gomplate.ca/functions/random/#random-alphanum) is generated. **Note:** In a cluster environment this values need to be the same on each instance. |
| session.beakerSessionSecure | string | `nil` | defaults to `False` if left empty. |
| session.beakerSessionTimeout | string | `nil` | defaults to 600 if left empty. |
| session.beakerSessionType | string | `nil` | defaults to "cookie"  if left empty. |
| session.beakerSessionValidateKey | string | `nil` | [CKAN beaker session validate key](https://docs.ckan.org/en/latest/maintaining/configuration.html#beaker-session-validate-key): If left empty, a [64 char random AlphaNum](https://docs.gomplate.ca/functions/random/#random-alphanum) is generated. **Note:** In a cluster environment this values need to be the same on each instance. |
| siteAbout | string | `"My CKAN about info. You can use Markdown here."` | [CKAN config about](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-about) |
| siteDescription | string | `"This is my SDDI CKAN instance description."` | [CKAN config site_id](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-description) |
| siteId | string | `"default"` | [CKAN config site_id](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-id) |
| siteIntroParagraph | string | `"This is the intro paragraph text to my SDDI CKAN instance."` | Set [CKAN SDDI intro paragraph](https://github.com/tum-gis/ckanext-grouphierarchy-sddi#personalisation) |
| siteIntroText | string | `"This is the intro text to my SDDI CKAN instance."` | [CKAN config intro text](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-intro-text) |
| siteLogo | string | `"/base/images/logo_left.png"` |  |
| siteTitle | string | `"My SDDI CKAN instance"` | Title of the CKAN instance, displayed in Browser windows/tab name |
| siteUrl | string | `"https://my-ckan.de"` | CKAN site url. This should match a domain name of CKAN specified in `ingress.domains`/`global.ingress.domains` and include the protocol e.g. (`https://my.domain.de`). [CKAN configuration site settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-site-url) |
| smtp.emailTo | string | `"None"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.errorEmailFrom | string | `"None"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.mailFrom | string | `"postmaster@domain.com"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.password | string | `"smtpPassword"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.replyTo | string | `"None"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| smtp.server | string | `"smtpServerURLorIP:port"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) **Note:** To use SSL auth, omit the port in the server string, if it is the default port 465. Also make sure to set `smtp.startTls = True`. |
| smtp.startTls | string | `"True"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) **Note:** To use SSL auth, make sure this settings is set to `True`. See the note for `smtp.server` too. |
| smtp.user | string | `"smtpUser"` | [CKAN SMTP settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#email-settings) |
| solr.password | string | `nil` | # [CKAN configuration Solr user](https://docs.ckan.org/en/latest/maintaining/configuration.html#solr-password) |
| solr.url | string | `"http://solr-hl:8983/solr/ckan"` | Solr endpoint for CKAN. This should be set to cluster internal Solr service domain. [CKAN configuration Solr URL](https://docs.ckan.org/en/latest/maintaining/configuration.html#solr-url) |
| solr.user | string | `nil` | # [CKAN configuration Solr user](https://docs.ckan.org/en/latest/maintaining/configuration.html#solr-user) |
| startup.failureThreshold | int | `200` | Failure threshold for the startup probe |
| startup.initialDelaySeconds | int | `2` | Inital delay seconds for the startup probe. |
| startup.periodSeconds | int | `2` | Check interval for the startup probe |
| startup.timeoutSeconds | int | `2` | Timeout interval for the startup probe |
| sysadmin.email | string | `"user@example.de"` | CKAN admin eMail address |
| sysadmin.enabled | bool | `true` | Enable/disable creating of a CKAN admin user at first startup. |
| sysadmin.password | string | `"changeMe"` | CKAN admin password: Note: Min. password length = 8 chars! |
| sysadmin.user | string | `"admin"` | CKAN admin username |
| tolerations | list | `[]` | [k8S: Taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| volumeMounts | list | See [`values.yml`](values.yml) for the list of default volumeMounts. | Sets [`volumeMounts`](https://kubernetes.io/docs/concepts/storage/volumes). Set to `[]` to disable the default volumeMounts. Set to any list of volumeMount definitions to overwrite the default volumeMounts. Use `extraVolumeMounts` to extend the default volumeMounts. |
| volumes | list | See [`values.yml`](values.yml) for the list of default volumes. | Sets [`volumes`](https://kubernetes.io/docs/concepts/storage/volumes). Set to `[]` to disable the default volumes. Set to any list of volume definitions to overwrite the default volumes. Use `extraVolumes` to extend the default volumes. |
| webassets.path | string | `nil` | Webassets storage path, see [CKAN webassets settings](https://docs.ckan.org/en/latest/maintaining/configuration.html#webassets-settings) This should point to the location of webassets in the CKAN image. The path may vary depending on the CKAN Docker image used. |


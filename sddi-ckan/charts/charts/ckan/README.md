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
| favicon | string | `"/base/images/favicon.ico"` |  |
| http.domain | string | `nil` |  |
| http.subpath | string | `nil` |  |
| image.credentials.email | string | `"someone@host.com"` |  |
| image.credentials.password | string | `"sillyness"` |  |
| image.credentials.registry | string | `"quay.io"` |  |
| image.credentials.secretName | string | `"ckan-sct-pull"` |  |
| image.credentials.username | string | `"someone"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/keitaroinc/ckan"` |  |
| image.tag | string | `"2.9.5"` |  |
| imagePullSecrets[0].name | string | `"ckan-sct-pull"` |  |
| ingress.certManager.issuer | string | `"letsencrypt-staging"` |  |
| liveness.failureThreshold | int | `6` |  |
| liveness.initialDelaySeconds | int | `30` |  |
| liveness.periodSeconds | int | `10` |  |
| liveness.timeoutSeconds | int | `10` |  |
| loadBalancer.enabled | bool | `false` |  |
| locale.default | string | `"de"` |  |
| locale.filtered_out | string | `"en_GB"` |  |
| locale.offered | string | `"de en"` |  |
| locale.order | string | `"de en pt_BR ja it cs_CZ ca es fr el sv sr sr@latin no sk fi ru de pl nl bg ko_KR hu sa sl lv"` |  |
| maxUploadSizeMB | int | `250` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.annotations | string | `nil` |  |
| persistence.capacity | string | `"4Gi"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.storagePath | string | `"/var/lib/ckan"` |  |
| plugins | string | `"envvars image_view text_view recline_view datastore datapusher"` |  |
| readiness.failureThreshold | int | `6` |  |
| readiness.initialDelaySeconds | int | `30` |  |
| readiness.periodSeconds | int | `10` |  |
| readiness.timeoutSeconds | int | `10` |  |
| redis.url | string | `"redis://redis-svc-headless:6379/0"` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"500m"` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"250m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
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

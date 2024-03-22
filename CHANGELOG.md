# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
Versions are prefixed with `sddi-ckan-` due to usage of
[chart-releaser-action](https://github.com/helm/chart-releaser-action).
For releases `< 1.0.0` minor version step indicate breaking changes.

## [sddi-ckan-3.0.0-beta1] - 2024-02-24

## Added

- Allow setting CKAN `initContainers`, `extraInitContainers`, `volumes`, `extraVolumes`. tum-gis/sddi-ckan-k8s#32
- Allow setting Solr `initContainers`, `extraInitContainers`. tum-gis/sddi-ckan-k8s#33
- Basic example for OpenShift usage, see [here](examples/open-shift).

### Changed

- Revert 313c09c: Relax Solr security context for OpenShift compatibility. Fixing file permissions is now done using
  an `initContainer`, that can be disabled for OpenShift compatibility. tum-gis/sddi-ckan-k8s#24, tum-gis/sddi-ckan-k8s#33
- Upgrade Solr `8.11.2` -> `9.2.1`: **Warning**: The upgrade from 8.x to Solr 9.x introduces several major changes that you should be
  aware of before upgrading. Make sure to thoroughly go though the
  [docs for upgrading Solr](https://solr.apache.org/guide/solr/latest/upgrade-notes/solr-upgrade-notes.html#upgrading-to-9-x-from-8-x-releases)
  for possible breaking changes or necessary manual migration steps.
  - [Major changes in Solr9](https://solr.apache.org/guide/solr/latest/upgrade-notes/major-changes-in-solr-9.html)
  - If upgrading from `v2.x.x` no action should be required.
  - You should [Recrate the search index after upgrade](https://solr.apache.org/guide/solr/latest/upgrade-notes/major-changes-in-solr-9.html#reindexing-after-upgrade)
    - See [`ckan search-index rebuild`](https://docs.ckan.org/en/latest/maintaining/cli.html#search-index-search-index-commands)
- Upgrade Redis `7.0.8` -> `7.2.4`
- Upgrade Postgresql/PostGIS `14-3.3` -> `14-3.4`

### Fixed

- CKAN ingress `pathType` warning

## [sddi-ckan-2.0.0] - 2023-11-02

This release updates the sddi-ckan Docker image to `v2.0.0` bringing several security improvements
and some breaking changes too. Make sure to check the
[CHANGELOG](https://github.com/tum-gis/ckan-docker/blob/2.0.0/CHANGELOG.md) for all details.

[@klml](https://github.com/klml), [@eidottermihi](https://github.com/eidottermihi) made their first contributions!

## Breaking

- Removed default resource requirements/limits for all services. tum-gis/sddi-ckan-k8s#28, tum-gis/sddi-ckan-k8s#29

## Added

- Allow configuration of images used for init containers. tum-gis/sddi-ckan-k8s#24
  - `ckan.initContainers.initdata.image`
  - `ckan.initContainers.pgready.image`
  - `datapusher.initContainers.pgready.image`

### Changed

- Relax Solr security context for OpenShift compatibility. tum-gis/sddi-ckan-k8s#24
- Bump SDDI CKAN Image `1.2.0` --> `2.0.0`, see
  [CHANGELOG](https://github.com/tum-gis/ckan-docker/blob/2.0.0/CHANGELOG.md) for more.

### Fixed

- Multiple session variables had no effect due to false ENV var names. Affected options:
  - `ckan.session.beakerSessionKey`
  - `ckan.session.beakerSessionType`
  - `ckan.session.beakerSessionTimeout`
  - `ckan.session.beakerSessionSecure`
  - `ckan.session.beakerSamesite`
  - `ckan.session.beakerSessionHttpOnly`
  - `ckan.session.beakerSessionValidateKey`

### Security

- Changed default setting of `ckan.auth.public_user_details` to `False` to prevent
  unauthorized leakage of user details. The `/user` page will now return `403 Forbidden`
  by default.

## [sddi-ckan-1.2.2] - 2023-08-24

## Added

- Allow to specify a custom secret name for Ingress TLS secrets using `global.ingress.tls.secretName`
  or `ckan.ingress.tls.secretName`. **Note:** The default settings for the TLS secret name changed too.
  If you are using a custom certificate, make sure to overwrite the secret name accordingly. tum-gis/sddi-ckan-k8s#19

### Changed

- Relax `kubeVersion` constraints of chart to allow  custom/pre-release Kubernetes versions. tum-gis/sddi-ckan-k8s#20

## [sddi-ckan-1.2.1] - 2023-08-21

### Fixed

- Fixed error in SQL alchemy database URL
- Several minor docs fixes

## [sddi-ckan-1.2.0] - 2023-08-21

**Warning:** Do not use this version, as it contains an error preventing that breaks CKAN's database connection.

### Added

- Added config options in preparation for CKAN v2.10:
  - `ckan.session.beakerSessionValidateKey`
  - `ckan.session.beakerSessionType`
  - `ckan.session.beakerSessionTimeout`
  - `ckan.session.beakerSessionSecure`
  - `ckan.session.beakerSamesite`
  - `ckan.session.beakerSessionHttpOnly`

### Changed

- Update CKAN to `2.9.9`

## [sddi-ckan-1.1.7] - 2023-08-09

### Fixed

- Fixed wrong URL to license file.

## [sddi-ckan-1.1.6] - 2023-08-07

**Warning**: Do not use this version and if you do please upgrade. Due to a false URL and _Internal server error_
is displayed when navigating to the _Datasets_ view of CKAN.

### Fixed

- Fix false `appVersion` in chart.

## [sddi-ckan-1.1.5] - 2023-08-07

### Fixed

- Fix false variable for `ckan.licensesGroupUrl` in CKAN configmap.

## [sddi-ckan-1.1.4] - 2023-08-06

### Added

- Added `ckan.licensesGroupUrl` config option.

### Changed

- Bump SDDI CKAN Image `1.1.2` --> `1.1.3`

  - Removed default filter "read", see tum-gis/ckanext-grouphierarchy-sddi#17
  - [Extended licenses list](https://github.com/tum-gis/ckanext-grouphierarchy-sddi/blob/main/ckanext/grouphierarchy/licenses_SDDI.json) required for SDDI added.

### Removed

- Removed `ckan.maintenanceMode` option, which hab no effect.

## [sddi-ckan-1.1.3] - 2023-07-24

### Changed

- Bump SDDI CKAN Image `1.1.1` --> `1.1.2`

  - Added delete button to remove existing resources. tum-gis/ckanext-relation-sddi#10

## [sddi-ckan-1.1.2] - 2023-07-19

### Added

- Added `ckan.sddiInitDataJson` option to allow specifying custom CKAN SDDI categories,
  topics, and organizations. See [here](https://github.com/tum-gis/ckanext-grouphierarchy-sddi#main-categories-and-topics)
  for more docs on this feature. Resolves tum-gis/sddi-ckan-k8s#8

### Fixed

- Fixed default `favicon.ico` path, resolves tum-gis/sddi-ckan-k8s#6

## [sddi-ckan-1.1.1] - 2023-07-06

### Changed

- Bump SDDI CKAN Image `1.1.0` --> `1.1.1`
  - New configuration options for styling are available, see
    [here](https://github.com/tum-gis/ckanext-grouphierarchy-sddi#personalisation). Resolves tum-gis/sddi-ckan-k8s#4, and partially tum-gis/sddi-ckan-k8s#8

## [sddi-ckan-1.1.0] - 2023-06-28

### Changed

- Bump SDDI CKAN Image `1.0.0` --> `1.1.0`

### Fixed

- Fixed docs for `ckan.session.beakerSessionSecret`

## [sddi-ckan-1.0.3] - 2023-06-21

### Added

- Exposed CKAN settings `email_to`, `error_email_from` in values

### Changed

- Improved documentation for SMTP settings

## [sddi-ckan-1.0.2] - 2023-06-12

### Fixed

- Removed unused option `ckan.smtp.tls`: tum-gis/sddi-ckan-k8s#5

## [sddi-ckan-1.0.1] - 2023-05-22

### Changed

- Bump SDDI CKAN Image `1.0.0` --> `1.0.1`

## [sddi-ckan-1.0.0] - 2023-04-28

### Added

- Added init containers to CKAN and Datapusher to wait for DB to be ready (`pg_isready`)
- Trigger chart releaser on pushes to `release/**` to enable pre-releases
- Added setting to enable/disable MAINTENANCE_MODE, which is supported by some CKAN Docker image.
  - Maintenance mode skips CKAN initialization steps like database init.
  - Supported e.g. by `keitaroinc/docker-ckan`, `ckan/ckan-base`, `tum-gis/ckan-docker` images
- Expose config options `ckan.views.default_views`, `ckan.preview.text_formats`, `ckan.preview.xml_formats`,
  `ckan.preview.json_formats`, `ckan.preview.jsonp_formats`, `ckan.preview.image_formats`
  in values.
- Added `ckan.ingress.cors.enabled` option to enable/disable [CORS](https://de.wikipedia.org/wiki/Cross-Origin_Resource_Sharing).

### Changed

- Use own Datapusher image to support database backend
- Updated database initialization for Datapusher database backend
- Don't use PostGIS headless service by default
- Changed default logo from CKAN to SDDI logo
- Reduced default resource requests for `postgis` and `solr`
- Several minor docs changes
- Downgrade to Postgres 14 as Postgres 15 is not jet supported by `psycopg2==2.9.3`
- Enable [`recline_view`](https://docs.ckan.org/en/2.9/maintaining/data-viewer.html#data-explorer)
  as default data view
- Use `ghcr.io/tum-gis/ckan-sddi:1.0.0` CKAN image

### Removed

- Dropped default values for `ckan.webassets.path` for better support of different CKAN Docker images.
- Removed debug mode from values, as it has no effect. Debug mode needs to be enabled using
  a CKAN image with debug dependencies installed and `debug: true` in `ckan.ini`. See
  [docs](https://docs.ckan.org/en/latest/maintaining/configuration.html#debug) for more.

### Fixed

- `ckan.datapusher.api_token` was not set as env var
- Only set `CKAN__WEBASSETS__PATH`, if a values is specified.
- Duplicate annotation name in Datapusher deployment preventing pod restart on config change

### Security

- Reworked datastore database initialization to avoid superuser rights for datastore user

## [sddi-ckan-0.5.0] - 2023-02-23

### Changed

- Minor docs update for CKAN api token values
- Update PostGIS chart to PostgreSQL 15, PostGIS 3.3
- Reworked database initialization scripts
  - Made role and database creation idempotent
  - DB users for CKAN and datastore databases are no longer superusers.
    Separate credentials for the postgres database superuser can now be
    specified
- Set chart `appVersion` according to CKAN SDDI image version

## [sddi-ckan-0.4.0] - 2320-02-22

### Added

- Expose [CKAN API token](https://docs.ckan.org/en/latest/maintaining/configuration.html#api-token-settings) setting

### Changed

- Removed unused values for PostGIS
- Some minor docs changes

### Fixed

- Removed duplicate env var from `ckan-configMap-env.yml`
- Fixed setting Beaker settings not enabled if sysadmin user creation disabled

## [sddi-ckan-0.3.2] - 2023-02-14

### Changed

- Updated examples
- Updated provisioning example
- Various smaller documentation updates

## [sddi-ckan-0.3.1] - 2023-02-09

### Added

- Expose `beaker.session.key` config option
- Add some defaults for enabling/disabling subcharts

### Fixed

- Fixed wrong indent of `session.*` in CKAN `values.yml`

### Security

### Deprecated

## [sddi-ckan-0.3.0] - 2023-02-09

### Added

- Allow configure or auto-generation of [`beaker.session.secret`](https://docs.ckan.org/en/latest/maintaining/configuration.html#beaker-session-secret)

### Change

- Changed CKAN default Docker image to [ckan docker SDDI repo](https://github.com/tum-gis/ckan-docker/)

## [sddi-ckan-0.2.2] - 2023-02-09

### Added

- Exposed `ckan.site_intro_text`, `ckan.site_about` and `ckan.activity_streams_enabled`

### Fixed

- Expose CKAN [smtp_reply_to](https://docs.ckan.org/en/2.9/maintaining/configuration.html#smtp-reply-to) in env var
- Fixed env var `CKAN__DATAPUSHER__FORMATS`

## [sddi-ckan-0.2.1] - 2023-02-08

### Added

- Expose CKAN [smtp_reply_to](https://docs.ckan.org/en/2.9/maintaining/configuration.html#smtp-reply-to)
  in `values.yml`

### Changed

- Docs updates

## [sddi-ckan-0.2.0] - 2023-01-31

### Changed

- Minor docs changes
- Minor changes to default config

## [sddi-ckan-0.1.0] - 2023-01-31

- Initial release to helm repo

### Changed

- Use Solr image with spatial support: `ckan/ckan-solr:2.9-solr8` -> `ckan/ckan-solr:2.9-solr8-spatial`

## [template] - YYYY-MM-DD

### Breaking changes

### Added

### Changed

### Removed

### Fixed

### Security

### Deprecated

### Known issues

[Unreleased]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-2.0.1...HEAD

[sddi-ckan-3.0.0-beta1]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-2.0.0...sddi-ckan-3.0.0-beta1
[sddi-ckan-2.0.0]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.2.2...sddi-ckan-2.0.0
[sddi-ckan-1.2.2]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.2.1...sddi-ckan-1.2.2
[sddi-ckan-1.2.1]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.2.0...sddi-ckan-1.2.1
[sddi-ckan-1.2.0]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.1.7...sddi-ckan-1.2.0
[sddi-ckan-1.1.7]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.1.6...sddi-ckan-1.1.7
[sddi-ckan-1.1.6]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.1.5...sddi-ckan-1.1.6
[sddi-ckan-1.1.5]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.1.4...sddi-ckan-1.1.5
[sddi-ckan-1.1.4]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.1.3...sddi-ckan-1.1.4
[sddi-ckan-1.1.3]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.1.2...sddi-ckan-1.1.3
[sddi-ckan-1.1.2]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.1.1...sddi-ckan-1.1.2
[sddi-ckan-1.1.1]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.1.0...sddi-ckan-1.1.1
[sddi-ckan-1.1.0]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.0.3...sddi-ckan-1.1.0
[sddi-ckan-1.0.3]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.0.1...sddi-ckan-1.0.3
[sddi-ckan-1.0.2]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.0.1...sddi-ckan-1.0.2
[sddi-ckan-1.0.1]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.0.0...sddi-ckan-1.0.1
[sddi-ckan-1.0.0]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.5.0...sddi-ckan-1.0.0
[sddi-ckan-0.5.0]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.4.0...sddi-ckan-0.5.0
[sddi-ckan-0.4.0]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.3.2...sddi-ckan-0.4.0
[sddi-ckan-0.3.2]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.3.1...sddi-ckan-0.3.2
[sddi-ckan-0.3.1]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.3.0...sddi-ckan-0.3.1
[sddi-ckan-0.3.0]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.2.2...sddi-ckan-0.3.0
[sddi-ckan-0.2.2]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.2.1...sddi-ckan-0.2.2
[sddi-ckan-0.2.1]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.2.0...sddi-ckan-0.2.1
[sddi-ckan-0.2.0]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-0.1.0...sddi-ckan-0.2.0
[sddi-ckan-0.1.0]: https://github.com/tum-gis/sddi-ckan-k8s/releases/tag/sddi-ckan-0.1.0
[template]: https://keepachangelog.com/en/1.0.0/

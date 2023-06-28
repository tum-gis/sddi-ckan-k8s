# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
Versions are prefixed with `sddi-ckan-` due to usage of
[chart-releaser-action](https://github.com/helm/chart-releaser-action).
For releases `< 1.0.0` minor version step indicate breaking changes.

## [sddi-ckan-1.1.0] - 2023-06-28

### Changed

- Bump SDDI CKAN Image `1.0.0` --> `1.0.1`

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

### Added

### Changed

### Removed

### Fixed

### Security

### Deprecated

### Known issues

## [Unreleased] - YYYY-MM-DD

### Added

### Changed

### Removed

### Fixed

### Security

### Deprecated

### Known issues

[Unreleased]: https://github.com/tum-gis/sddi-ckan-k8s/compare/sddi-ckan-1.0.3...HEAD

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

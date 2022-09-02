# SDDI CKAN setup notes

## SDDI CKAN Installationsanleitung befolgt

## Nachträglich von Marija hinzugefügt

* `"C:\Users\bruno\Desktop\SDDI-CKAN-Docker-DZM\SDDI-CKAN-Docker\SDDI_CKAN_DockerSourceFiles\Dockerfile"`

  * Line 78 added: `RUN . $CKAN_VENV/bin/activate && $CKAN_VENV/bin/pip install -U python-slugify==4.0.0`

* `C:\Users\bruno\Desktop\SDDI-CKAN-Docker-DZM\SDDI-CKAN-Docker\SDDI_CKAN_DockerSourceFiles\contrib\docker\linux\SetupGruppenSDDIThemenplattform.sh`

  * Line 12 added: `docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Digitaler Zwilling' name='digitaler-zwilling' image_url='%ckan_url%/base/images/group_icons/dz-logo.jpg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"`

  * CKAN `group_create`: Kann man das vorab in einem file konfigurieren?

* `C:\Users\bruno\Desktop\SDDI-CKAN-Docker-DZM\SDDI-CKAN-Docker\SDDI_CKAN_DockerSourceFiles\ckan\public\base\images`

  * Bilder hinzugefügt in `custom`:
    * `ckan\public\base\images\custom\cut-logo.png
    * ckan\public\base\images\custom\dzm-logo.png
  * Bilder hinzugefügt in `.`:
    * ckan\public\base\images\logo_left.png

## ToDos

## Code snippets

### Create sysadmin

#### Existing user

```shell
kubectl exec -t -i CKAN-POD_NAME -- \
  ckan -c /srv/app/production.ini sysadmin add USERNAME
```

#### New user

```shell
kubectl exec -t -i CKAN-POD_NAME -- \
  ckan -c /srv/app/production.ini sysadmin add USERNAME email=user@example.de name=Fristname Lastname
```

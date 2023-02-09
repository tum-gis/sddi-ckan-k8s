# SDDI CKAN setup notes

## Upcoming changes

### CKAN v2.10

- CKAN Datapusher requires token starting from 2.10:
  https://docs.ckan.org/en/latest/maintaining/configuration.html#ckan-datapusher-api-token

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

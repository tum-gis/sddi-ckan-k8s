# Local cluster example using Docker Desktop

This example deploys the SDDI-CKAN stack on a local `docker-desktop` cluster.
This is especially useful for testing, developing, and for educational purposes.

> **Note:** This example has been tested with a Kubernetes single node cluster provided by
> [Docker Desktop](https://www.docker.com/products/docker-desktop/) on Windows 10.
> Other single node clusters might require a slightly different configuration.
> We assume a "fresh" Docker Desktop cluster, without any tools like `ingress-nginx` or `cert-manger`
> installed.

## :eye_speech_bubble: Requirements

* A local (single node) Kubernetes cluster
* [`kubectl`](https://kubernetes.io/docs/tasks/tools/#kubectl) installed and configured
  for you local cluster
* [`helm`](https://helm.sh/docs/intro/install/) installed

## :rocket: Usage

1. Add the Helm repos for all dependencies

    ```bash
    helm repo add sddi-ckan https://tum-gis.github.io/sddi-ckan-k8s

    # Optional, comment out if nginx-ingress controller is already installed in your cluster
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

    # Optional: Uncomment, if you want to test cert-manager as certificate issuer
    # helm repo add jetstack https://charts.jetstack.io

    # Update all repos
    helm repo update
    ```

2. Deploy the chart with the default configuration specified in
   [values-local.yml](values-local.yml):

    ```bash
    helm install ckan sddi-ckan/sddi-ckan \
      -n ckan --create-namespace \
      --atomic --wait --timeout 10m \
      --values "https://raw.githubusercontent.com/tum-gis/sddi-ckan-k8s/main/examples/docker-desktop/values-local.yml"
    ```

    > **Tip 1**: In `docker-desktop` setups with low hardware resources the deployment may timeout,
    > especially at first run, when all images have to be pulled.
    > If you are running into timeouts, use the `--timeout 10m` option of `helm install`
    > to increase the time span until helm aborts the deployment.

    > **Tip 2**: If you want to try out a development (`beta`, `alpha`) version of the helm chart,
    > use the `--devel` option of helm.

3. After the chart has installed successfully, CKAN is available at https://localhost.
   A system admin user has been created automatically. The credentials are:

     ```text
     username  admin
     password  changeMe
     ```

## :hammer_and_wrench: Customization

If you want to change the default configuration (which is highly recommended
to change the default password), download a copy of
[values-local.yml](values-local.yml). Edit the file locally and install
the chart using your local configuration:

```bash
helm install ckan sddi-ckan/sddi-ckan \
  -n ckan --create-namespace \
  --atomic --wait \
  --values my-local-values.yml
```

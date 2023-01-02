# Local cluster example using Docker Desktop

This example installs the stack on a local cluster. This is especially useful for testing, developing, and for educational purposes.

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

1. Get the helm repos of all dependencies

    ```bash
    helm repo add iot-stack https://tum-gis.github.io/sddi-ckan-k8s

    # Optional, comment out if nginx-ingress controller is already installed in your cluster
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

    # Optional: Uncomment, if you want to test cert-manager as certificate issuer
    # helm repo add jetstack https://charts.jetstack.io

    # Update all repos
    helm repo update
    ```

2. Install the chart with the default configuration specified in [values-local.yml](values-local.yml):

    ```bash
    helm install iot-stack iot-stack/tum-gis-iot-stack-k8s \
      -n iot-stack --create-namespace \
      --atomic --wait \
      --timeout 10m \
      --values "https://raw.githubusercontent.com/tum-gis/tum-gis-iot-stack-k8s/main/examples/local/values-local.yml"
    ```

3. After the chart has installed successfully, CKAN is availalbe at https://localhost/.

All services can be accessed with the username `admin` and password `changeMe`.

## :hammer_and_wrench: Customization

If you want to change the default configuration (which is highly recommended to change the default password),
download a copy of [values-local.yml](values-local.yml).
Edit the file locally and install the chart using your local configuration:

```bash
helm install iot-stack iot-stack/tum-gis-iot-stack-k8s \
  -n iot-stack --create-namespace \
  --atomic --wait \
  --values my-local-values.yml
```

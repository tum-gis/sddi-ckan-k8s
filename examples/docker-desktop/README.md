# Local cluster example using Docker Desktop

This example installs the stack on a local cluster. This is especially useful for testing, developing, and for educational purposes.

> **Note:** This example has only been tested with Kubernetes single node cluster provided by
> [Docker Desktop](https://www.docker.com/products/docker-desktop/) on Windows 10.

## :eye_speech_bubble: Requirements

* A local (single node) Kubernetes cluster
* [`kubectl`](https://kubernetes.io/docs/tasks/tools/#kubectl) installed and configured
  for you local cluster
* [`helm`](https://helm.sh/docs/intro/install/) installed

## :rocket: Usage

1. Get the helm repos of all dependencies

    ```bash
    helm repo add iot-stack https://tum-gis.github.io/tum-gis-iot-stack-k8s

    # Optional, comment out if nginx-ingress controller is already installed in your cluster
    # helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

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
      --values "https://raw.githubusercontent.com/tum-gis/tum-gis-iot-stack-k8s/main/examples/local/values-local.yml"
    ```

3. After the chart has installed successfully, the services are available here:

    * FROST-Server: https://localhost/frost
    * Grafana v9: https://localhost/grafana
    * Grafana v7: https://localhost/grafana7
    * Node-Red: https://localhost/nodered

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

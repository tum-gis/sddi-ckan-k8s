# Running this chart on OpenShift

[Red Hat OpenShift](https://www.redhat.com/en/technologies/cloud-computing/openshift), is a popular hybrid cloud application platform powered by Kubernetes. due to security reasons, in OpenShift pods run as an random user ID and all files in the container image that need to be writable, have to be in a
volume. This example provides a basic setup to run this stack on OpenShift.

## Additional notes on this example

- Instead of Ingress OpenShift [Route](https://docs.openshift.com/container-platform/4.11/rest_api/network_apis/route-route-openshift-io-v1.html) can be used. A local [Route](route.yml) template is included, which can be deployed using a separate chart and the values `ckan.host`.
- DataPusher is disabled, as it causes problems with OpenShift in it's current version.

## :eye_speech_bubble: Requirements

- An OpenShift cluster
- [`kubectl`](https://kubernetes.io/docs/tasks/tools/#kubectl) installed and configured for you local cluster
- [`helm`](https://helm.sh/docs/intro/install/) installed

## :rocket: Usage

1. Add the Helm repos for all dependencies

    ```bash
    helm repo add sddi-ckan https://tum-gis.github.io/sddi-ckan-k8s

    # Optional, comment out if nginx-ingress controller is already installed in your cluster
    # helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

    # Optional: Uncomment, if you want to test cert-manager as certificate issuer
    # helm repo add jetstack https://charts.jetstack.io

    # Update all repos
    helm repo update
    ```

2. Adapt `ckan.siteUrl`, `global.ingress.domains[]`, `global.ingress.certManager.issuerEmail` in a local copy of [values.yml](values.yml) according to your domain name and eMail address.

3. Deploy the chart with the default configuration specified in
   [values.yml](values.yml):

    ```bash
    helm install ckan sddi-ckan/sddi-ckan \
      -n ckan --create-namespace \
      --atomic --wait --timeout 10m \
      --values values.yml
    ```

    > [!TIP]
    > If you want to try out a development (`beta`, `alpha`) version of the helm chart, use the `--devel` option of helm.

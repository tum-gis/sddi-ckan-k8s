# Local cluster example using Minikube

This example installs the stack on a local cluster. This is especially useful for testing, developing, and for educational purposes.
This example has only tested with a Kubernetes single node cluster on
[`minikube`](https://minikube.sigs.k8s.io) using the Docker deployment method.

## :eye_speech_bubble: Requirements

* [`minikube`](https://minikube.sigs.k8s.io/docs/start/) local k8s cluster
* [`kubectl`](https://kubernetes.io/docs/tasks/tools/#kubectl) installed and configured
  for you local cluster
* [`helm`](https://helm.sh/docs/intro/install/) installed

## :rocket: Usage

1. Enable `minikube` nginx ingress addon, see
   [docs](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/) for more.

    ```bash
    minikube addons enable ingress
    ```

2. Get the helm repos of all dependencies

    ```bash
    helm repo add iot-stack https://tum-gis.github.io/tum-gis-iot-stack-k8s

    # Optional: Uncomment, if you want to test cert-manager as certificate issuer
    # helm repo add jetstack https://charts.jetstack.io

    # Update all repos
    helm repo update
    ```

3. Install the chart with the default configuration specified in [values-local.yml](values-local.yml):

    ```bash
    helm install iot-stack iot-stack/tum-gis-iot-stack-k8s \
      -n iot-stack --create-namespace \
      --atomic --wait \
      --values "https://raw.githubusercontent.com/tum-gis/tum-gis-iot-stack-k8s/main/examples/minikube/values-minikube.yml"
    ```

4. After the chart has been deployed successfully, we need to configure access to the services.
   The configuration in this example (see [values-minikube.yml](values-minikube.yml)) uses `myhost.info` as fake hostname for the ingress controller. To access the services, we need to find the IP address, that has been
   assigned to this hostname using `kubectl`.

    ```console
    $ kubectl -n iot-stack get ingress

    NAME                       CLASS   HOSTS         ADDRESS        PORTS     AGE
    iot-stack-frostweb-ing     nginx   myhost.info   192.168.49.2   80, 443   7s
    iot-stack-grafana-ing      nginx   myhost.info   192.168.49.2   80, 443   7s
    iot-stack-grafana7-ing     nginx   myhost.info   192.168.49.2   80, 443   7s
    iot-stack-nodered-ing      nginx   myhost.info   192.168.49.2   80, 443   7s
    iot-stack-nodered-ing-ui   nginx   myhost.info   192.168.49.2   80, 443   7s
    ```

   Add the IP -> hostname mapping to `/etc/hosts` file with your favorite text editor or the code below,
   based on the output of the last step.

    ```console
     $ sudo bash -c 'echo "192.168.49.2 myhost.info" >> /etc/hosts && cat /etc/hosts'
    127.0.0.1       localhost
    127.0.1.1       foo.bar

    # The following lines are desirable for IPv6 capable hosts
    ::1     ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters

    192.168.49.2 myhost.info
    ```

5. After that, the services are available here:

    * FROST-Server: https://myhost.info/frost
    * Grafana v9: https://myhost.info/grafana
    * Grafana v7: https://myhost.info/grafana7
    * Node-Red: https://myhost.info/nodered

All services can be accessed with the username `admin` and password `changeMe`.

## :hammer_and_wrench: Customization

If you want to change the default configuration (which is highly recommended to change the default password),
download a copy of [values-minikube.yml](values-minikube.yml).
Edit the file locally and install the chart using your local configuration:

```bash
helm install iot-stack iot-stack/tum-gis-iot-stack-k8s \
  -n iot-stack --create-namespace \
  --atomic --wait \
  --values my-local-values.yml
```

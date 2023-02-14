# Local cluster example using Play-with-k8s

This example deploys the SDDI-CKAN stack on a public [Play-with-k8s](https://labs.play-with-k8s.com/) cluster.
This is especially useful for testing, developing, and for educational purposes.

## :rocket: Usage

1. Goto [Play-with-k8s](https://labs.play-with-k8s.com/) and get a fresh instance.

2. Issue the commands displayed in the console of the new instance at first open to
   a) bootstrap a Kubernetes cluster and b) install cluster networking.

3. Install Helm from script, as described [here]().

    ```bash
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    # Make sure to disable checksum verification, as openssl is not installed in Play-with-k8s
    export VERIFY_CHECKSUM=false
    ./get_helm.sh
    ```

4. Install the CRDs of [cert-manager]() using `kubectl`, as described
   [here](https://cert-manager.io/docs/installation/kubectl/#steps):

    ```bash
    kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
    ```

```bash
helm repo add sddi-ckan "https://tum-gis.github.io/sddi-ckan-k8s"
helm repo update
helm install ckan sddi-ckan \
  --atomic --wait -n ckan --create-namespace \
  --set 'global.ingress.domains={"XXXX.direct.labs.play-with-k8s.com"}' \
  --set 'ckan.siteUrl={"https:/XXXX.direct.labs.play-with-k8s.com"}' \
  --set 'global.ingress.issuerEmail=bruno.willenborg@gmx.de'
```

2. Enable `minikube` nginx ingress addon, see
   [docs](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/) for more.

    ```bash
    minikube addons enable ingress
    ```

3. Add the Helm repos for all dependencies

    ```bash
    helm repo add sddi-ckan https://tum-gis.github.io/sddi-ckan-k8s

    # Optional: Uncomment, if you want to test cert-manager as certificate issuer
    # helm repo add jetstack https://charts.jetstack.io

    # Update all repos
    helm repo update
    ```

4. Deploy the chart with the default configuration specified in
   [values-local.yml](values-local.yml):

    ```bash
    helm install ckan sddi-ckan/sddi-ckan \
      -n ckan --create-namespace \
      --atomic --wait \
      --values "https://raw.githubusercontent.com/tum-gis/sddi-ckan-k8s/main/examples/minikube/values-minkube.yml"
    ```

    > **Tip**: In `minikube` setups with low hardware resources the deployment may timeout,
    > especially at first run, when all images have to be pulled.
    > If you are running into timeouts, add `--timeout 10m` to the `helm install`
    > command.

5. After the chart has been deployed successfully, we need to configure access to
   the service. The configuration in this example (see [values-minikube.yml]
   (values-minikube.yml)) uses `myhost.info` as fake hostname for the ingress controller.
   To access the services, we need to find the IP address, that has been
   assigned to the Ingress controller using `kubectl`.

    ```console
    $ kubectl -n ckan get ingress
    NAME   CLASS   HOSTS         ADDRESS        PORTS     AGE
    ckan   nginx   myhost.info   192.168.49.2   80, 443   85s
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

6. After that, SDDI-CKAN are available here form your local host: https://myhost.info
   A system admin user has been created automatically. The credentials are:

   ```text
   username  admin
   password  changeMe
   ```

## :hammer_and_wrench: Customization

If you want to change the default configuration (which is highly recommended
to change the default password), download a copy of
[values-minikube.yml](values-minikube.yml). Edit the file locally and install
the chart using your local configuration:

```bash
helm install ckan sddi-ckan/sddi-ckan \
  -n ckan --create-namespace \
  --atomic --wait \
  --values my-local-values.yml
```

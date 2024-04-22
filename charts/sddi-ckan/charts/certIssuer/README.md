# certIssuer

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Namespace Issuers for CertManager.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| className | string | `"nginx"` | Name of the [IngressClass](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class) to use. Note: This is overwritten by `global.ingress.className`, if set. |
| enabled | bool | `true` | Enable/disable namespace [Issuers](https://cert-manager.io/docs/concepts/issuer/) for CertManager. |
| issuerEmail | string | `"example@email.com"` | eMail address for registration with Let's Encrypt account. Note: This is overwritten by `global.ingress.certManager.issuerEmail`, if set. |


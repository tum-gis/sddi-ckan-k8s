# Microsoft Azure Kubernetes Service

The Terraform scripts provided here can be used to provision an instance of
[Azure Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/intro-kubernetes).

* [Official docs](https://azure.microsoft.com/en-us/products/kubernetes-service/)
* [Terraform](https://www.terraform.io/)



## :hammer_and_wrench: Usage

```bash
terraform plan -out plan.json \
  -var resource_group_name="myaks" \
  -var 'contact_emails=["me@example.com","other@example.com"]' \
  -var k8s_default_node_type="Standard_A2_v2" \
  -var k8s_default_node_count=2 \
  -var k8s_database_node_type="Standard_D4s_v3" \
  -var k8s_database_node_count=1
```

```bash
terraform apply plan.json
```

# Microsoft Azure managed Kubernetes

* [Official docs](https://azure.microsoft.com/en-us/products/kubernetes-service/)
* [Terraform]()

```bash
terraform plan -out plan.json \
  -var resource_group_name="$cluster_name" \
  -var 'contact_emails=["me@example.com"]' \
  -var k8s_default_node_type="Standard_A2_v2" \
  -var k8s_default_node_count=2 \
  -var k8s_database_node_type="Standard_D4s_v3" \
  -var k8s_database_node_count=0
```

```bash
terraform apply plan.json
```

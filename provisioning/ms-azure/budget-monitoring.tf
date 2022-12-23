resource "azurerm_consumption_budget_resource_group" "budget-k8s" {
  name              = local.budget_name
  resource_group_id = azurerm_resource_group.this.id

  amount     = 10
  time_grain = "Monthly"

  time_period {
    start_date = formatdate("YYYY-MM-01'T'hh:mm:ssZ", timestamp())
    end_date   = timeadd(timestamp(), "8760h")
  }
  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Forecasted"

    contact_emails = var.contact_emails
  }

  # Avoid recreation of budget on apply
  lifecycle {
    ignore_changes = [
      time_period
    ]
  }
}

# K8S cluster ressources
resource "azurerm_consumption_budget_resource_group" "budget-k8s-nodes" {
  name              = local.budget_name_nodes
  resource_group_id = data.azurerm_resource_group.k8s-node.id
  amount     = 300
  time_grain = "Monthly"

  time_period {
    start_date = formatdate("YYYY-MM-01'T'hh:mm:ssZ", timestamp())
    end_date   = timeadd(timestamp(), "8760h") # One year from now.
  }
  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "GreaterThanOrEqualTo"
    threshold_type = "Forecasted"

    contact_emails = var.contact_emails
  }

  # Avoid recreation of budget on apply
  lifecycle {
    ignore_changes = [
      time_period
    ]
  }
}

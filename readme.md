# Module - Role K8S
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the creation of roles in K8S environments.

## Compatibility matrix

| Module Version | Terraform Version | Kubernetes Provider Version |
|----------------|-------------------| --------------------------- |
| v1.0.0         | v1.3.6            | 2.17.0                      |

## Specifying a version

To avoid that your code get automatically updates for the module is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can use a specific version of the module.

Note: The `?ref=***` refers a tag on the git module repo.

## Use case for the creation of the standard role
```hcl
module "<clustername>-role" {  
  source = "git::https://github.com/danilomnds/terraform-kubernetes-role?ref=v1.0.0"
  namespaces = ["teste-coe2","teste-coe3"]
}
```

## Use case for the creation of a custom role

```hcl
module "<clustername>-role" {  
  source = "git::https://github.com/danilomnds/terraform-kubernetes-role?ref=v1.0.0"
  namespaces = ["teste-coe2","teste-coe3"]
  suffix_role = "bla"
  rules = {
    rule1 = {
      api_groups = ["", "apps", "extensions", "autoscaling"]
      resources  = ["bindings", "cronjobs", "daemonsets", "deployments", "endpoints", "endpointslices", "events", "healthstates", "horizontalpodautoscalers", "hostendpoints", "imagesets", "ingressclasses", "ingresses", "limitranges", "jobs", "persistentvolumeclaims", "pods", "pods/log", "pods/exec", "pods/portforward", "podtemplates", "replicasets", "replicationcontrollers", "secrets", "serviceaccounts", "services", "statefulsets", ]
      verbs      = ["*"]
    }
  }
}
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| namespaces | list of namespaces where the role will be created | `list` | n/a | `Yes` |
| suffix_role | suffix for a custom role (mandatory if you're creating one) | `string` | n/a | No |
| rules | Custom list of resources and verbs for the creation of a custom role | `any` | `standard privileges` | No |

## Documentation

Terraform kubernetes_role: <br>
[https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role)<br>
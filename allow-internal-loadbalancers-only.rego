package kubernetes.admission

import data.kubernetes.namespaces

import input.request.object.metadata.annotations as annotations

deny[msg] {
    input.request.kind.kind = "Service"
    input.request.operation = "CREATE"
    input.request.object.spec.type = "LoadBalancer"
    missing_required_annotations[msg]
}

# Require use of azure internal lb annotation
missing_required_annotations[msg] {
    not annotations["service.beta.kubernetes.io/azure-load-balancer-internal"] = "true"
    msg = "Services of type LoadBalancer must use internal load balancer. Use annotation service.beta.kubernetes.io/azure-load-balancer-internal: \"true\""
}

# Sample OPA Policies

## Install OPA

Follow Step 2 and 3 from [OPA Kubernetes tutorial](https://www.openpolicyagent.org/docs/latest/kubernetes-tutorial/).

## Create configmap

To disable lb creation
```bash
kubectl create configmap internal-loadbalancer-only --from-file=block-loadbalancers.rego
```

To disable external lb creation but allow internal only load balancers on Azure
```bash
kubectl create configmap internal-loadbalancer-only --from-file=load-balancer-with-annotation-only.rego
```


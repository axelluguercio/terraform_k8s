# terraform_k8s

Example showing how to integrate the Terraform kubernetes provider with a Google Kubernetes Engine cluster.
We'll deploy a gke cluster with a nginx ingress controller and expose the service with a load balancer.

## Setup

Clone the repository

```
git clone https://github.com/axelluguercio/terraform_k8s.git
```

Change to the example directory

```
[[ `basename $PWD` != terraform_k8s ]] && cd terraform_k8s
```

Set up the environment

```
export TF_VAR_project_id=YOUR_GCP_PROJECT_ID
```

Run Terraform

```
terraform init
terraform apply
```

Testing

Wait for the load balancer to be provisioned:
./test.sh

Verify response from load balancer:
curl http://$(terraform output load-balancer-ip)

Connecting with kubectl

Get the cluster credentials and configure kubectl:

```
gcloud container clusters get-credentials $(terraform output cluster_name) --zone $(terraform output cluster_zone)
```

Verify kubectl connectivity

```
kubectl get pods -n staging
```

Cleanup

```
# Delete resources created by terraform:
terraform destroy
```
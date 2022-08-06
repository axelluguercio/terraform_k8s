variable "region" {
  default = "us-west1"
}

variable "location" {
  default = "us-west1-b"
}

variable "network_name" {
  default = "tf-gke-k8s"
}

variable "project_id" {
  type        = string
  "The id of the google cloud project"
}
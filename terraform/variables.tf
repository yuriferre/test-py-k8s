variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "app_port" {
  default = 8000
}

variable "desired_count" {
  default = 1
}

variable "cluster_name" {
  default = "flask-app-cluster"
}

variable "service_name" {
  default = "flask-app-service"
}

variable "min_capacity" {
  default = 1
}

variable "max_capacity" {
  default = 5
}

variable "cpu_target_value" {
  default = 50
}
variable "region" {
  description = "AWS region"
  default     = "us-east-1"  # Mumbai Region
}

variable "container_port" {
  description = "Port that Strapi container listens on"
  default     = 1337  # Strapi default port
}

variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  default     = "strapi-app1"
}

variable "project_name" {
  description = "Name of the project"
  default     = "strapi-app"
}             

variable "ecr_repo_url" {
  description = "ECR repository URL"
  type        = string
}

variable "image_url" {
  description = "Full image URL including tag"
  type        = string
}

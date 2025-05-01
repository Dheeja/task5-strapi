# ECR Repository Creation
resource "aws_ecr_repository" "strapi_app" {
  name = var.ecr_repo_name

  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "${var.project_name}-ecr"
  }
}

# Docker Build and Push using `null_resource`
resource "null_resource" "docker_build_push" {
  provisioner "local-exec" {
    command = <<EOT
      cd ../
      docker build -t ${var.image_url} .
      aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${var.ecr_repo_url}
      docker push ${var.image_url}
    EOT
  }

  depends_on = [
    aws_ecr_repository.strapi_app
  ]
}
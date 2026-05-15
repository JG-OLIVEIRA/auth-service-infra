resource "aws_ecr_repository" "ecr_auth-service" {
  name                 = "auth-service"
  image_tag_mutability = "MUTABLE"
}
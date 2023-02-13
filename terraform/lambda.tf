locals {
  lambdaImage = "${aws_ecr_repository.rust-lambda-ecr.repository_url}:latest"
}

resource "aws_lambda_function" "rust_lambda" {
  depends_on = [
    aws_ecr_repository.rust-lambda-ecr
  ]
  description   = ""
  function_name = "rust_lambda"
  architectures = [
    "x86_64"
  ]
  package_type = "Image"
  image_config {
    command = ["/var/task/target/debug/rust_lambda"]
  }
  image_uri   = local.lambdaImage
  memory_size = 1024
  role        = aws_iam_role.lambda-role.arn
  timeout     = 30
}

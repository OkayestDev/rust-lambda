resource "aws_iam_role" "lambda-role" {
  path = "/"
  name = "rust-lambda-role"
  assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  max_session_duration = 3600
}

resource "aws_iam_role_policy" "IAMPolicy3" {
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
         {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*",
                "dynamodb:*",
                "dax:*",
                "kms:*",
                "elasticfilesystem:*",
                "cloudwatch:*",
                "ec2:*",
                "logs:*",
                "sns:*",
                "events:*",
                "ses:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
  role = aws_iam_role.lambda-role.name
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "node_iam_role" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "nodejs-function" {
  function_name = "Node_Function"
  role          = aws_iam_role.node_iam_role.arn
  runtime       = "python3.9"
}
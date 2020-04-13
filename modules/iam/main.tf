resource "aws_iam_role" "pelodata_role" {
    name               = "pelodata_role"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Sid": "",
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Principal": {
            "Service": "lambda.amazonaws.com"
        }
    }]
}
EOF

    tags = {
        App = "Pelodata"      
    }
}

resource "aws_iam_instance_profile" "pelodata_profile" {
    name = "pelodata_profile"
    role = aws_iam_role.pelodata_role.name
}

resource "aws_iam_policy" "pelodata_policy" {
    name   = "pelodata_policy"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "pelodata_attachment" {
    name       = "pelodata_attachment"
    roles      = [aws_iam_role.pelodata_role.name]
    policy_arn = aws_iam_policy.pelodata_policy.arn
}

resource "aws_lambda_permission" "pelodata_apigateway_permission" {
    count = length(var.functions)

    statement_id  = "AllowAPIGatewayInvoke"
    action        = "lambda:InvokeFunction"
    function_name = var.functions[count.index]
    principal     = "apigateway.amazonaws.com"
    source_arn    = "${var.apigateway_execution_arn}/*/*/*"
}

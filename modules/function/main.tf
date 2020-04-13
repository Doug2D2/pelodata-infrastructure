resource "aws_lambda_function" "pelodata_function" {
    function_name = "pelodata-${var.name}"
    handler       = var.name
    role          = var.iam_role_arn
    runtime       = "go1.x"
    s3_bucket     = "pelodata-serverless"
    s3_key        = "${var.name}.zip"

    tags = {
        Name = "Pelodata-${var.name}"
        App  = "Pelodata"     
    }
}

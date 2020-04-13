output "arn" {
    value = aws_lambda_function.pelodata_function.arn
}

output "invoke_arn" {
    value = aws_lambda_function.pelodata_function.invoke_arn
}

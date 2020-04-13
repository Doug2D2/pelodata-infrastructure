output "execution_arn" {
    value = aws_api_gateway_rest_api.pelodata_apigateway.execution_arn
}

output "invoke_url" {
    value = aws_api_gateway_deployment.pelodata_deployment.invoke_url
}

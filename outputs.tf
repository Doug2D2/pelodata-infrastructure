output "login_function_arn" {
    value = module.login.arn
}

output "apigateway_invoke_url" {
    value = module.apigateway.invoke_url
}

resource "aws_api_gateway_rest_api" "pelodata_apigateway" {
    name = "pelodata-terraform"

    endpoint_configuration {
        types = ["REGIONAL"]
    }

    tags = {
        Name = "Pelodata-ApiGateway"
        App  = "Pelodata"      
    }
}

resource "aws_api_gateway_resource" "pelodata_login_resource" {
    path_part   = "login"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_login_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_login_resource.id
    http_method   = "POST"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_login_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_login_resource.id
    http_method             = aws_api_gateway_method.pelodata_login_method.http_method
    uri                     = var.login_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getUserInfo_resource" {
    path_part   = "getUserInfo"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_resource" "pelodata_getUserInfoFull_resource" {
    path_part   = "{userId}"
    parent_id   = aws_api_gateway_resource.pelodata_getUserInfo_resource.id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getUserInfo_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getUserInfoFull_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getUserInfo_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getUserInfoFull_resource.id
    http_method             = aws_api_gateway_method.pelodata_getUserInfo_method.http_method
    uri                     = var.getUserInfo_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getWorkouts_resource" {
    path_part   = "getWorkouts"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getWorkouts_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getWorkouts_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getWorkouts_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getWorkouts_resource.id
    http_method             = aws_api_gateway_method.pelodata_getWorkouts_method.http_method
    uri                     = var.getWorkouts_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getFilters_resource" {
    path_part   = "getFilters"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getFilters_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getFilters_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getFilters_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getFilters_resource.id
    http_method             = aws_api_gateway_method.pelodata_getFilters_method.http_method
    uri                     = var.getFilters_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getCategories_resource" {
    path_part   = "getCategories"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getCategories_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getCategories_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getCategories_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getCategories_resource.id
    http_method             = aws_api_gateway_method.pelodata_getCategories_method.http_method
    uri                     = var.getCategories_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_addProgram_resource" {
    path_part   = "addProgram"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_addProgram_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_addProgram_resource.id
    http_method   = "POST"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_addProgram_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_addProgram_resource.id
    http_method             = aws_api_gateway_method.pelodata_addProgram_method.http_method
    uri                     = var.addProgram_invoke_arn
}

resource "aws_api_gateway_deployment" "pelodata_deployment" {
    depends_on = [aws_api_gateway_integration.pelodata_login_integration, 
        aws_api_gateway_integration.pelodata_getUserInfo_integration,
        aws_api_gateway_integration.pelodata_getWorkouts_integration,
        aws_api_gateway_integration.pelodata_getFilters_integration,
        aws_api_gateway_integration.pelodata_getCategories_integration,
        aws_api_gateway_integration.pelodata_addProgram_integration]

    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
    stage_name  = "Dev"
}

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

resource "aws_api_gateway_deployment" "pelodata_deployment" {
    depends_on = [aws_api_gateway_integration.pelodata_login_integration, aws_api_gateway_integration.pelodata_getUserInfo_integration]

    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
    stage_name  = "Dev"
}

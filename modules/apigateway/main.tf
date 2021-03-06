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

resource "aws_api_gateway_resource" "pelodata_deleteProgram_resource" {
    path_part   = "deleteProgram"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_resource" "pelodata_deleteProgramFull_resource" {
    path_part   = "{programId}"
    parent_id   = aws_api_gateway_resource.pelodata_deleteProgram_resource.id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_deleteProgram_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_deleteProgramFull_resource.id
    http_method   = "DELETE"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_deleteProgram_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_deleteProgramFull_resource.id
    http_method             = aws_api_gateway_method.pelodata_deleteProgram_method.http_method
    uri                     = var.deleteProgram_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getPrograms_resource" {
    path_part   = "getPrograms"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getPrograms_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getPrograms_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getPrograms_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getPrograms_resource.id
    http_method             = aws_api_gateway_method.pelodata_getPrograms_method.http_method
    uri                     = var.getPrograms_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getProgramsFull_resource" {
    path_part   = "{programId}"
    parent_id   = aws_api_gateway_resource.pelodata_getPrograms_resource.id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getProgramsFull_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getProgramsFull_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getProgramsFull_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getProgramsFull_resource.id
    http_method             = aws_api_gateway_method.pelodata_getProgramsFull_method.http_method
    uri                     = var.getPrograms_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_recommendClass_resource" {
    path_part   = "recommendClass"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_recommendClass_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_recommendClass_resource.id
    http_method   = "POST"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_recommendClass_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_recommendClass_resource.id
    http_method             = aws_api_gateway_method.pelodata_recommendClass_method.http_method
    uri                     = var.recommendClass_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_deleteRecommendation_resource" {
    path_part   = "deleteRecommendation"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_resource" "pelodata_deleteRecommendationFull_resource" {
    path_part   = "{recommendationId}"
    parent_id   = aws_api_gateway_resource.pelodata_deleteRecommendation_resource.id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_deleteRecommendation_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_deleteRecommendationFull_resource.id
    http_method   = "DELETE"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_deleteRecommendation_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_deleteRecommendationFull_resource.id
    http_method             = aws_api_gateway_method.pelodata_deleteRecommendation_method.http_method
    uri                     = var.deleteRecommendation_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getRecommendations_resource" {
    path_part   = "getRecommendations"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getRecommendations_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getRecommendations_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getRecommendations_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getRecommendations_resource.id
    http_method             = aws_api_gateway_method.pelodata_getRecommendations_method.http_method
    uri                     = var.getRecommendations_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getRecommendationsFull_resource" {
    path_part   = "{recommendationId}"
    parent_id   = aws_api_gateway_resource.pelodata_getRecommendations_resource.id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getRecommendationsFull_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getRecommendationsFull_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getRecommendationsFull_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getRecommendationsFull_resource.id
    http_method             = aws_api_gateway_method.pelodata_getRecommendationsFull_method.http_method
    uri                     = var.getRecommendations_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_addChallenge_resource" {
    path_part   = "addChallenge"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_addChallenge_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_addChallenge_resource.id
    http_method   = "POST"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_addChallenge_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_addChallenge_resource.id
    http_method             = aws_api_gateway_method.pelodata_addChallenge_method.http_method
    uri                     = var.addChallenge_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_deleteChallenge_resource" {
    path_part   = "deleteChallenge"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_resource" "pelodata_deleteChallengeFull_resource" {
    path_part   = "{challengeId}"
    parent_id   = aws_api_gateway_resource.pelodata_deleteChallenge_resource.id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_deleteChallenge_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_deleteChallengeFull_resource.id
    http_method   = "DELETE"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_deleteChallenge_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_deleteChallengeFull_resource.id
    http_method             = aws_api_gateway_method.pelodata_deleteChallenge_method.http_method
    uri                     = var.deleteChallenge_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getChallenges_resource" {
    path_part   = "getChallenges"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getChallenges_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getChallenges_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getChallenges_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getChallenges_resource.id
    http_method             = aws_api_gateway_method.pelodata_getChallenges_method.http_method
    uri                     = var.getChallenges_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_getChallengesFull_resource" {
    path_part   = "{challengeId}"
    parent_id   = aws_api_gateway_resource.pelodata_getChallenges_resource.id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_getChallengesFull_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_getChallengesFull_resource.id
    http_method   = "GET"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_getChallengesFull_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_getChallengesFull_resource.id
    http_method             = aws_api_gateway_method.pelodata_getChallengesFull_method.http_method
    uri                     = var.getChallenges_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_bookmarkClass_resource" {
    path_part   = "bookmarkClass"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_bookmarkClass_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_bookmarkClass_resource.id
    http_method   = "POST"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_bookmarkClass_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_bookmarkClass_resource.id
    http_method             = aws_api_gateway_method.pelodata_bookmarkClass_method.http_method
    uri                     = var.bookmarkClass_invoke_arn
}

resource "aws_api_gateway_resource" "pelodata_unbookmarkClass_resource" {
    path_part   = "unbookmarkClass"
    parent_id   = aws_api_gateway_rest_api.pelodata_apigateway.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
}

resource "aws_api_gateway_method" "pelodata_unbookmarkClass_method" {
    rest_api_id   = aws_api_gateway_rest_api.pelodata_apigateway.id
    resource_id   = aws_api_gateway_resource.pelodata_unbookmarkClass_resource.id
    http_method   = "POST"
    authorization = "NONE"
}

resource "aws_api_gateway_integration" "pelodata_unbookmarkClass_integration" {
    rest_api_id             = aws_api_gateway_rest_api.pelodata_apigateway.id
    type                    = "AWS_PROXY"
    integration_http_method = "POST"
    resource_id             = aws_api_gateway_resource.pelodata_unbookmarkClass_resource.id
    http_method             = aws_api_gateway_method.pelodata_unbookmarkClass_method.http_method
    uri                     = var.unbookmarkClass_invoke_arn
}

resource "aws_api_gateway_deployment" "pelodata_deployment" {
    depends_on = [aws_api_gateway_integration.pelodata_login_integration, 
        aws_api_gateway_integration.pelodata_getUserInfo_integration,
        aws_api_gateway_integration.pelodata_getWorkouts_integration,
        aws_api_gateway_integration.pelodata_getFilters_integration,
        aws_api_gateway_integration.pelodata_getCategories_integration,
        aws_api_gateway_integration.pelodata_addProgram_integration,
        aws_api_gateway_integration.pelodata_deleteProgram_integration,
        aws_api_gateway_integration.pelodata_getPrograms_integration,
        aws_api_gateway_integration.pelodata_getProgramsFull_integration,
        aws_api_gateway_integration.pelodata_recommendClass_integration,
        aws_api_gateway_integration.pelodata_deleteRecommendation_integration,
        aws_api_gateway_integration.pelodata_getRecommendations_integration,
        aws_api_gateway_integration.pelodata_getRecommendationsFull_integration,
        aws_api_gateway_integration.pelodata_addChallenge_integration,
        aws_api_gateway_integration.pelodata_deleteChallenge_integration,
        aws_api_gateway_integration.pelodata_getChallenges_integration,
        aws_api_gateway_integration.pelodata_getChallengesFull_integration,
        aws_api_gateway_integration.pelodata_bookmarkClass_integration,
        aws_api_gateway_integration.pelodata_unbookmarkClass_integration]

    rest_api_id = aws_api_gateway_rest_api.pelodata_apigateway.id
    stage_name  = "Dev"
}

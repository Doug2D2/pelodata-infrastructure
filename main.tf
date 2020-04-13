provider "aws" {
    region = "us-east-1"
}

module "iam" {
    source = "./modules/iam"

    functions                = [module.login.arn, module.getUserInfo.arn]
    apigateway_execution_arn = module.apigateway.execution_arn
}

module "login" {
    source = "./modules/function"

    name         = "login"
    iam_role_arn = module.iam.role_arn
}

module "getUserInfo" {
    source = "./modules/function"

    name         = "getUserInfo"
    iam_role_arn = module.iam.role_arn
}

module "apigateway" {
    source = "./modules/apigateway"

    login_invoke_arn       = module.login.invoke_arn
    getUserInfo_invoke_arn = module.getUserInfo.invoke_arn
}

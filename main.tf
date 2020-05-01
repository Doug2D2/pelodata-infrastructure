provider "aws" {
    region = "us-east-1"
}

module "iam" {
    source = "./modules/iam"

    functions                = [module.login.arn, module.getUserInfo.arn, 
                                module.getWorkouts.arn, module.getFilters.arn,
                                module.getCategories.arn, module.addProgram.arn,
                                module.deleteProgram.arn]
    apigateway_execution_arn = module.apigateway.execution_arn
}

module "db" {
    source = "./modules/db"
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

module "getWorkouts" {
    source = "./modules/function"

    name         = "getWorkouts"
    iam_role_arn = module.iam.role_arn
}

module "getFilters" {
    source = "./modules/function"

    name         = "getFilters"
    iam_role_arn = module.iam.role_arn
}

module "getCategories" {
    source = "./modules/function"

    name         = "getCategories"
    iam_role_arn = module.iam.role_arn
}

module "addProgram" {
    source = "./modules/function"

    name         = "addProgram"
    iam_role_arn = module.iam.role_arn
    env          = {"table_region": var.table_region, "table_name": var.table_name}
}

module "deleteProgram" {
    source = "./modules/function"

    name         = "deleteProgram"
    iam_role_arn = module.iam.role_arn
    env          = {"table_region": var.table_region, "table_name": var.table_name}
}

module "apigateway" {
    source = "./modules/apigateway"

    login_invoke_arn         = module.login.invoke_arn
    getUserInfo_invoke_arn   = module.getUserInfo.invoke_arn
    getWorkouts_invoke_arn   = module.getWorkouts.invoke_arn
    getFilters_invoke_arn    = module.getFilters.invoke_arn
    getCategories_invoke_arn = module.getCategories.invoke_arn
    addProgram_invoke_arn    = module.addProgram.invoke_arn
    deleteProgram_invoke_arn = module.deleteProgram.invoke_arn 
}

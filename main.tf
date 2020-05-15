provider "aws" {
    region = "us-east-1"
}

module "iam" {
    source = "./modules/iam"

    functions                = [module.login.arn, module.getUserInfo.arn, 
                                module.getWorkouts.arn, module.getFilters.arn,
                                module.getCategories.arn, module.addProgram.arn,
                                module.deleteProgram.arn, module.getPrograms.arn,
                                module.recommendClass.arn, module.deleteRecommendation.arn]
    apigateway_execution_arn = module.apigateway.execution_arn
}

module "customProgramsTable" {
    source = "./modules/db"

    tableName = "CustomPrograms"
}

module "recommendationsTable" {
    source = "./modules/db"

    tableName = "Recommendations"
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
    env          = {"table_region": var.table_region, "table_name": var.customProgram_table_name}
}

module "deleteProgram" {
    source = "./modules/function"

    name         = "deleteProgram"
    iam_role_arn = module.iam.role_arn
    env          = {"table_region": var.table_region, "table_name": var.customProgram_table_name}
}

module "getPrograms" {
    source = "./modules/function"

    name         = "getPrograms"
    iam_role_arn = module.iam.role_arn
    env          = {"table_region": var.table_region, "table_name": var.customProgram_table_name}
}

module "recommendClass" {
    source = "./modules/function"

    name         = "recommendClass"
    iam_role_arn = module.iam.role_arn
    env          = {"table_region": var.table_region, "table_name": var.recommendation_table_name}
}

module "deleteRecommendation" {
    source = "./modules/function"

    name         = "deleteRecommendation"
    iam_role_arn = module.iam.role_arn
    env          = {"table_region": var.table_region, "table_name": var.recommendation_table_name}
}

module "apigateway" {
    source = "./modules/apigateway"

    login_invoke_arn                = module.login.invoke_arn
    getUserInfo_invoke_arn          = module.getUserInfo.invoke_arn
    getWorkouts_invoke_arn          = module.getWorkouts.invoke_arn
    getFilters_invoke_arn           = module.getFilters.invoke_arn
    getCategories_invoke_arn        = module.getCategories.invoke_arn
    addProgram_invoke_arn           = module.addProgram.invoke_arn
    deleteProgram_invoke_arn        = module.deleteProgram.invoke_arn 
    getPrograms_invoke_arn          = module.getPrograms.invoke_arn 
    recommendClass_invoke_arn       = module.recommendClass.invoke_arn
    deleteRecommendation_invoke_arn = module.deleteRecommendation.invoke_arn
}

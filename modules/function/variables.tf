variable "name" {
    type = string
}

variable "iam_role_arn" {
    type = string
}

variable "env" {
    type    = map
    default = {"empty": "empty"}
}

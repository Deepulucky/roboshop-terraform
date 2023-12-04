# module "vpc" {
#   source = "git::https://github.com/Deepulucky/tf-module-vpc.git"

#   for_each   = var.vpc
#   cidr_block = each.value["cidr_block"]
#   subnets    = each.value["subnets"]
#   tags       = local.tags
#   env        = var.env
# }

# resource "aws_iam_policy" "policy" {
#   name        = "${var.component}-${var.env}-ssm-pm-policy"
#   path        = "/"
#   description = "${var.component}-${var.env}-ssm-pm-policy"

#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "VisualEditor0",
#         "Effect" : "Allow",
#         "Action" : [
#           "ssm:GetParameterHistory",
#           "ssm:GetParametersByPath",
#           "ssm:GetParameters",
#           "ssm:GetParameter",
#           "kms:Decrypt"
#         ],
#         "Resource" : concat([
#           "arn:aws:ssm:us-east-1:739561048503:parameter/roboshop.${var.env}.${var.component}.*",
#           "arn:aws:ssm:us-east-1:739561048503:parameter/roboshop.nexus.*",
#           var.kms_arn
#         ], var.extra_param_access)
#       }
#     ]
#   })
# }

module "instances" {
  for_each = var.components
  source   = "git::https://github.com/Deepulucky/tf-module-app.git"
  component     = each.key
  env       = var.env

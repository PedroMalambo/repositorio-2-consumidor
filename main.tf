terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Consumir el módulo del repositorio-1-modulo-versionado
module "zulu_modulo" {
  source = "../repositorio-1-modulo-versionado" # Cambia esta ruta si es necesario.

  region               = var.region
  env_variable         = var.env_variable
  blocked_ips          = var.blocked_ips
  request_limit        = var.request_limit
  lambda_role_name     = var.lambda_role_name
  lambda_function_name = var.lambda_function_name
  api_gateway_name     = var.api_gateway_name
  waf_name             = var.waf_name
}

# Configuración de SNS para notificaciones
resource "aws_sns_topic" "zulu_topic" {
  name = "zulu-sns-topic"

  tags = {
    Name = "zulu-sns-topic"
  }
}

resource "aws_sns_topic_subscription" "zulu_subscription_email" {
  topic_arn = aws_sns_topic.zulu_topic.arn
  protocol  = "email"
  endpoint  = var.notification_email # Correo electrónico para notificaciones
}

# Configuración adicional para Cognito
resource "aws_cognito_user_pool" "zulu_user_pool" {
  name = "zulu-user-pool"

  tags = {
    Name = "zulu-user-pool"
  }
}

resource "aws_cognito_user_pool_client" "zulu_user_pool_client" {
  name         = "zulu-user-pool-client"
  user_pool_id = aws_cognito_user_pool.zulu_user_pool.id

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                 = ["implicit"]
  allowed_oauth_scopes                = ["phone", "email", "openid", "profile"]
}

# Vincular Cognito con API Gateway
resource "aws_apigatewayv2_authorizer" "zulu_authorizer" {
  name             = "zulu-authorizer"
  api_id           = module.zulu_modulo.api_gateway_id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]
  jwt_configuration {
    audience = [aws_cognito_user_pool_client.zulu_user_pool_client.id]
    issuer   = aws_cognito_user_pool.zulu_user_pool.endpoint
  }
}
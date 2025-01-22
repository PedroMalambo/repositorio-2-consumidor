output "lambda_function_arn" {
  description = "ARN de la función Lambda desplegada."
  value       = module.zulu_modulo.lambda_function_arn
}

output "lambda_function_name" {
  description = "Nombre de la función Lambda desplegada."
  value       = module.zulu_modulo.lambda_function_name
}

output "api_gateway_url" {
  description = "URL del endpoint del API Gateway."
  value       = module.zulu_modulo.api_gateway_url
}

output "api_gateway_id" {
  description = "ID del API Gateway desplegado."
  value       = module.zulu_modulo.api_gateway_id
}

output "waf_id" {
  description = "ID del Web Application Firewall (WAF)."
  value       = module.zulu_modulo.waf_id
}

output "waf_arn" {
  description = "ARN del Web Application Firewall (WAF)."
  value       = module.zulu_modulo.waf_arn
}

output "sns_topic_arn" {
  description = "ARN del tópico SNS para notificaciones."
  value       = aws_sns_topic.zulu_topic.arn
}

output "cognito_user_pool_id" {
  description = "ID del grupo de usuarios en Cognito."
  value       = aws_cognito_user_pool.zulu_user_pool.id
}

output "cognito_user_pool_client_id" {
  description = "ID del cliente del grupo de usuarios en Cognito."
  value       = aws_cognito_user_pool_client.zulu_user_pool_client.id
}

output "authorizer_id" {
  description = "ID del autorizador Cognito en API Gateway."
  value       = aws_apigatewayv2_authorizer.zulu_authorizer.id
}
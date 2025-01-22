variable "region" {
  description = "La región de AWS donde se desplegarán los recursos."
  type        = string
  default     = "us-east-1"
}

variable "env_variable" {
  description = "Variable de entorno para la función Lambda."
  type        = string
}

variable "blocked_ips" {
  description = "Lista de direcciones IP bloqueadas por el WAF."
  type        = list(string)
  default     = []
}

variable "request_limit" {
  description = "Número máximo de solicitudes permitidas por el WAF en un período de 5 minutos."
  type        = number
  default     = 10
}

variable "lambda_role_name" {
  description = "Nombre del rol IAM asignado a la función Lambda."
  type        = string
  default     = "zulu-lambda-role"
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda."
  type        = string
  default     = "zulu-lambda-function"
}

variable "api_gateway_name" {
  description = "Nombre del API Gateway."
  type        = string
  default     = "zulu-api-gateway"
}

variable "waf_name" {
  description = "Nombre del Web Application Firewall (WAF)."
  type        = string
  default     = "zulu-waf"
}

variable "notification_email" {
  description = "Correo electrónico para recibir notificaciones del tópico SNS."
  type        = string
}

variable "cognito_user_pool_name" {
  description = "Nombre del grupo de usuarios en Cognito."
  type        = string
  default     = "zulu-user-pool"
}

variable "cognito_user_pool_client_name" {
  description = "Nombre del cliente del grupo de usuarios en Cognito."
  type        = string
  default     = "zulu-user-pool-client"
}
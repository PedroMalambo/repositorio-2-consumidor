# Repositorio Terraform: `repositorio-2-consumidor`

Este repositorio utiliza el módulo `zulu-modulo-versionado` para desplegar una infraestructura en AWS que incluye:

- **AWS Lambda**: Función escrita en Python, conectada a un API Gateway.
- **API Gateway**: Endpoint HTTP protegido con un autorizador Cognito.
- **AWS WAF**: Protección contra direcciones IP específicas y limitación de solicitudes.
- **Amazon SNS**: Sistema de notificaciones configurado con suscripción por correo electrónico.
- **Amazon Cognito**: Gestión de autenticación mediante un User Pool.

## 🚀 Funcionalidad

Este repositorio gestiona el despliegue de la infraestructura completa, utilizando variables parametrizadas para facilitar la reutilización en distintos entornos.

### **Componentes Principales**

1. **Consumo del Módulo**:
   - Consume el módulo versionado para desplegar Lambda, API Gateway y WAF.
2. **Amazon SNS**:
   - Configuración de un tópico SNS para notificaciones, con una suscripción de correo electrónico.
3. **Amazon Cognito**:
   - Configuración de un User Pool y un cliente asociado, vinculado como autorizador en el API Gateway.
4. **Backend Remoto**:
   - Configuración para almacenar el estado de Terraform en un bucket S3 y gestionar bloqueos con DynamoDB.

---

## 📁 Estructura del Repositorio

📂 repositorio-2-consumidor/
├── main.tf                           # Configuración principal que consume el módulo del repositorio 1.
├── variables.tf                   # Variables específicas para el despliegue (entorno, usuarios Cognito, etc.).
├── outputs.tf                     # Salidas del despliegue.
├── versions.tf                   # Definición de versiones requeridas de Terraform y providers.
├── backend.tf                  # Configuración del backend remoto de Terraform (state en S3).
├── README.md             # Documentación del repositorio.
📂 .github/
│   📂 workflows/
│       ├── validate.yml      # Pipeline para validar los archivos de Terraform.
│       ├── apply.yml          # Pipeline para desplegar la infraestructura.

## 🛠️ Uso

**1.** **Clonar el Repositorio**:

- bash
- git clone https://github.com/tu-usuario/zulu-consumidor.git
- cd zulu-consumidor

## **Configurar Variables** :

- Edita el archivo **variables.tf** o utiliza un archivo **terraform.tfvars** para proporcionar valores personalizados. Ejemplo:

  region                       = "us-east-1"
  env_variable           = "PRODUCCION"
  notification_email = "tu-correo@example.com"
  blocked_ips            = ["192.168.1.1", "10.0.0.1"]

## **⚙️ Requisitos**


- **Terraform** : Versión >= 1.5.0.
- **Provider AWS** : Versión >= 5.0.
- **Permisos de AWS** : Permisos para crear recursos como Lambda, API Gateway, WAF, SNS, Cognito, S3 y DynamoDB.

## **📝 Notas**


- Asegúrate de tener configurado el bucket S3 y la tabla DynamoDB para el backend remoto antes de ejecutar **terraform init**.
- Este repositorio está diseñado para ser reutilizable en múltiples entornos (producción, staging, desarrollo).

terraform {
  backend "s3" {
    bucket         = "zulu-terraform-state"       # Cambia por el nombre de tu bucket S3
    key            = "repositorio-2/state.tfstate" # Ruta del archivo de estado en el bucket
    region         = "us-east-1"                  # Región del bucket
    dynamodb_table = "zulu-terraform-locks"       # Tabla DynamoDB para evitar conflictos
    encrypt        = true                         # Encripta el archivo de estado
  }
}
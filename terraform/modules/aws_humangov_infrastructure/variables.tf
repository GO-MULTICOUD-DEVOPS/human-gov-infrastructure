#ESTA VARIÁVEL DETERMINA O NOME DO ESTADO AMERICANO QUE O MÓDULO CRIARÁ OS RECURSOS 
variable "state_name" {
  description = "The name of the US State"
}

#ESTA VARIÁVEL DETERMINA A REGIÃO ONDE O MÓDULO CRIARÁ OS RECURSOS
variable "region" {
    default = "us-east-1"
}
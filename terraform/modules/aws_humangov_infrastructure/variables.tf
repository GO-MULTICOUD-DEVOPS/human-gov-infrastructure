#ESTA VARIÁVEL DETERMINA O NOME DO ESTADO AMERICANO QUE O MÓDULO CRIARÁ OS RECURSOS 
variable "state_name" {
  description = "The name of the US State"
}

#ESTA VARIÁVEL DETERMINA A REGIÃO ONDE O MÓDULO CRIARÁ OS RECURSOS
variable "region" {
    default = "us-east-1"
}

#ESTA VARIÁVEL DETERMINA A QUANTIDADE MÍNIMA DE CRIAÇÃO DE INSTÂNCIAS 
variable "instance_count" {
  type    = number
  default = 1 
}

# #ESTA VARIÁVEL DETERMINA A CRIAÇÃO DE UM CONJUNTO DE INSTÂNCIAS OU RECURSOS EM DIFERENTES LOCALIDADES, IDENTIFICADOS PELOS CÓDIGOS DOS ESTADOS
#FORNECIDOS, FACILITANDO A REPLICAÇÃO DA INFRAESTRUTURA COM BASE EM CONFIGURAÇÕES LOCAIS.
variable "state_codes" {
  type        = map(string)
  description = "Lista de códigos dos estados para a criação de instâncias EC2"
}

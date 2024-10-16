#MAIN PARA O MODO ROOT
provider "aws" {       //DEFININDO A AWS COMO PROVEDOR DA INFRA
  region = "us-east-1" // DEFININDO A REGIÃO QUE SERÁ IMPLEMENTADO A INFRA
}

module "aws_humangov_infrastructure" {                 //NESSE PONTO, O TERRAFORM INVOCARÁ TODOS OS ARQUIVOS CRIADOS DENTRO DO DIRETÓRIO (modules)
  source     = "./modules/aws_humangov_infrastructure" //DEFINIÇÃO DO CAMINHO DOS ARQUIVOS A SEREM INVOCADOS
  for_each   = toset(var.states)                       //AQUI SERÁ ARMAZENADO OS VALORES DA VARIÁVEL (states) UM A UM
  state_name = each.value                              //AQUI FOMENTARÁ A VARÁVEL DENTRO DO MÓDULO (modules), VALORES VINDO DA VARIÁVEL ROOT (states), UM A UM
  #EM RESUMO, PARA CADA VARÍÁVEL DEFAULT (var.states) "Califórnia"; "Flórida"; "Texas"; etc... O MODO ROOT IRÁ ALIMENTAR A VARIÁVEL DO MÓDULO (var.state_name) UM VALOR POR VEZ, PROPORCIONANDO QUE TODOS OS RECURSOS SEJAM CRIADOS PARA CADA ESTADO DE REFERÊNCIA 
}
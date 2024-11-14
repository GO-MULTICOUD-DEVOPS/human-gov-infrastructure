#MAIN PARA O MODO ROOT
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {                                                                //DEFININDO A AWS COMO PROVEDOR DA INFRA
  region = "us-east-1"                                                          //DEFININDO A REGIÃO QUE SERÁ IMPLEMENTADO A INFRA
}

module "aws_humangov_infrastructure" {                                            
  source           = "./modules/aws_humangov_infrastructure"                    //NESSE PONTO, O TERRAFORM INVOCARÁ TODOS OS ARQUIVOS CRIADOS DENTRO DO DIRETÓRIO (aws_humangov_infrastructure 
  for_each         = { for state in toset(var.state_codes) : state => state }   //ITERA SIBRE UM CONJUNTO DE ESTADOS ESTADOS (var.state_codes
  state_name       = each.value                                                 //AQUI FOMENTARÁ A VARÁVEL DENTRO DO MÓDULO (modules), VALORES VINDO DA VARIÁVEL ROOT (states), UM A UM
  instance_count   = 2                                                          //DEFINE O NÚMERO DE INSTÂNCIAS QUE DESEJA CRIAR 
  state_codes      = { for idx, code in var.state_codes : code => code }        //TRANSFORMA OS VALORES DE var.state_codes EM UMA MAPA ONDE A CHAVE É O PRÓPRIO CÓDIGO E O VALOR TAMBÉM É O CÓDIGO
}

module "dns" {                                                                  //DEFININDO O MÓDULO
  source         = "./modules/dns"                                              //DEFINE O CAMINHO DE DIRETÓRIO ONDE O MÓDULO DNS ESTÁ LOCALIZADO
  domain_name    = "humangov.com"                                               //PASSA O NOME DO DOMÍNIO PRINCIPAL COMO "humangov.com" PARA O MÓDULO
  subdomain_name = "app.humangov.com"                                           //PASSA O NOME DO SUBDOMÍNIO PRINCIPAL COMO "app.humangov.com" PARA O MÓDULO
  state_ips = module.aws_humangov_infrastructure.state_ips                      //PASSA O VALOR DE state_ips, QUE É OBTIDO DO MÓDULO aws_humangov_infrastructure, PARA O MÓDULO DNS
  zone_id        = aws_route53_zone.primary.zone_id                             //PASSA O zone_id DA ZONA DO ROUTE 53 ONDE OS REGISTROS DNS SERÃO CRIADOS
  depends_on     = [module.aws_humangov_infrastructure]                         //DEFINE EXPLICITAMENTE QUE O MÓDULO DNS DEPENDE DA CRIAÇÃO DE module.aws_humangov_infrastructure
  state_codes    = var.state_codes                                              //PASSA A VARIÁVEL state_codes PARA O MÓDULO DNS
}

module "global_accelerator" {                                                   //NESSE PONTO, O TERRAFORM INVOCARÁ TODOS OS ARQUIVOS CRIADOS DENTRO DO DIRETÓRIO (global_accelerator)  
  source = "./modules/global_accelerator"                                       //DEFINIÇÃO DO CAMINHO DOS ARQUIVOS A SEREM INVOCADOS
  depends_on    = [module.aws_humangov_infrastructure, module.dns]
}

resource "aws_route53_zone" "primary" {                                         //CRIA UMA ZONA DNS NO SERVIÇO AMAZON Route 53
  name = "humangov.com"                                                         //DEFININDO O NOOME DA ZONA
}

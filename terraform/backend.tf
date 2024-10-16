#CRIANDO UM BLOCO DE CONFIGURAÇÃO DO TERRAFORM
terraform {
  backend "s3" {                                           //INFORMANDO ONDE SERÁ ARMAZENADO O ARQUIVO
    bucket         = "humangov-terraform-state-xghpox"     //INFORMANDO O NOME DO BUCKET ONDE SERÁ ARMAZENADO
    key            = "terraform.tfstate"                   //INFORMANDO O NOME DO ARQUIVO A SER ARMAZENADO
    region         = "us-east-1"                           //INFORMANDO A REGIÃO ONDE O BUCKET FOI CRIADO
    encrypt        = true                                  //CRIANDO UMA CAMADA DE SEGURANÇA PARA 0 ARQUIVO
    dynamodb_table = "humangov-terraform-state-lock-table" //INFORMANDO O NOME DA TABELA DO DYNAMODB ONDE FICARA O ARQUIVO (.lock.info)
  }
}
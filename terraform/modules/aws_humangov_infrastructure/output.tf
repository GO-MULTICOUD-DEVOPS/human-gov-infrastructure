#DEFINIDO OUTPUTs
output "state_ec2_public_dns" {
  value = [for instance in aws_instance.state_ec2 : instance.public_dns]        //OS DADOS REFERENCIAM O TIPO DO RECURSO E O NOME INTERNO DO TERRAFORM (definidos no main.tf)
}

output "state_dynamodb_table" {
  value = aws_dynamodb_table.state_dynamodb.name                                //OS DADOS REFERENCIAM O TIPO DO RECURSO E O NOME INTERNO DO TERRAFORM (definidos no main.tf)
}

output "state_s3_bucket" {
  value = aws_s3_bucket.state_s3.bucket                                         //OS DADOS REFERENCIAM O TIPO DO RECURSO E O NOME INTERNO DO TERRAFORM (definidos no main.tf)
}

locals {
  state_ips = length(aws_instance.state_ec2) > 0 ? [for instance in aws_instance.state_ec2 : instance.public_ip] : []
}

                             //\\                                               
                            //  \\                                                
                           //    \\                                               
                          //_    _\\                                            //O CÓDIGO CRIA UMA LISTA state_ips QUE CONTÉM OS IPs PÚBLICOS DAS INSTÂNCIAS 
                            #|  |#_ _ _ _ _ _                                   //EC2 EM aws_instance.state_ec2, SE HOUVER ALGUMA.
                            #|_ _ _ _ _ _ _ _ |                                 //CASO CONTTRÁRIO, ELE DEFINE state_ips COMO UMA LISTA VAZIA.
                                                                                
output "state_ips" {
  value = { for k, inst in aws_instance.state_ec2 : k => inst.public_ip }       //CRIA UM MAPA CHAMADO VALUE, ONDE CADA CHAVE É O IDENTIFICADOR DA INSTÂNCIA (k), E CADA VALOR É O IP PÚBLICO (Public_ip) DA INSTÂNCIA (inst).
  depends_on = [aws_instance.state_ec2]                                         //GARANTE QUE O OUTPUT SÓ SERÁ ACESSÍVEL APÓS A CRIAÇÃO DE TODAS AS INSTÂNCIAS
  description = "Lista de IPs públicos das instâncias EC2 criadas"
}
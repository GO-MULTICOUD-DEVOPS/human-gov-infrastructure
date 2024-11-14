#CRIANDO UMA ZONA HOSPEDADA NO ROUTE 53 REPRESENTANDO O DOMÍNIO PRINCIPAL (humangov.org) ONDE OS REGISTROS DNS DE CADA ESTADO SERÃO CONFIGURADOS.
resource "aws_route53_zone" "primary" {                                         //CRIANDO UMA ZONA HOSPEDADA NO ROUTE 53  
  name = var.domain_name                                                        //INTERPOLANDO O NOME DO DOMÍNIO CONFIGURADO NO ARQUIVO /DNS/variable.tf             
}

resource "aws_route53_record" "state_redirect" {
  for_each = var.state_ips                                                      //PERMITE CRIAR  UM REGISTRO aws_route53_record PARA CADA ENTRADA NO MAPA var.state_ips.
  zone_id  = var.zone_id                                                        //DEFINE O ID DA ZONA DO ROUTE 53 ONDE O REGISTRO DNS SERÁ CRIADO
  name     = "${each.value}.${var.domain_name}"                                 //DEFINE O NOME DO REGISTRO DNS
  type     = "A"                                                                //ESPECIFICA O TIPO DE REGISTRO DNS COMO A, QUE É UM REGISTRO DE ENDEREÇO IP PARA APONTAR PARA UM ENDEREÇO IPV4
  ttl      = 300                                                                //DEFINE O Time-To-Live (TTL) DO REGISTRO DNS, EM 300 SEG (5min)
  records  = [var.state_ips[each.value]]                                        //DEFINE O ENDEREÇO IP QUE O REGISTRO DNS APONTA

  depends_on = [null_resource.dns_delay]                                        //DEFINE UMA DEPENDÊNCIA EXPLÍCITA NO RECURSO null_resource.dns_delay
}

#CONFIGURANDO VERIFICAÇÕES DE SAÚDE PARA CADA IP.
//ISSO GARANTE QUE, CASO UMA INSTÂNCIA ESTEJA FORA DO AR, O DNS POSSA REDIRECIONAR PARA OUTRA INSTÂNCIA.
resource "aws_route53_health_check" "state_health_check" {                      //CRIANDO UMA VERIFICAÇÃO DE SAÚDE
  count           = length(var.state_ips)                                       //INTERPOLANDO O NÚMERO TOTAL DE IPs LISTADOS NA VARIÁVEL state_ips
  type            = "HTTP"                                                      //DEFININDO O TIPO DE VERIFICAÇÃO DE SAÚDE
  ip_address      = var.state_ips[count.index]                                  //IP DE CADA INSTÂNCIA.        
  port            = 80                                                          //PORTA ONDE A APLICAÇÃO ESTARÁ OUVINDO (listener)
  resource_path   = "/health"                                                   //CAMINHO PARA VERIFICAR A RESPOSTA DO SERVIDOR.
  failure_threshold = 3                                                         //DEFININDO EM 3 O NÚMERO DE FALHAS CONSECUTIVAS PARA CONSIDERAR A INSTÂNCIA "não saudável".
}

resource "null_resource" "dns_delay" {                                          //RECURSO USADO PARA CONTROLAR A ORDEM DE EXECUÇÃO  
  provisioner "local-exec" {                                                    //EXECUTA UM COMANDO LOCALMENTE
    command = "sleep 120"                                                       //PAUSA/ESPERA DE 120 SEGUNDOS
  }

  depends_on = [var.state_ips]                                                  //GARANTE QUE SÓ SERÁ EXECUTADO DEPOIS QUE OS IPs ESTIVEREM DISPONÍVEIS
}

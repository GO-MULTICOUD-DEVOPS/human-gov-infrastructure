#CONFIGURANDO O AWS GLOBAL ACCELERATOR E O LISTENER ASSOCIADO
resource "aws_globalaccelerator_accelerator" "app_accelerator" {                //CRIANDO O SERVIÇO AWS GLOBAL ACCELERATOR 
  name             = "app-accelerator"                                          //DEFININDO O NOME DO ACCELERATOR PARA USO INTERNO DA CONTA AWS
  enabled          = true                                                       //HABILITANDO O ACCELERATOR
  ip_address_type  = "IPV4"                                                     //ESPECIFICANDO O TIPO DE ENDEREÇO IP QUE O ACCELERATOR USARÁ    
}

resource "aws_globalaccelerator_listener" "app_listener" {                      //DEFININDO O LISTENER PARA O ACCELERATOR CRIADO ANTERIORMENTE 
  accelerator_arn = aws_globalaccelerator_accelerator.app_accelerator.id        //REFERENCIANDO O ARN DO ACCELERATOR CRIADO
  protocol        = "TCP"                                                       //DEFININDO O PROTOCOLO QUE O LISTENER USARÁ
  port_range {                                                                  //ESPECIFICANDO O INTERVALO DE PORTA QUE O LISTENER IRÁ ESCUTAR
    from_port = 80                                                              //PORTA DE INÍCIO (http)    
    to_port   = 80                                                              //PORTA DE TÉRMINO (http)                    
  }
}

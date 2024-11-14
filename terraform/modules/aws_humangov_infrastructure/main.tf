#DEFINIÇÃO DOS BLOCOS DE CRIAÇÃO DOS RECURSOS NA AWS
resource "aws_security_group" "state_ec2_sg" {                                  //CRIANDO UMA SECURITY-GROUP NA AWS
  name        = "humangov-${var.state_name}-ec2-sg"                             //DEFININDO O NOME INTERPOLANDO COM A VARIÁVEL (state-name)
  description = "Allow traffic on ports 80 and 5000"                            //DESCREVENDO QUAIS SERÃO AS POSTAS DE ACESSO

  #CONFIGURANDO A PORTA|PROTOCOLO|CIDR
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]                                                 //DEFINIMOS CIDR=ALL SOMENTE PARA O LABORATÓRIO, POIS ESSA NÃO SERIA UMA BOA PRÁTICA DE SEGURANÇA
  }
  
  ingress {
    from_port   = 5000                                                          //ESSA PORTA É PARA COMUNICAÇÃO INTERNA, DEIXAREI HABILITADA CASO HOUVER UMA EVENTUALIDADE NO FLASK.
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                                                          //LIBERA TODOS OS PROTOCOLOS
    security_groups = ["sg-0fca8919ca0a3a6e5"]                                  //PERMITE A COMUNICAÇÃO DO CLOOUD9.
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                                                          //LIBERA TODOS OS PROTOCOLOS        
    cidr_blocks = ["0.0.0.0/0"]                                                 //TODA A REDE
  }
 
 #DEFININDO UMA TAG INTERPOLANDO COM A VARIÁVEL (state_name)    
  tags = {
    Name = "humangov-${var.state_name}"
  }
}

resource "aws_instance" "state_ec2" {                                           //CRIANDO UMA INSTÂNCIA EC2 NA AWS
  for_each = { for code in var.state_codes : code => code }                     //O TERRAFORM CRIARÁ UMA INSTÂNCIA DO RECURSO PARA CADA CÓDIGO DE ESTADO EM var.state_codes ("CA", "FL", "NV")
  ami                    = "ami-007855ac798b5175e"                              //DEFININDO A IMAGEM A SER INSTALADA NA VM
  instance_type          = "t2.micro"                                           //DEFININDO O TIPO DA VM
  key_name               = "humangov-ec2-key"                                   //DEFININDO A KEY-PAIR JA CRIADA NA CONSOLE
  vpc_security_group_ids = [aws_security_group.state_ec2_sg.id]                 //DEFININDO A SG INTERPOLANDO COM O RECURSO CRIADO ACIMA
  iam_instance_profile = aws_iam_instance_profile.s3_dynamodb_full_access_instance_profile.name   //ANEXANDO O INSTANCE_PROFILE NA INSTANCE EC2

   provisioner "local-exec" {
	  command = "sleep 30; ssh-keyscan ${self.private_ip} >> ~/.ssh/known_hosts"
	        //"sleep 30;                                                          -> AGUARDAR 30 SEGUNDO ATÉ CONCLUIR A CRIAÇÃO DA VM
          //ssh-keyscan                                                         -> IRÁ ESCANEAR A CHAVE PÚBLICA DENTRO DO RECURSO
          //${self.private_ip}                                                  -> IRÁ PEGAR O IP PRIVADO DO RECURSO
          //>> ~/.ssh/known_hosts"                                              -> IRÁ GRAVAR DENTRO DO KNOWN_HOST
	}
	
	provisioner "local-exec" {
	  command = "echo ${var.state_name} id=${self.id} ansible_host=${self.private_ip} ansible_user=ubuntu us_state=${var.state_name} aws_region=${var.region} aws_s3_bucket=${aws_s3_bucket.state_s3.bucket} aws_dynamodb_table=${aws_dynamodb_table.state_dynamodb.name} >> /etc/ansible/hosts"
	        //"echo                                                               -> IRÁ GRAVAR TODAS AS VARIÁVEIS DENTRO DO ARQUIVO HOSTS NO ENDEREÇO: /etc/ansible/hosts.
          //${var.state_name}                                                   -> IRÁ REGISTRAR A VARIÁVEL STATE_NAME, QUE SERÁ O NOME DO ESTADO
          //id=${self.id}                                                       -> IRÁ REGISTRAR O ID DA MÁQUINA PARA, QUANDO COMANDADO O "terraform destroy", ESSE ID SERÁ EXCLUIDO AUTOMATICAMENTE
          //ansible_host=${self.private_ip}                                     -> IRÁ SETAR O IP PRIVADO NA VARIÁVEL "ansible_host" 
          //ansible_user=ubuntu                                                 -> IRÁ SETAR O NOME "UBUNTU" NA VARIÁVEL 'ansible_user" 
          //us_state=${var.state_name}                                          -> IRÁ SETAR O NOME DO ESTADO NA VARIÁVEL "us_state" 
          //aws_region=${var.region}                                            -> IRÁ SETAR QUAL A REGIÃO NA VARIÁVEL "aws_region"
          //aws_s3_bucket=${aws_s3_bucket.state_s3.bucket}                      -> IRÁ SETAR O NOME DO BUCKET S3 NA VARIÁVEL "aws_s3_bucket"
          //aws_dynamodb_table=${aws_dynamodb_table.state_dynamodb.name}        -> IRÁ SETAR O NOME DA TABELA DO DYNAMO_DB NA VARIÁVEL "aws_dynamodb_table"
          //>> /etc/ansible/hosts"                                              -> ENDEREÇO ONDE SERÁ SETADO TODAS ESSAS VARIÁVEIS
	}
	
	provisioner "local-exec" {
	  command = "sed -i '/${self.id}/d' /etc/ansible/hosts"
	        //"sed                                                                -> EDITA ARQUIVOS DE CONFIGURAÇÃO DO TERRAFORM
          //-i '/${self.id}/                                                    -> IRÁ PESQUISAR O SELF.ID
          ///etc/ansible/hosts"                                                 -> A PESQUISA SERÁ FEITA NESSE ENDEREÇO
          //d'                                                                  -> DEPOIS DE PESQUISAR, O ID SERÁ DELETADO.
	  when = destroy
	}

  tags = {
    Name = "humangov-${each.key}"                                               //CRIA UM NOME ÚNICO PARA CADA INSTÂNCIA DO RECURSO COM BASE NA CHAVE ATUAL DO MAPA
  }
}

#CRIANDO UMA TABELA NO AWS DYNAMO-DB
resource "aws_dynamodb_table" "state_dynamodb" {                                //DEFININDO RECURSO
  name         = "humangov-${var.state_name}-dynamodb"                          //DEFININDO NOME INTERPOLANDO COM A VARIÁVEL (state_name)
  billing_mode = "PAY_PER_REQUEST"                                              //DEFININDO O MODO DE PAGAMENTO PARA (Pago por requisição)
  hash_key     = "id"                                                           //DEFININDO A CHAVE PRIMÁRIA

  attribute {
    name = "id"                                                                 //NOME DA COLUNA
    type = "S"                                                                  //TIPO STRING
  }

  tags = {
    Name = "humangov-${var.state_name}"                                         //DEFININDO UMA TAG INTERPOLANDO COM A VARIÁVEL (state_name)
  }
}

#UTILIZANDO A BIBLIOTECA RANDOM DO PYTHON PARA GERAR LETRAS ALEATÓRIAS
resource "random_string" "bucket_suffix" {                                      //DEFININDO RECURSO
  length  = 4                                                                   //DEFININDO A QUANTIDADE DE LETRAS
  special = false                                                               //FALSO PARA CARACTERES ESPECIAIS (respeitando a regra de criação do bucket)
  upper   = false                                                               //FALSO PARA LETRAS MAIÚSCULAS (respeitando a regra de criação do bucket)
}

#CRIAÇÃO DE UM BUCKET NO AWS-S3
resource "aws_s3_bucket" "state_s3" {                                            //DEFININDO RECURSO
  bucket = "humangov-${var.state_name}-s3-${random_string.bucket_suffix.result}" //DEFININDO O NOME + INTERPOLANDO A VARIÁVEL (state_name) + s3 + INTERPOLANDO O RESULTADO GERADO PELA BIBLIOTECA RANDOM

  tags = {
    Name = "humangov-${var.state_name}"                                         //DEFININDO UMA TAG INTERPOLANDO COM A VARIÁVEL (state_name)
  }
}

resource "aws_iam_role" "s3_dynamodb_full_access_role" {                        //DEFININDO RECURSO [ROLE PARA S3 E DYNAMO-DB]
  name = "humangov-${var.state_name}-s3_dynamodb_full_access_role"              //DEFININDO NOME INTERPOLANDO COM A VARIÁVEL (state_name)

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"                                        
      },
      "Effect": "Allow", 
      "Sid": ""
    }
  ]
}
EOF

                             //\\                                               //<<EOF==ENCAPSULANDO O CONTEÚDO DA POLÍTICA EM UMA STTRING
                            //  \\                                              //"Version": "2012-10-17" == ESPECIFICANDO A VERSÃO DO DOCUMENTO DA POLÍTICA DE SEGURANÇA  
                           //    \\                                             //"Statement" == DEFININDO UMA LISTA DE DECLARAÇÕES QUE COMPÕE A POLÍTICA  
                          //_    _\\                                            //"Action": "sts:AssumeRole" == ESPECIFICA QUE ESSA PERMISSÃO É PARA PERMITIR A ASSUNÇÃO DE UMA ROLE
                            #|  |#_ _ _ _ _ _                                   //"Principal" ==  INDICANDO QUEM ESTÁ AUTORIZANDO A SSUMIR ESSA ROLE
                            #|_ _ _ _ _ _ _ _ |                                 //"Service": "ec2.amazonaws.com" == PERMITINDO QUE AS INSTÂNCIA EC2 DA AWS ASSUME ESSA ROLE
                                                                                //"Effect": "Allow" == PERMITINDO A AÇÃO ESPECIFICADA
                                                                                //"Sid": "" == É O ID DA DECLARAÇÃO, QUE SERVE COMO UM IDENTIFICADOR. NESSE CASO ESTÁ VAZIO
                                                                                //EOF==FECHANDO O ENCAPSULAMENTO

  tags = {                                                                      
        Name = "humangov-${var.state_name}"                                     //DEFININDO UMA TAG INTERPOLANDO COM A VARIÁVEL (state_name)                                     
  }  
  
}

resource "aws_iam_role_policy_attachment" "s3_full_access_role_policy_attachment" {        //ATACHANDO POLÍTICAS NA ROLE
  role       = aws_iam_role.s3_dynamodb_full_access_role.name                              //ROLE DEFINIDA       
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"                                //POLÍTICA A SER ATACHADA  
  
}

resource "aws_iam_role_policy_attachment" "dynamodb_full_access_role_policy_attachment" {  //ATACHANDO POLÍTICAS NA ROLE
  role       = aws_iam_role.s3_dynamodb_full_access_role.name                              //ROLE DEFINIDA  
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"                          //POLÍTICA A SER ATACHADA 

}

resource "aws_iam_instance_profile" "s3_dynamodb_full_access_instance_profile" {            //ANEXANDO A ROLE NA ISNTANCE EC2
  name = "humangov-${var.state_name}-s3_dynamodb_full_access_instance_profile"              //DEFININDO O NOME INTERPOLANDO COM A VARIÁVEL (state-name)
  role = aws_iam_role.s3_dynamodb_full_access_role.name                                     //DEFININDO A ROLE QUE SERÁ ANEXADA

  tags = {
      Name = "humangov-${var.state_name}"                                                   //DEFININDO UMA TAG INTERPOLANDO COM A VARIÁVEL (state_name
  }  
}





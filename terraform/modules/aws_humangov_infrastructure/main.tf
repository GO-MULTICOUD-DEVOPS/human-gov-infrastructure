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
  ami                    = "ami-007855ac798b5175e"                              //DEFININDO A IMAGEM A SER INSTALADA NA VM
  instance_type          = "t2.micro"                                           //DEFININDO O TIPO DA VM
  key_name               = "humangov-ec2-key"                                   //DEFININDO A KEY-PAIR JA CRIADA NA CONSOLE
  vpc_security_group_ids = [aws_security_group.state_ec2_sg.id]                 //DEFININDO A SG INTERPOLANDO COM O RECURSO CRIADO ACIMA
  iam_instance_profile = aws_iam_instance_profile.s3_dynamodb_full_access_instance_profile.name   //ANEXANDO O INSTANCE_PROFILE NA INSTANCE EC2

  tags = {
    Name = "humangov-${var.state_name}"                                         //DEFININDO UMA TAG INTERPOLANDO COM A VARIÁVEL (state_name)  
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

  tags = {                                                                      
        Name = "humangov-${var.state_name}"                                    
  }  
  
}

resource "aws_iam_role_policy_attachment" "s3_full_access_role_policy_attachment" {       //ATACHANDO POLÍTICAS NA ROLE
  role       = aws_iam_role.s3_dynamodb_full_access_role.name                             //ROLE DEFINIDA       
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"                               //POLÍTICA A SER ATACHADA  
  
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





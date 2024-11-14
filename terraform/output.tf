#DEFININDO OUTPUT PARA O MODO ROOT
//PARA NÃO CRIAR DEZENAS DE OUTPUTS, DEFINI UMA ESTRUTURA DE REPETIÇÃO QUE BUSCARÁ OS DADOS DENTRO DO MÓDULO, E IRÁ IMPRIMIR O OUTPUT PARA CADA SERVIÇO EM TODOS OS ESTADOS.

output "state_infrastructure_outputs" {                                         //DEFININDO O NOME DO OUTPUT
  value = {
    for state, infrastructure in module.aws_humangov_infrastructure :           //AS VARIÁVEIS (state e infrastructure) IRÁ RODAR DENTRO DO MÓDULO
    state => {                                                                  //DEFININDO "PARA ESTE -state- IMPRIME AS SEGUINTES INFORMAÇÕES"
      ec2_public_dns = infrastructure.state_ec2_public_dns                      //OUTPUT DO DNS DA EC2
      dynamodb       = infrastructure.state_dynamodb_table                      //OUTPUT DO NOME DA TABELA DO DYNAMODB
      s3_bucket      = infrastructure.state_s3_bucket                           //OUTPUT DO NOME DO BUCKET
      zone_id        = module.dns.zone_id                                       //OUTPUT DO ID DA ZONA HOSPEDADA
    }
  }
}

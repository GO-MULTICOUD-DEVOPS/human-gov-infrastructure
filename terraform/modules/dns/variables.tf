#DEFININDO AS VARIÁVEIS QUE SERÃO PASSADAS PARA O MÓDULO DNS

#ESTA VARIÁVEL DETERMINA O NOME DO DOMÍNIO
variable "domain_name" {                                                        
  description = "Domain name for Route 53 Hosted Zone"                                      
  type        = string                                                             
}

#ESTA VARIÁVEL DETERMINA O NOME DO SUBDOMÍNIO
variable "subdomain_name" {                                                         
  description = "Subdomain for DNS record"
  type        = string
  default     = "app"
}

#ESTA VARIÁVEL DETERMINA OS IPs PÚBLICOS DAS INSTÂNCIAS EC2
variable "state_ips" {
  type        = map(string)
  description = "Mapa de IPs por código de estado, provenientes do módulo aws_humangov_infrastructure"
}


#ESTA VARIÁVEL DETERMINA A LISTA DE CÓDIGOS DE REFERÊNCIA PARA CADA ESTADO
variable "state_codes" {
  description = "List of state codes (e.g., NY, CA)"
  type        = list(string)
}

#ESTA VARIÁVEL DETERMINA OS IDs DAS ZONAS HOSPEDADAS
variable "zone_id" {
  description = "ID da zona Route 53"
  type        = string
}

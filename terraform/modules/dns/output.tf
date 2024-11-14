#DEFINIDO OUTPUTs
output "zone_id" {                                                              
  value = var.zone_id                                                           //OS DADOS REFERENCIAM A ZONA HOSPEDADA, O NOME INTERNO DO TERRAFORM E O ID DA ZONA (definidos no /DNS/main.tf)   
    
}

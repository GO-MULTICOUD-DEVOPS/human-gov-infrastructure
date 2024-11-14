#VARIÁVEL PARA O MODO ROOT
variable "states" {                                                             //OBS: ESSA VARÍAVEL 'root' ALIMENTARÁ A VARIÁVEL DENTRO DO DIRETÓRIO 'modules'.
  description = "A list of states names"
  default     = ["california","florida","nevada"]                               //AQUI COLOCAMOS OS NOMES DOS ESTADOS QUE SERÃO REPRESENTADOS DENTRO DA INFRA.
}

variable "state_codes" {                                                        //OBS: ESSA VARÍAVEL 'root' ALIMENTARÁ A VARIÁVEL DENTRO DO DIRETÓRIO 'dns'.
  type    = list(string)
  default = ["CA", "FL", "NV"]                                                  //AQUI COLOCAMOS AS ABREVIAÇÕES DOS ESTADOS QUE SERÃO REPRESENTADOS DENTRO DA INFRA.
  description = "Lista de abreviações dos estados americanos"
}

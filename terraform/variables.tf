#VARIÁVEL PARA O MODO ROOT
variable "states" { //OBS: ESSA VARÍAVEL 'root' ALIMENTARÁ A VARIÁVEL DENTRO DO DIRETÓRIO 'modules'.
  description = "A list of states names"
  default     = ["california", "florida", "texas"] //AQUI COLOCAMOS OS NOMES DOS ESTADOS QUE SERÃO REPRESENTADOS DENTRO DA INFRA.
}
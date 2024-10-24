
<img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" width="30" height="20">[![Inglês](https://img.shields.io/badge/lang-English-blue)](README-en.md)


<div align="center"><h1>#IMPLEMENTAÇÃO DE UMA INFRAESTRUTURA ‘SaaS’, ‘Multi-tenant’ e ‘Reutilizável’ NA AWS</h1> 



![Arquitetura](https://github.com/GO-MULTICOUD-DEVOPS/human-gov-infrastructure/blob/main/PORTFOLIO%20DEVOPS%20%20MODULE%203%20ARQUITETURA.png?raw=true)



<p align="left"> <h2>##Projeto Incrível</h2><br> <i><h4>Neste projeto baseado em um cenário do mundo real, executei a implementação de infraestrutura SaaS ‘reutilizável’ e ‘multi-tenant’ na AWS usando módulos Terraform.</i> </h4></p><br><br>



<div align="left"><h2>🔥 ##Funcionalidades</h2></div>


<div align="left"><h4>🚀 ###Funcionalidade 1:</h4></div> 
  
<div align="left"><h4>Controle de Versão e Concorrência

Utilização do GitHub para armazenamento seguro dos arquivos de configuração do Terraform, permitindo controle de versão e integração entre equipes.

Implementação de uma tabela separada no AWS DynamoDB para gerenciar o arquivo _humangov-terraform-state.lock.info_, garantindo controle de concorrência.</h4></div>
  
<div align="left"><h4>🎯 ###Funcionalidade 2:</h4></div> 
<div align="left"><h4>Armazenamento Remoto e Segurança</h4></div>

<div align="left"><h4>Criação de um bucket no AWS S3 para armazenar o arquivo _terraform.tfstate_, proporcionando um armazenamento seguro e centralizado para a infraestrutura.

Configuração de backend remoto no Terraform para usar o bucket S3 e a tabela DynamoDB, garantindo integridade e consistência do provisionamento.</h4></div>

<div align="left"><h4>⚡ ###Funcionalidade 3:</h4></div> 
<div align="left"><h4>Automação e Modularização da Infraestrutura</h4></div>

<div align="left"><h4>Estruturação da infraestrutura em módulos no Terraform, permitindo gerenciar todos os recursos como uma unidade lógica.

Desenvolvimento de uma automação reutilizável para provisionamento e gerenciamento escaláveis, permitindo replicação eficiente da arquitetura para múltiplas regiões.</h4></div><br><br>



<div align="left"><h2>🌟 ##Descrição</h2></div>

<div align="left"><i><h4>A infraestrutura foi baseada em serviços AWS, como instâncias EC2, bancos de dados DynamoDB e buckets S3. Para garantir o armazenamento seguro dos arquivos de configuração do Terraform, utilizei o GitHub para gerir um controle de versão remoto, proporcionando a integração de equipes. Para o controle de concorrência, criei uma tabela separada no AWS DynamoDB, para armazenar o arquivo _humangov-terraform-state.lock.info_, e para proteger a infraestrutura contra possíveis acidentes, criei um bucket no AWS S3 para armazenar o arquivo _terraform.tfstate_.</i> </h4></div>

<div align="left"><i><h4>Veja o passo a passo desse projeto no meu protifólio <a href="https://medium.com/@go-multicloud-devops/humangov-implementação-de-uma-infraestrutura-saas-multi-tenant-e-reutilizável-na-aws-490401bcfd16">Medium</a> </i> </h4> </div><br><br>



<div align="left"><h2> 🛠️ ##Instalação</h2></div>

<div align="left"><h3>Instruções de como instalar e configurar o projeto.</h3></div>

<div align="left"><h4>###1. Clonar o Repositório</h4></div>
<div align="left"><h5>Clone o repositório do projeto do GitHub:</h5></div>



<div align="left"><h4>###2. Configurar o Par de Chaves</h4></div>

<div align="left"><h5>Crie um par de chaves via AWS Console:

Acesse o AWS Console.

Navegue até a seção "EC2".

Selecione "Key Pairs" e crie um novo par de chaves.</h5></div>


<div align="left"><h4>###3. Estruturação dos Diretórios</h4></div>
<div align="left"><h5>Organize os diretórios para os módulos do Terraform:</h5></div>



<div align="left"><h4>###4. Configuração dos Arquivos Principais</h4></div>

<div align="left"><h5>Crie e configure os arquivos principais no diretório raiz (ROOT):

main.tf

variables.tf

output.tf

</h5></div>



<div align="left"><h4>###5. Provedor AWS e Blocos de Criação</h4></div>

<div align="left"><h5>Configure o provedor AWS e os blocos de criação de recursos no main.tf:</h5></div>



<div align="left"><h4>###6. Configuração do Backend Remoto</h4></div>
<div align="left"><h5>Configure o backend remoto para armazenamento do estado do Terraform e bloqueio de concorrência:</h5></div>



<div align="left"><h4>###7. Aplicar a Configuração</h4></div>
<div align="left"><h5>Execute os comandos para formatar, validar e provisionar a infraestrutura:</h5></div>



<div align="left"><h4>###8. Configuração dos Outputs</h4></div>
<div align="left"><h5>Configure os outputs no output.tf para exibir informações úteis:</h5></div>



<div align="left"><h4>###9. Commit e Push das Alterações</h4></div>
<div align="left"><h5>Realize commit e push das alterações para o GitHub:</h5></div>



<div align="left"><h4>Pronto, seu projeto está configurado! Sinta-se à vontade para personalizar conforme necessário. 🚀</h4></div><br>



<div align="left"><a href="https://medium.com/@go-multicloud-devops/humangov-implementação-de-uma-infraestrutura-saas-multi-tenant-e-reutilizável-na-aws-490401bcfd16">VEJA o Passo-a-passo em detalhes.</a></i></h4></p></div><br><br>




<div align="left"><h2>🤝 ##Contribuição</h2></div>

<div align="left"><h4>- Faça um fork do projeto</h4></div>

<div align="left"><h4>- Dê sugestões de melhorias</h4></div>

<div align="left"><h3>#Este projeto foi desenvolvido com a orientação e apoio da The Cloud Bootcamp, que forneceu as informações, códigos e imagens utilizados.#</h3></div><br><br><br>

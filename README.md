<div align="center"><h1>IMPLEMENTAÇÃO DE UMA INFRAESTRUTURA ‘SaaS’, ‘Multi-tenant’ e ‘Reutilizável’ NA AWS</h1> 

<div align="center"><h5>For the English translation, please continue scrolling.</h5></div>


![Arquitetura](https://github.com/GO-MULTICOUD-DEVOPS/human-gov-infrastructure/blob/main/PORTFOLIO%20DEVOPS%20%20MODULE%203%20ARQUITETURA.png?raw=true)



<p align="left"> <h2>Projeto Incrível</h2><br> <i><h4>Neste projeto baseado em um cenário do mundo real, executei a implementação de infraestrutura SaaS ‘reutilizável’ e ‘multi-tenant’ na AWS usando módulos Terraform.</i> </h4></p><br><br>



<div align="left"><h2>🔥 Funcionalidades</h2></div>


<div align="left"><h4>🚀 Funcionalidade 1:</h4></div> 
  
<div align="left"><h4>Controle de Versão e Concorrência

Utilização do GitHub para armazenamento seguro dos arquivos de configuração do Terraform, permitindo controle de versão e integração entre equipes.

Implementação de uma tabela separada no AWS DynamoDB para gerenciar o arquivo _humangov-terraform-state.lock.info_, garantindo controle de concorrência.</h4></div>
  
<div align="left"><h4>🎯 Funcionalidade 2:</h4></div> 
<div align="left"><h4>Armazenamento Remoto e Segurança</h4></div>

<div align="left"><h4>Criação de um bucket no AWS S3 para armazenar o arquivo _terraform.tfstate_, proporcionando um armazenamento seguro e centralizado para a infraestrutura.

Configuração de backend remoto no Terraform para usar o bucket S3 e a tabela DynamoDB, garantindo integridade e consistência do provisionamento.</h4></div>

<div align="left"><h4>⚡ Funcionalidade 3:</h4></div> 
<div align="left"><h4>Automação e Modularização da Infraestrutura</h4></div>

<div align="left"><h4>Estruturação da infraestrutura em módulos no Terraform, permitindo gerenciar todos os recursos como uma unidade lógica.

Desenvolvimento de uma automação reutilizável para provisionamento e gerenciamento escaláveis, permitindo replicação eficiente da arquitetura para múltiplas regiões.</h4></div><br><br>



<div align="left"><h2>🌟 Descrição</h2></div>

<div align="left"><i><h4>A infraestrutura foi baseada em serviços AWS, como instâncias EC2, bancos de dados DynamoDB e buckets S3. Para garantir o armazenamento seguro dos arquivos de configuração do Terraform, utilizei o GitHub para gerir um controle de versão remoto, proporcionando a integração de equipes. Para o controle de concorrência, criei uma tabela separada no AWS DynamoDB, para armazenar o arquivo _humangov-terraform-state.lock.info_, e para proteger a infraestrutura contra possíveis acidentes, criei um bucket no AWS S3 para armazenar o arquivo _terraform.tfstate_.</i> </h4></div>

<div align="left"><i><h4>Veja o passo a passo desse projeto no meu protifólio <a href="https://medium.com/@go-multicloud-devops/humangov-implementação-de-uma-infraestrutura-saas-multi-tenant-e-reutilizável-na-aws-490401bcfd16">Medium</a> </i> </h4> </div><br><br>



<div align="left"><h2> 🛠️ Instalação</h2></div>

<div align="left"><h3>Instruções de como instalar e configurar o projeto.</h3></div>

<div align="left"><h4>1. Clonar o Repositório</h4></div>
<div align="left"><h5>Clone o repositório do projeto do GitHub:</h5></div>



<div align="left"><h4>2. Configurar o Par de Chaves</h4></div>

<div align="left"><h5>Crie um par de chaves via AWS Console:

Acesse o AWS Console.

Navegue até a seção "EC2".

Selecione "Key Pairs" e crie um novo par de chaves.</h5></div>


<div align="left"><h4>3. Estruturação dos Diretórios</h4></div>
<div align="left"><h5>Organize os diretórios para os módulos do Terraform:</h5></div>



<div align="left"><h4>4. Configuração dos Arquivos Principais</h4></div>

<div align="left"><h5>Crie e configure os arquivos principais no diretório raiz (ROOT):

main.tf

variables.tf

output.tf

</h5></div>



<div align="left"><h4>5. Provedor AWS e Blocos de Criação</h4></div>

<div align="left"><h5>Configure o provedor AWS e os blocos de criação de recursos no main.tf:</h5></div>



<div align="left"><h4>6. Configuração do Backend Remoto</h4></div>
<div align="left"><h5>Configure o backend remoto para armazenamento do estado do Terraform e bloqueio de concorrência:</h5></div>



<div align="left"><h4>7. Aplicar a Configuração</h4></div>
<div align="left"><h5>Execute os comandos para formatar, validar e provisionar a infraestrutura:</h5></div>



<div align="left"><h4>8. Configuração dos Outputs</h4></div>
<div align="left"><h5>Configure os outputs no output.tf para exibir informações úteis:</h5></div>



<div align="left"><h4>9. Commit e Push das Alterações</h4></div>
<div align="left"><h5>Realize commit e push das alterações para o GitHub:</h5></div>



<div align="left"><h4>Pronto, seu projeto está configurado! Sinta-se à vontade para personalizar conforme necessário. 🚀</h4></div><br>



<div align="left"><a href="https://medium.com/@go-multicloud-devops/humangov-implementação-de-uma-infraestrutura-saas-multi-tenant-e-reutilizável-na-aws-490401bcfd16">VEJA o Passo-a-passo em detalhes.</a></i></h4></p></div><br><br>




<div align="left"><h2>🤝 Contribuição</h2></div>

<div align="left"><h4>- Faça um fork do projeto</h4></div>

<div align="left"><h4>- Dê sugestões de melhorias</h4></div>

<div align="left"><h3>#Este projeto foi desenvolvido com a orientação e apoio da The Cloud Bootcamp, que forneceu as informações, códigos e imagens utilizados.#</h3></div><br><br><br>



<div align="center"><h1>HumanGov: Deployment Of A Reusable Saas Multi-tenant AWS Infrastructure Using Terraform Modules Securely Storing Terraform Configuration Files On AWS Code Commit.
</h1> 

![Arquitetura](https://github.com/GO-MULTICOUD-DEVOPS/human-gov-infrastructure/blob/main/PORTFOLIO%20DEVOPS%20%20MODULE%203%20ARQUITETURA.png?raw=true)

<p align="left"> <h2>Incredible Project</h2><br> <i><h4>In this project based on a real-world scenario, I implemented ‘reusable’ and ‘multi-tenant’ SaaS infrastructure on AWS using Terraform modules.</i> </h4></p><br><br>


<div align="left"><h2>🔥 Features</h2></div>


<div align="left"><h4>🚀 Features 1:</h4></div> 
  
<div align="left"><h4>Version Control and Concurrency

Use of GitHub for secure storage of Terraform configuration files, allowing version control and integration between teams.

Implemented a separate table in AWS DynamoDB to manage the _humangov-terraform-state.lock.info_ file, ensuring concurrency control.</h4></div>
  
<div align="left"><h4>🎯 Features 2:</h4></div> 
<div align="left"><h4>Remote Storage and Security</h4></div>

<div align="left"><h4>Creating a bucket on AWS S3 to store the _terraform.tfstate_ file, providing secure and centralized storage for the infrastructure.

Remote backend configuration in Terraform to use S3 bucket and DynamoDB table, ensuring provisioning integrity and consistency.</h4></div>

<div align="left"><h4>⚡ Features 3:</h4></div> 
<div align="left"><h4>Infrastructure Automation and Modularization</h4></div>

<div align="left"><h4>Structuring the infrastructure into modules in Terraform, allowing you to manage all resources as a logical unit.

Development of reusable automation for scalable provisioning and management, enabling efficient replication of the architecture across multiple regions.</h4></div><br><br>

<div align="left"><h2>🌟 Description</h2></div>

<div align="left"><i><h4>The infrastructure was based on AWS services such as EC2 instances, DynamoDB databases and S3 buckets. To ensure secure storage of Terraform configuration files, I used GitHub to manage remote version control, providing team integration. For competition control,
I created a separate table in AWS DynamoDB to store the _humangov-terraform-state.lock.info_ file, and to protect the infrastructure against possible accidents, I created a bucket in AWS S3 to store the _terraform.tfstate_ file.</i> </h4></div>

<div align="left"><i><h4>See the step by step of this project in my portfolio <a href="https://medium.com/@go-multicloud-devops/humangov-implementação-de-uma-infraestrutura-saas-multi-tenant-e-reutilizável-na-aws-490401bcfd16">Medium</a> </i> </h4> </div><br><br>



<div align="left"><h2> 🛠️ Installation</h2></div>

<div align="left"><h3>Instructions on how to install and configure the project.</h3></div>

<div align="left"><h4>1. Clone the Repository</h4></div>
<div align="left"><h5>Clone the project repository from GitHub:</h5></div>



<div align="left"><h4>2. Configure the Key Pair</h4></div>

<div align="left"><h5>Create a key pair via the AWS Console:

Access the AWS Console.

Navigate to the "EC2" section.

Select "Key Pairs" and create a new key pair.</h5></div>


<div align="left"><h4>3. Directory Structuring</h4></div>
<div align="left"><h5>Organize directories for Terraform modules:</h5></div>



<div align="left"><h4>4. Main Files Configuration</h4></div>

<div align="left"><h5>Create and configure the main files in the root directory (ROOT):

main.tf

variables.tf

output.tf
</h5></div>



<div align="left"><h4>5. AWS Provider and Building Blocks</h4></div>

<div align="left"><h5>Configure the AWS provider and resource creation blocks in main.tf:</h5></div>



<div align="left"><h4>6. Remote Backend Configuration</h4></div>
<div align="left"><h5>Configure the remote backend for Terraform state storage and concurrency blocking:</h5></div>



<div align="left"><h4>7. Apply the Configuration</h4></div>
<div align="left"><h5>Run the commands to format, validate, and provision the infrastructure:</h5></div>



<div align="left"><h4>8. Output Configuration</h4></div>
<div align="left"><h5>Configure outputs in output.tf to display useful information:</h5></div>



<div align="left"><h4>9. Commit and Push Changes</h4></div>
<div align="left"><h5>Commit and push changes to GitHub:</h5></div>



<div align="left"><h4>That’s it, your project is configured! Feel free to customize as needed. 🚀</h4></div><br>



<div align="left"><a href="https://medium.com/@go-multicloud-devops/humangov-implementação-de-uma-infraestrutura-saas-multi-tenant-e-reutilizável-na-aws-490401bcfd16">View the detailed step-by-step guide.</a></i></h4></p></div><br><br>

<div align="left"><h2>🤝 Contribution</h2></div>

<div align="left"><h4>- Fork the project</h4></div>

<div align="left"><h4>- Give suggestions for improvements</h4></div>

<div align="left"><h3>#This project was developed with the guidance and support of The Cloud Bootcamp, which provided the information, codes and images used.#</h3></div><br><br><br>

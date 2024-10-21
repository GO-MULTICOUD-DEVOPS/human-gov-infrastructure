<img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Flag_of_Brazil.svg" width="30" height="20">[![Portugês](https://img.shields.io/badge/lang-Português-green)](README.md)


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

#!/bin/bash

# Aplica o módulo de infraestrutura para criar as instâncias EC2 e gerar os IPs
echo "Aplicando módulo aws_humangov_infrastructure..."
terraform apply -target=module.aws_humangov_infrastructure -auto-approve

# Aplica o módulo de DNS para criar os registros Route53
echo "Aplicando módulo dns..."
terraform apply -target=module.dns -auto-approve

# Aplica o restante da infraestrutura (todas as dependências)
echo "Aplicando o restante da infraestrutura..."
terraform apply -auto-approve


#./apply.sh - CÓDIGO PARA ATIVAÇÃO DO CÓDIGO.

#!/bin/bash

# Atualiza os pacotes e instala dependências necessárias
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Adiciona a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adiciona o repositório Docker às fontes do sistema
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualiza o índice dos pacotes novamente
sudo apt update -y

# Instala o Docker e seus componentes
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Habilita e inicia o serviço Docker
sudo systemctl enable docker
sudo systemctl start docker

# Faz o download do Docker Compose mais recente
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name"' | cut -d '"' -f 4)
curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Torna o binário do Docker Compose executável
sudo chmod +x /usr/local/bin/docker-compose

# Verifica as versões instaladas
echo "Docker Version:"
docker --version
echo "Docker Compose Version:"
docker-compose --version

# Mensagem de finalização
echo "Instalação concluída"

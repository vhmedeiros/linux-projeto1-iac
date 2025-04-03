#!/bin/bash

echo "Atualizando os pacotes do sistema"
apt-get update -y
apt-get upgrade -y

echo "Instalando o Apache2..."
apt-get install apache2 -y

echo "Instalando o unzip..."
apt-get install unzip -y

echo "indo para a pasta /tmp..."
cd /tmp

echo "Baixando a aplicação do GitHub..."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Descompactando a aplicação..."
unzip main.zip

echo "Abrindo o diretorio da aplicação..."
cd linux-site-dio-main

echo "Copiando os arquivos para o diretório padrão do Apache..."
cp -R * /var/www/html/

echo "Instalação concluída com sucesso!"

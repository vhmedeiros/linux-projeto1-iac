#!/bin/bash

echo "Executando a Interface por Códigos..."

echo "Criando os diretórios..."
mkdir /publica /adm /ven /sec
echo "Diretórios criados!"

echo "Criando os grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo "Grupos criados!"

echo "Criando usuários..."
SHELL=/bin/bash
SENHA=$(openssl passwd -6 'Senha123@')

useradd carlos -c "Carlos" -s "$SHELL" -m -p "$SENHA"
passwd -e carlos
useradd maria -c "Maria" -s "$SHELL" -m -p "$SENHA"
passwd -e maria
useradd joao -c "João" -s "$SHELL" -m -p "$SENHA"
passwd -e joao

useradd debora -c "Débora" -s "$SHELL" -m -p "$SENHA"
passwd -e debora
useradd sebastiana -c "Sebastiana" -s "$SHELL" -m -p "$SENHA"
passwd -e sebastiana
useradd roberto -c "Roberto" -s "$SHELL" -m -p "$SENHA"
passwd -e roberto

useradd josefina -c "Josefina" -s "$SHELL" -m -p "$SENHA"
passwd -e josefina
useradd amanda -c "Amanda" -s "$SHELL" -m -p "$SENHA"
passwd -e amanda
useradd rogerio -c "Rogério" -s "$SHELL" -m -p "$SENHA"
passwd -e rogerio
echo "Usuários criados!"


echo "Aplicando usuários no grupo ADM..."
for usuario in carlos joao maria; do
	usermod -aG GRP_ADM "$usuario" 
done
echo "Aplicados!"

echo "Aplicando usuários no grupo ADM..."
for usuario in debora sebastiana roberto; do
	usermod -aG GRP_VEN "$usuario"
done
echo "Aplicados!"

echo "Aplicando usuários no grupo ADM..."
for usuario in josefina amanda rogerio; do
	usermod -aG GRP_SEC "$usuario"
done
echo "Aplicados!"


echo "Adicionando permissões total à pasta /publica..."
chmod -R 777 /publica
echo "Adicionada!"

echo "Adicionando permissões total ao grupo GRP_ADM à  pasta /adm..."
chown root:GRP_ADM /adm
chmod 770 /adm
echo "Adicionadas!"

echo "Adicionando permissões total ao grupo GRP_VEN à  pasta /ven..."
chown root:GRP_VEN /ven
chmod 770 /ven
echo "Adicionadas!"

echo "Adicionando permissões total ao grupo GRP_SEC à  pasta /sec..."
chown root:GRP_SEC /sec
chmod 770 /sec
echo "Adicionadas!"


echo "Tudo finalizado!"

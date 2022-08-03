#!/bin/bash
sudo apt update
sudo apt install git
sudo apt update
sudo apt install maven -y
sudo apt update
sudo apt install openjdk-11-jdk -y
sudo apt update
sudo apt install mysql-server -y
git clone https://github.com/DenisErenkov/spring-petclinic.git
cd /spring-petclinic
sudo sed -i 's/localhost/${link_db}/g' /spring-petclinic1/src/main/resources/application-mysql.properties
./mvnw package
sudo chmod 777 petservise.service
sudo mv petservise.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start petservise.service

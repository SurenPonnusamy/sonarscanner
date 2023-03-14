#!/bin/sh
token=$1
sonartoken=$2
apt-get update
cd /home
curl -sL https://deb.nodesource.com/setup_18.x | bash -
apt-get install nodejs -y
apt-get install npm -y
apt-get install wget unzip git ant -y
node -v
npm -v
wget https://github.com/wildfly/wildfly/releases/download/26.0.1.Final/wildfly-26.0.1.Final.zip
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
unzip sonar-scanner-cli-4.7.0.2747-linux.zip
unzip wildfly-26.0.1.Final.zip
rm -rf wildfly-26.0.1.Final.zip
rm -rf sonar-scanner-cli-4.7.0.2747-linux.zip
git clone https://$token@github.com/illuminateeducation/sc-suite-staff
ant -f build.xml
cd /home/sonar-scanner-4.7.0.2747-linux/bin
./sonar-scanner -Dsonar.login=$sonartoken
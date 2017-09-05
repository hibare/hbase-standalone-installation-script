#!/bin/sh

#Script to install Hbase in standalone mode

#Declaring color variables
RED='\033[0;36m' 	#CYAN COLOUR
NC='\033[0m'	 	#NO COLOUR
GREEN='\033[0;32m' 	#GREEN COLOUR
CYAN='\033[0;31m'	#RED COLOUR
YELLOW='\033[1;33m'

#Banner
echo "======================================================"
                                                  
echo "    [0;1;34;94m▄▄▄▄[0m   [0;34m▄▄▄▄▄▄[0m               [0;37m▄▄▄▄▄[0m   [0;1;30;90m▄▄▄[0m    [0;1;30;90m▄▄▄[0m"
echo "  [0;34m██▀▀▀▀█[0m  [0;34m██▀▀▀[0;37m▀██[0m   [0;37m▄████▄[0m   [0;37m█[0;1;30;90m▀▀▀▀██▄[0m  [0;1;30;90m██▄[0m  [0;1;30;90m▄█[0;1;34;94m█[0m" 
echo " [0;34m██▀[0m       [0;37m██[0m    [0;37m██[0m [0;37m▄██▀[0m  [0;1;30;90m▀██[0m        [0;1;30;90m██[0m   [0;1;34;94m██▄▄██[0m " 
echo " [0;37m██[0m        [0;37m█████[0;1;30;90m██[0m  [0;1;30;90m██[0m [0;1;30;90m▄█████[0m      [0;1;34;94m▄█▀[0m     [0;1;34;94m▀██▀[0m"   
echo " [0;37m██▄[0m       [0;1;30;90m██[0m  [0;1;30;90m▀██▄[0m [0;1;30;90m██[0m [0;1;30;90m█[0;1;34;94m█▄▄██[0m    [0;1;34;94m▄█▀[0m        [0;34m██[0m"    
echo "  [0;1;30;90m██▄▄▄▄█[0m  [0;1;30;90m██[0m    [0;1;34;94m██[0m [0;1;34;94m▀█▄[0m [0;1;34;94m▀▀▀▀▀[0m  [0;1;34;94m▄[0;34m██▄▄▄▄▄[0m     [0;34m██[0m"    
echo "    [0;1;30;90m▀▀▀▀[0m   [0;1;34;94m▀▀[0m    [0;1;34;94m▀▀▀[0m [0;1;34;94m▀██[0;34m▄▄▄█▄[0m  [0;34m▀▀▀▀▀▀▀▀[0m     [0;37m▀▀[0m"    
echo "                       [0;34m▀▀▀▀▀[0m"                      
                                                
echo "======================================================"
echo "	Hbase installation in standalone mode"
echo "	  Github: https://hibare.github.io/"
echo "		Website: http://hibare.in"  
echo "		License: MIT license"
echo "======================================================"


#store current path
home=`pwd`
echo $home


#JDK installation

#copy jdk file
echo "${CYAN}Installing JDK..."
#REPLACE HERE
sudo cp jdk-8u112-linux-x64.tar.gz /usr/lib

cd /usr/lib
#extract jdk file
sudo tar -xvf jdk-8u112-linux-x64.tar.gz

#remove compressed file
sudo rm jdk-8u112-linux-x64.tar.gz

cd $home

#Install Hbase
#copy hbase to desktop
echo "${GREEN}Installing hbase..."
#cp hbase-0.94.8.tar.gz ~/Desktop

#extract hbase files
#REPLACE HERE
tar -xvf hbase-0.94.8.tar.gz

#remove habse compressed file
#rm hbase-0.94.8.tar.gz

#create hbase directory
sudo mkdir /usr/lib/hbase

#move hbase folder
sudo mv hbase-0.94.8 /usr/lib/hbase/hbase-0.94.8

cd /usr/lib/hbase/hbase-0.94.8/conf
sudo rm hbase-site.xml

sudo echo "<?xml version=\"1.0\"?>" >> hbase-site.xml
sudo echo "<?xml-stylesheet type=\"text/xsl\" href=\"configuration.xsl\"?>" >> hbase-site.xml

sudo echo "<configuration>" >> hbase-site.xml
sudo echo "        <property>" >> hbase-site.xml
sudo echo "                <name>hbase.rootdir</name>" >> hbase-site.xml
sudo echo "                <value>$HOME/HBASE/hbase/</value>" >> hbase-site.xml
sudo echo "        </property>" >> hbase-site.xml

sudo echo "        <property>" >> hbase-site.xml
sudo echo "                <name>hbase.zookeeper.property.dataDir</name>" >> hbase-site.xml
sudo echo "                <value>$HOME/HBASE/zookeeper/</value>" >> hbase-site.xml
sudo echo "        </property>" >> hbase-site.xml
sudo echo "</configuration>" >> hbase-site.xml

cd
mkdir HBASE
mkdir HBASE/hbase
mkdir HBASE/zookeeper
echo "export HBASE_HOME=/usr/lib/hbase/hbase-0.94.8" >> .bashrc
echo "export PATH=\$PATH:\$HBASE_HOME/bin" >> .bashrc

#generate new host file
#cd /etc
touch hosts1

host=`hostname`
sudo echo "127.0.0.1		localhost" >> hosts1
sudo echo "127.0.0.1		$host" >> hosts1

sudo echo "# The following lines are desirable for IPv6 capable hosts" >> hosts1
sudo echo "::1     ip6-localhost ip6-loopback" >> hosts1
sudo echo "fe00::0 ip6-localnet" >> hosts1
sudo echo "ff00::0 ip6-mcastprefix" >> hosts1
sudo echo "ff02::1 ip6-allnodes" >> hosts1
sudo echo "ff02::2 ip6-allrouters" >> hosts1

sudo touch /etc/hosts_backup

sudo cp /etc/hosts  /etc/hosts_backup
sudo cp hosts1 /etc/hosts


echo "${RED}Complete...!${NC}"

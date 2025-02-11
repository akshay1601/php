#! /bin/bash 

# if [ -d "/opt/apache-maven-3.9.9" ]; then 
#     echo "Mvaen is installed"
# else
#     wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
#     sudo tar xf apache-maven-3.9.9-bin.tar.gz -C /opt
# fi 

if [ -d "php" ]; then 
    echo "Repo is present"
    cd /home/ubuntu/php
    git pull origin main
else
    git clone https://github.com/akshay1601/php.git 
    cd php
fi

# # Add Docker's official GPG key:
# sudo apt-get update -y 
# sudo apt-get install ca-certificates curl -y
# sudo install -m 0755 -d /etc/apt/keyrings
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
# sudo chmod a+r /etc/apt/keyrings/docker.asc

# # Add the repository to Apt sources:
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update -y 

# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
# sudo systemctl enable docker
# sudo chmod 777 /var/run/docker.sock
# sudo apt-get install docker-compose -y


# /opt/apache-maven-3.9.9/bin/mvn  package
# cd  /home/ubuntu/php
# IMAGE_NAME_PHP=$1 IMAGE_NAME_MYSQL=$2 BUILD_NUMBER=$3 docker-compose up -d 



# docker build -t $1:$2 .
# docker rm -f moneyuncle
# docker run -itd --name moneyuncle -p 8080:8080 $1:$2

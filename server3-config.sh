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

# #Installing kubernetes
swapoff -a

cat <<EOF | sudo tee  /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay

sudo modprobe br_netfilter


cat <<EOF | sudo tee  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

sudo apt-get install containerd -y

sudo mkdir -p /etc/containerd

sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/    SystemdCgroup = false/   SystemdCgroup = true/'  /etc/containerd/config.toml
sudo systemctl restart containerd

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update

apt-cache policy kubelet | head -n 20

VERSION=1.30.1-1.1
sudo apt install kubeadm=$VERSION kubelet=$VERSION kubectl=$VERSION -y 
sudo apt-mark hold kubeadm kubelet kubectl

sudo systemctl status kubelet.service
sudo systemctl status containerd.service

#kubectl apply -f https://docs.projectcalico.org/v3.25/manifests/calico.yaml

#Auto complete command for that need to execute the below command
sudo apt-get install bash-completion
echo "source <(kubectl completion bash)" >> ~/.bashrc
source ~/.bashrc

# /opt/apache-maven-3.9.9/bin/mvn  package
# cd  /home/ubuntu/php
# IMAGE_NAME_PHP=$1 IMAGE_NAME_MYSQL=$2 BUILD_NUMBER=$3 docker-compose up -d 



# docker build -t $1:$2 .
# docker rm -f moneyuncle
# docker run -itd --name moneyuncle -p 8080:8080 $1:$2

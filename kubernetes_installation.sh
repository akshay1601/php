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
# sudo apt-get install bash-completion
# echo "source <(kubectl completion bash)" >> ~/.bashrc
# source ~/.bashrc

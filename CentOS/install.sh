#!/bin/bash


TER_VERSION="1.8.5"
TERRAFORM=terraform_${TER_VERSION}_darwin_amd64.zip
TERRAGRUNT_V="0.59.7"
CHEFDK="4.13.3-1.el7"
NVM="0.39.1"
# ISTIO_V="1.16.0"
# K9S_V="0.27.1"



#echo "function to check if a command exists"
cli_exists(){
    command -v "$1" &> /dev/null
}


#installing wget
if ! cli_exists wget; then 
    echo "installing wget package"
    sudo yum install wget
else
   echo "wget already installed"
fi

#installing curl package
if ! cli_exists curl; then 
    echo "installing wget package"
    sudo yum install curl
else
   echo "curl already installed"
fi

#installing dpkg package
if ! cli_exists dpkg; then 
    echo "installing wget package"
    sudo yum install dpkg
else
   echo "dpkg already installed"
fi

#installing ChefDK
if ! cli_exists chefdk; then
    echo "installing ChefDK"
    wget https://packages.chef.io/files/stable/chefdk/4.13.3/el/8/chefdk-$CHEFDK.x86_64.rpm
    rpm -ivh chefdk-$CHEFDK.x86_64.rpm
    chef -v
else
   echo "chefdk already installed"
fi

#installing unzip package
if ! cli_exists unzip; then
    echo "isntalling unzip package"
    sudo yum install unzip
    which unzip
else
   echo "unzip already installed"
fi


#installing git
if ! cli_exists git; then
    echo "installing git"
    sudo yum install git
else
   echo "git already installed"
fi

#installing tree package
if ! cli_exists tree; then 
    echo "installing tree"
    sudo yum install tree
else
   echo "tree already installed"
fi

#installing nvm for node.js applications
if ! cli_exists nvm; then
    echo "installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM/install.sh | bash
#    source ~/.bash_profile
#    #now set up directories
#    export NVM_DIR="$HOME/.nvm"
#    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#    source ~/.bash_profile
else
   echo "NVM is already installed"
fi

#now installing node.js using nvm
if ! cli_exists node; then
    echo "install node.js"
    nvm install node
else
   echo "node.js is already installed"
fi


#install python using homebrew
if ! cli_exists python3; then 
    echo "installing python"
    sudo yum update -y
    sudo yum install gcc openssl-devel bzip2-devel libffi-devel -y
    sudo yum install -y python3
else
   echo "python3 already installed"
fi

#verify pip installation
if ! cli_exists pip3; then
    echo "pip3 is not installed, install pip"
    sudo yum install epel-release
    sudo yum -y install python-pip
    
else
   echo "pip3 already installed"
fi


#installing aws-cli

if ! cli_exists aws; then
    sudo yum remove awscli
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    #To verify that the shell can find and run the aws command in your $PATH
    which aws
    aws --version
else
   echo "AWS CLI already exists"
fi 




#installing aws session manager
if ! cli_exists session-manager-plugin; then
    sudo curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_32bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
    sudo yum install -y session-manager-plugin.rpm
else
   echo "AWS session Manager plugin exists"
fi


#installing visual studio code
if ! cli_exists code; then
    echo "installing VS Code"
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo yum install code
else
   echo "Visual Studio Code is already installed"
fi

#installing kubectl
if ! cli_exists kubectl; then
    echo "install kubctl"
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl  /usr/local/bin/
    sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
else
   echo "kubectl already exists"
fi


#installing minikube(for local kubernetes cluster)
#if ! cli_exists minikube; then
#    echo "installing minikube..."
#    sudo yum -y install epel-release
#    sudo yum -y install libvirt qemu-kvm virt-install virt-top libguestfs-tools bridge-utils
#    sudo systemctl start libvirtd
#    sudo systemctl enable libvirtd
#    systemctl status libvirtd
#    sudo usermod -a -G libvirt $(whoami)
#    wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
#    chmod +x minikube-linux-amd64
#    sudo mv minikube-linux-amd64 /usr/local/bin/minikube
#    sudo yum install -y minikube
#else
#   echo "minikube alredy exists..."
#fi


#installing tar
if ! cli_exists tar; then
    echo "installing tar"
    sudo yum search tar
    sudo yum install tar
    sudo yum update tar
else
   echo "tar already installed"
fi

#intalling jq
if ! cli_exists jq; then
    echo "installing jq"
    sudo yum install jq
else
   echo "jq already installed"
fi

#install helm package
#if ! cli_exists helm; then
#    echo "installing helm"
#    curl -o helm-v3.10.3-linux-amd64.tar.gz https://get.helm.sh/helm-v3.10.3-linux-amd64.tar.gz
#    chmod 777 helm-v3.10.3-linux-amd64.tar.gz
#    tar -zxvf helm-v3.10.3-linux-amd64.tar.gz
#    mv linux-amd64/helm /usr/local/bin/helm
#else
#   echo "helm package already exists"
#fi

#installing kubectx
if ! cli_exists kubectx; then
#    echo "installing kubectx"
    sudo yum install snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
#    sudo snap install kubectx --classic
else
   echo "kubectx/snap already installed"
fi

#install specific version of terraform
if ! cli_exists terraform; then
    echo "install terraform version package $TERRAFORM"
    curl -LO https://releases.hashicorp.com/terraform/$TER_VERSION/$TERRAFORM
    unzip $TERRAFORM
    sudo mv terraform /usr/local/bin
else
   echo "terraform already installed"
fi

#installing terragrunt
if ! cli_exists terragrunt; then
    echo "installing terragrunt specific version package"
    curl -LO https://github.com/gruntwork-io/terragrunt/releases/download/v$TERRAGRUNT_V/terragrunt_darwin_amd64
    sudo mv terragrunt_darwin_amd64 /usr/local/bin/terragrunt
    sudo chmod +x /usr/local/bin/terragrunt
else
   echo "terragrunt already installed"
fi


#installing k9s package
if ! cli_exists k9s; then
    echo "installing k9s"
    sudo snap install k9s
else
   echo "k9s already installed"
fi

if ! cli_exists java; then
    echo "installing java"
    sudo yum install java
    sudo yum install java-1.8.0-openjdk
    sudo yum install java-devel
    sudo yum install java-1.8.0-openjdk-devel
    sudo yum install java-17-openjdk
    sudo yum install java-12-openjdk
    sudo yum install java-16-openjdk
    sudo yum install java-21-openjdk
    
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm"
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/java/16/latest/jdk-16_linux-x64_bin.rpm"
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/java/12/latest/jdk-12_linux-x64_bin.rpm"
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.rpm"
    sudo yum localinstall jdk-17_linux-x64_bin.rpm
    sudo yum localinstall jdk-16_linux-x64_bin.rpm
    sudo yum localinstall jdk-12_linux-x64_bin.rpm
    sudo yum localinstall jdk-21_linux-x64_bin.rpm
else
   echo "java already installed"
fi

#verify all other packages
echo "installation complete. below is the installed versions:"

git --version
nvm --version
node --version
npm --version
chef --version
session-manager-plugin --version
pip3 --version
python3 --version
code --version
kubectl version --client --short
kubeadm version --client --short
minikube version
helm version --short
terraform --version
terragrunt --version
istioctl version --remote=false
k9s version
unzip --version


#below is what you do on your terminal to make sure the file is executable
#  1.  chmod +x install.sh           (PRESS ENTER)
#  2.  ./install.sh                  (PRESS ENTER TO EXECUTE THE .sh file)

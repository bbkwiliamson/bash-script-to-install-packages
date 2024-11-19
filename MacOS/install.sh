#!/bin/bash


TER_VERSION="1.8.5"
TERRAFORM=terraform_${TER_VERSION}_darwin_amd64.zip
TERRAGRUNT_V="0.59.7"
# ISTIO_V="1.16.0"
# K9S_V="0.27.1"



#echo "function to check if a command exists"
cli_exists(){
    command -v "$1" &> /dev/null
}

#chef if homebrew is installed
if cli_exists brew; then
    echo "Homebrew is already installed"
else
   echo "homebrew not found. attempt to install"
   
   #check if curl is available
   if cli_exists curl; then
       echo "curl found. installing homebrew...."
       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   else
      echo "curl not found. install xcode command line tool and press enter to continue"
      xcode-select --install

      #wait until the user confirms the x tools
      echo "install the xcode command line tool"
      read -r

      #now try again to install homebrew
      if cli_exists curl; then
          echo "curl is now available. installing homebrew...."
          /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      else
         echo "Failed to install curl. existing..."
         exit 1
      fi 
   fi 
fi 

# update homebrew
echo "Updating Homebrew"
brew update

#installing packages
brew create https://foo.com/foo-1.0.tgz
brew install --cask firefox
brew create --cask https://foo.com/foo-1.0.dmg

#installing ChefDK
if ! cli_exists chefdk; then
    echo "installing ChefDK"
    brew install --cask chef/chef/chefdk
else
   echo "chefdk already installed"
fi

#installing wget
if ! cli_exists wget; then 
    echo "installing wget package"
    brew install wget
else
   echo "wget already installed"
fi

#installing unzip package
if ! cli_exists unzip; then
    echo "installing unzip"
    brew install unzip
else
   echo "unzip already installed"
fi


#installing git
if ! cli_exists git; then
    echo "installing git"
    brew install git
else
   echo "git already installed"
fi

#installing tree package
if ! cli_exists tree; then 
    echo "installing tree"
    brew install tree
else
   echo "tree already installed"
fi

#installing nvm for node.js applications
if ! cli_exists nvm; then
    echo "installing nvm"
    brew install nvm
    #now set up directories        for setting up your profile
#    export NVM_DIR=~/.nvm
#    mkdir -p "$NVM_DIR"
#    export NVM_DIR=~/.nvm
#    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

    #add NVM to the bash or zsh profile  for setting up your profile
#    if [ -n "$BASH_VERSION"]; then
#        echo "export NVM_DIR=~/.nvm" >> ~/.bash_profile
#        echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh "' >> ~/.bash_profile
#    elif [ -n "$ZSH_VERSION" ]; then
#        echo "export NVM_DIR=~/.nvm" >> ~/.zshrc
#        echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh "' >> ~/.zshrc
#    fi
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
    brew install python
else
   echo "python3 already installed"
fi

#verify pip installation
if ! cli_exists pip3; then
    echo "pip3 is not installed, install pip"
    python3 -m ensurepip
else
   echo "pip3 already installed"
fi

#installing jq
if ! cli_exists jq; then 
    echo "installing jq"
    brew install jq
else
   echo "jq already installed"
fi


#installing aws-cli

if ! cli_exists aws; then
    echo "now installing AWS-CLI"
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
else
   echo "AWS CLI already exists"
fi 

#To verify that the shell can find and run the aws command in your $PATH
which aws
aws --version


#installing aws session manager
if ! cli_exists session-manager-plugin; then
    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
    unzip sessionmanager-bundle.zip
    sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin
else
   echo "AWS session Manager plugin exists"
fi


#installing visual studio code
if ! cli_exists code; then
    echo "installing VS Code"
    brew install --cask visual-studio-code
else
   echo "Visual Studio Code is already installed"
fi

#installing kubectl
if ! cli_exists kubectl; then
    echo "install kubctl"
    brew install kubctl
else
   echo "kubectl already exists"
fi

#install kubeadm
if ! cli_exists kubeadm; then
    echo "installing kubeadm"
    brew install kubeadm
else
   echo "kubeadm package already installed"
fi

#installing minikube(for local kubernetes cluster)
if ! cli_exists minikube; then
    echo "installing minikube..."
    brew install minikube
else
   echo "minikube alredy exists..."
fi


#install helm package
if ! cli_exists helm; then
    echo "installing helm"
    brew install helm
else
   echo "helm package already exists"
fi

#installing kubectx
if ! cli_exists kubectx; then
    echo "installing kubectx"
    brew install kubectx
else
   echo "kubectx already installed"
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

#install istio 
if ! cli_exists istioctl; then
    echo "installing istio version"
    brew install istioctl
else
   echo "istio is already installed"
fi

#installing k9s package
if ! cli_exists k9s; then
    echo "installing k9s"
    brew install k9s
else
   echo "k9s already installed"
fi

if ! cli_exists java; then
    echo "installing java"
    brew install openjdk@21
    brew install openjdk@17
    brew install openjdk@16
    brew install openjdk@12
    brew install openjdk@8
    brew install openjdk@1.8.0
    brew install java

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


#below is what you do on your terminal to make sure the file is executable
#  1.  chmod +x install.sh           (PRESS ENTER)
#  2.  ./install.sh                  (PRESS ENTER TO EXECUTE THE .sh file)

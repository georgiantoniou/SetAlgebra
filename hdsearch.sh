#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False

get_HDSearch () {

  if [[ ! -d "microsuite/" ]]; then
  
    mkdir microsuite
   
  fi

  if [[ ! -d "microsuite/HDSearch" ]]; then
  
    pushd microsuite 
    git clone https://github.com/ucy-xilab/MicroSuite.git
    popd

  fi

  cp Dockerfile ./microsuite
  cp docker-compose.yml ./microsuite

}

install_dep () {
  #sudo apt update
  sudo apt-add-repository ppa:ansible/ansible -y
  sudo apt update
  sudo apt install ansible -y
  ansible-playbook -i hosts ansible/install_dep.yml
}

build () {
  #get_HDSearch
  pushd ~
  tar -czf HDSearch.tgz HDSearch
  popd
 }	

build_install () {
  install_dep
  build
  ansible-playbook -v -i hosts ansible/install.yml
  echo "irtaaaaaaaaaa"
  #ssh node1 "cd ~/HDSearch/microsuite; sudo docker compose up"
}

"$@"

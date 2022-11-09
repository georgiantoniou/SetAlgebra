#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False

install_dep () {
  #sudo apt update
  sudo apt-add-repository ppa:ansible/ansible -y
  sudo apt update
  sudo apt install ansible -y
  ansible-playbook -i hosts ansible/install_dep.yml
}

build () {
  
  pushd ~
  tar -czf SetAlgebra.tgz SetAlgebra
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

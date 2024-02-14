#!/bin/bash

## Настройка короткого альяса `k` для `kubectl`

## 1. Установка bash-completion
sudo apt update -y && sudo apt install bash-completion -y

## 2. Установка complete-alias : https://github.com/cykerway/complete-alias
cd && wget https://github.com/prostopasta/complete-alias/raw/master/complete_alias && mv complete_alias ~/.complete_alias
echo ". ~/.complete_alias" >> ~/.bash_completion

## 3. Зададим completion для kubectl
grep -wq '^source <(kubectl completion bash)' ~/.bashrc || echo 'source <(kubectl completion bash)' >> ~/.bashrc

## 4. Настроим alias k=kubectl
alias k=kubectl
grep -wq '^alias k=kubectl' ~/.bashrc || echo 'alias k=kubectl'>>~/.bashrc
source ~/.bashrc
echo "complete -F _complete_alias k" >> ~/.complete_alias

## 5. Готово
echo "Проверьте работу команды 'k', напечатайте в консоли k <tab>"

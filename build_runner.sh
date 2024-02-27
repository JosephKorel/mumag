#!/bin/bash

# Este script roda o comando 'dart run build_runner watch -d' no terminal.

# Vá para a pasta do projeto
cd F:\Dev\mumag

# Execute o comando
dart run build_runner watch -d

# Mantenha o script rodando
while true; do
  sleep 1
done
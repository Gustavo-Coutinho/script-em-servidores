#!/bin/bash

# Lê o .csv convertendo vírgulas em espaços
mapfile -t listaServidores < <(tr ',' '\n' < servidores.csv)

scriptpy="script.py"

# Procedimento para cada servidor
for ipServidor in "${listaServidores[@]}"
do
  echo "Entrando no servidor: $ipServidor"
  
  # Transfere o arquivo .py temporariamente e apaga após executar
  scp $script_python root@$ipServidor:/tmp/
  ssh root@$ipServidor 'python3 /tmp/'$scriptpy
  ssh root@$ipServidor 'rm /tmp/'$scriptpy
done

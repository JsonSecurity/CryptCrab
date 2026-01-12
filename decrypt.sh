#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo -e "[!] Uso: $0 <texto_cifrado> <clave_secreta>\n"
    exit 1
fi

TEXTO_CIFRADO=$1
CLAVE=$2

RESULTADO=$(echo "$TEXTO_CIFRADO" | openssl enc -aes-256-cbc -pbkdf2 -salt -base64 -d -pass pass:"$CLAVE" 2>/dev/null)

if [ $? -eq 0 ]; then
    echo -e "Texto: $RESULTADO\n"
else
    echo -e "Error: No se pudo descifrar.\n"
fi

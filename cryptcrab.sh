#!/bin/bash

#colores
W="\e[0m"
N="\e[38;2;100;102;109m"
n="\e[30m"
R="\e[38;2;255;0;0m"
G="\e[38;2;19;255;0m"
Y="\e[33m"
B="\e[34m"
P="\e[35m"
C="\e[36m"
L="\e[37;2m"

#salidas/entradas
bord=$N
excr=$W
eye="\e[38;2;255;56;38m"
cent=$eye
info=$eye
hed=$W

T="$bord [${cent}+${W}${bord}]$excr"
F="$bord [${cent}-${W}${bord}]$excr"

#info
autor="${bol}$bord [$W ${info}Json Security${bord} ]"
script="${bol}$bord [$W ${info}CryptCrab${bord} ]"

banner() {
    echo -e """$eye
             .';;;'.              .';;;'.             
          'ldodkOx,                ,xOkxodl'          
        ;k0ocoOXO;                  ,kXOoco0k;$W        
      .cKWk:x0OOo.                  .oOO0x:kWXl.      
     .dXX0k0Nklc.                    .clkN0k0XXx.     
    .xWMMNKXKc.                        .cKXKNMMWx.    
   .lXWMW0xd'                            'dx0WMWXo.   
   ${eye}.dK0Oxc.        $W.,.          .,.$eye        .cxO0Kd.$W   
   .xd,'..         :d:.        .:d:         ..',dx'   
   .xXx,,;';dxc.  .ldollodxxdollodl.  .cxd:';,,xXx.   
    .dKKWWx,lXNklxKNNWWWWMMMMWNWWNNKxlxNXo,dWWK0x.    
     .lONMXc,OKXWMMMMMMMMMMMMMMMMMMMMMXXO,:XMNOl.     
       .:xkdkXXXWMMMMMMMMMMMMMMMMMMMMWXXXkdkx:.       
    'ccoddl:::lx0XXNXKNMMWWWWMMNKXNXX0xl:::lodocc'    
   :Oo;oOKNXkc:::clodxkKKkddkKKOxdolc:::cxXNKOo;oO:   
  cXO'.lxdkO0XNXOc,:c:cooccccooc:c:,:OXNX0Okdxo..OXc  
 :XX:.oNk.'ox0XXXkdOkoc;:lool:;cokOdkXXN0xd'.kWd.:XX: 
 o0:.cNNl cXx;''......          .......';xXc cNNl.;0o.             
 lo..dO;  'ONk;.                      .,kNO'  ;Od..ol 
 ck, c0c.  .o0KO:.                  .:O00d.   c0c 'kc 
 .o; .xK:   'OXKXl                  lXKX0,   ;0x. ;o. 
  ..  .:o:.  .oO0O:                :O0Od'  .:o:.  ..  
         ..    .cdd'              'ddc'    ..         
                  .                .     
           $autor $script$W
"""
}

banner

# Verificamos que se hayan pasado los argumentos
if [ "$#" -ne 2 ];then
    echo -e "[!] Usage: $0 <texto_a_cifrar> <clave_secreta>\n"
    exit 1
fi

TEXTO=$1
CLAVE=$2

# Explicación del comando openssl:
# enc -aes-256-cbc : Usa el algoritmo de cifrado AES de 256 bits.
# -pbkdf2          : Usa una función de derivación de clave segura (recomendado).
# -salt            : Añade aleatoriedad para que el mismo texto no genere siempre el mismo hash.
# -base64          : Convierte el resultado binario a texto legible.
# -e               : Indica que vamos a ENCRIPTAR.
# -pass pass:$CLAVE: Pasa la contraseña directamente.

result=$(echo -n "$TEXTO" | openssl enc -aes-256-cbc -pbkdf2 -salt -base64 -e -pass pass:"$CLAVE")

echo -e "$T Ciphertext:$cent $result\n"
#echo "$result"

#!/bin/bash

echo "Bienvenidos al solucionador de problemas de Linux"
echo "Aquí tendras una serie de herramientas para solucionar problemas que pueden surgir en nuestro entorno Linux"
echo "Recomendamos ejecutar la app como root 'sudo sh Soluciones.sh'"
echo "[1] SuperUpgrade (Actualiza todo sin errores de not upgrade)"
echo "[2] Eliminar error zsh. corrupt history file"
echo "[3] Reiniciar el adaptador de red y el servicio de internet si tu máquina no recibe conexión"
echo "[4] Cambiar teclado a español si tu teclado coniene 'Ñ'"
echo "[5] Pasar texto codificado en Base64 a texto legible"
echo "[6] Conectarse a VPN con archivo '.ovpn' como HackTheBox o TryHackMe"
echo "[7] Salir"

read -p "Elige el numero de la herramienta que desea utilizar: " opcion

if [ "$opcion" = "1" ]; then
	sudo apt-get update
	apt-get upgrade
	apt-get dist-upgrade
	apt autoremove

elif [ "$opcion" = "2" ]; then
	sudo apt-get install binutils
	cd ~
	mv .zsh_history .zsh_history_bad
	strings .zsh_history_bad > .zsh_history
	fc -R .zsh_history
	exit

elif [ "$opcion" = "3" ]; then
	sudo systemctl restart NetworkManager
	echo "Esta herramienta por error de Linux si no hace el reset volver a ejecutar hasta que se solucione"
	exit

elif [ "$opcion" = "4" ]; then
	sudo apt-get install console-data
	setxkbmap -layout 'es,es' -model pc105
	exit

elif [ "$opcion" = "5" ]; then
	echo = "El texto de be comenzar y terminar con comillas simples ' ' "
	read -p "Introduce el texto que deseas pasar de Base64 a texto claro: " texto
	echo $texto | base64 -d
	exit
elif [ "$opcion" = "6" ]; then
	echo "Para conectarse a una VPN como TryHackMe o HackTheBox deberas descargar el archivo 'ovpn' de la web."
	echo "Esto debera dejarse en una terminal aparte y cuando queramos finalizarlo presionar ctrl + c "
	read -p "Introduce la ruta donde descargaste el archivo: " ruta
	read -p "Introduce el nombre del archivo '.ovpn' al que te quieres conectar sin la extensión de archivo: " nombre
	cd $ruta
	sudo openvpn $nombre.ovpn
else
	echo "Hasta la próxima"
	exit
fi


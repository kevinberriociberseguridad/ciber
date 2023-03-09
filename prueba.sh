#!/bin/bash
#
# sokdr
# https://github.com/sokdr
#
############################ FUNCIONES ###################################

tput clear
trap ctrl_c INT

function ctrl_c() {
        echo "**You pressed Ctrl+C...Exiting"
        exit 0;
}

function errorMenu() {
	echo "El número introducido no es ninguna opción del menú."
}

function imprimirMenu() {
	echo " "
	echo "############################# MENÚ ##############################"
	echo " "
	echo "1. Información del Linux Kernel."
	echo "2. Informaciín de Usuario e ID Actual."
	echo "3. Información de la Distribución de Linux."
	echo "4. Lista de Usuarios Registrados Actuales."
	echo "5. Información del Tiempo de Actividad de Servidor de Linux -> $HOSTNAME."
	echo "6. Servicios en Uso."
	echo "7. Conexiones a Internet Activas y Puertos Abiertos."
	echo "8. Comprobación del Espacio Disponible."
	echo "9. Comporobación de Memoria."
	echo "10. Historial de Comandos."
	echo "11. Interfaces de Red."
	echo "12. Información Sobre las Tablas de IPs."
	echo "13. Comprobación de Procesos en Ejecución."
	echo "14. Comprobación de la Configuración SSH."
	echo "15. Lista de Todos lo Paquetes Instalados."
	echo "16. Parámetros de Red."
	echo "17. Política de Contraseñas."
	echo "18. Comprobación del Archivo de Listas de Repositorios."
	echo "19. Comprobar Dependencias Rotas."
	echo "20. Banner del Mensaje del Día."
	echo "21. Lista de Nombres de Usuarios."
	echo "22. Comprobación de Contraseñas Nulas."
	echo "23. Tabla de Enrutamiento IP."
	echo "24. Mensajes del Kernel."
	echo "25. Comprobar los Paquetes Actualizables."
	echo "26. Información del Sistema y de la CPU."
	echo "27. Paquetes TCP."
	echo "28. Intentos Fallidos de Login."
	echo "29. Realizar un chequeo completo.(TODAS LAS ANTERIORES)."
	echo "0) Salir."
	echo " "
	echo "###########################################################"
	echo " "
	read -p "Introduce una opción del menú [0-29]: " salir ayuda
}

function ejecutarPrograma() {

echo "Script Starts ;)"
START=$(date +%s)
echo
echo -e "1. Información del Linux Kernel."
echo
uname -a
echo
echo "###############################################"
echo
echo -e "2. Informaciín de Usuario e ID Actual."
echo
whoami
echo
id
echo
echo "###############################################"
echo
echo -e "3. Información de la Distribución de Linux."
echo
lsb_release -a
echo
echo "###############################################"
echo
echo -e "4. Lista de Usuarios Registrados Actuales."
echo
w
echo
echo "###############################################"
echo
echo -e "5. Información del Tiempo de Actividad de Servidor de Linux -> $HOSTNAME."
echo
uptime
echo
echo "###############################################"
echo
echo -e "6. Servicios en Uso."
echo
service --status-all |grep "+"
echo
echo "###############################################"
echo
echo -e "7. Conexiones a Internet Activas y Puertos Abiertos."
echo
netstat -natp
echo
echo "###############################################"
echo
echo -e "8. Comprobación del Espacio Disponible."
echo
df -h
echo
echo "###############################################"
echo
echo -e "9. Comporobación de Memoria."
echo
free -h
echo
echo "###############################################"
echo
echo -e "10. Historial de Comandos."
echo
history
echo
echo "###############################################"
echo
echo -e "11. Interfaces de Red."
echo
ifconfig -a
echo
echo "###############################################"
echo
echo -e "12. Información Sobre las Tablas de IPs."
echo
sudo iptables -L -n -v
echo
echo "###############################################"
echo
echo -e "13. Comprobación de Procesos en Ejecución."
echo
ps -a
echo
echo "###############################################"
echo
echo -e "14. Comprobación de la Configuración SSH."
echo
cat /etc/ssh/sshd_config
echo
echo "###############################################"
echo
echo -e "15. Lista de Todos lo Paquetes Instalados."
echo
sudo apt-cache pkgnames
echo
echo "###############################################"
echo
echo -e "16. Parámetros de Red."
echo
cat /etc/sysctl.conf
echo
echo "###############################################"
echo
echo -e "17. Política de Contraseñas."
echo
cat /etc/pam.d/common-password
echo
echo "###############################################"
echo
echo -e "18. Comprobación del Archivo de Listas de Repositorios."
echo
cat /etc/apt/sources.list
echo
echo "###############################################"
echo
echo -e "19. Comprobar Dependencias Rotas."
echo
apt-get check
echo
echo "###############################################"
echo
echo -e "20. Banner del Mensaje del Día."
echo
cat /etc/motd
echo
echo "###############################################"
echo
echo -e "21. Lista de Nombres de Usuarios."
echo
cut -d: -f1 /etc/passwd
echo
echo "###############################################"
echo
echo -e "22. Comprobación de Contraseñas Nulas."
echo
users="$(cut -d: -f 1 /etc/passwd)"
for x in $users
do
passwd -S $x |grep "NP"
done
echo
echo "###############################################"
echo
echo -e "23. Tabla de Enrutamiento IP."
echo
sudo route
echo
echo "###############################################"
echo
echo -e "24. Mensajes del Kernel."
echo
sudo dmesg
echo
echo "###############################################"
echo
echo -e "25. Comprobar los Paquetes Actualizables."
echo
sudo apt list --upgradeable
echo
echo "###############################################"
echo
echo -e "26. Información del Sistema y de la CPU."
echo
cat /proc/cpuinfo
echo
echo "###############################################"
echo
echo -e "27. Paquetes TCP."
echo
cat /etc/hosts.allow
echo 
echo "///////////////////////////////////////"
echo
cat /etc/hosts.deny
echo
echo "###############################################"
echo
echo -e "28. Intentos Fallidos de Login."
echo
grep --color "failure" /var/log/auth.log
echo
echo "###############################################"
echo
END=$(date +%s)
DIFF=$(( $END - $START ))
echo Script completed in $DIFF seconds :
echo
echo Executed on :
date
echo

}

function opcionesCase() {

#*****************CASE**********************
	
case $num in
    1)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "1. Información del Linux Kernel."
		echo
		uname -a
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "1. Información del Linux Kernel." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		uname -a | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "1. Información del Linux Kernel." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		uname -a | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    2)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "2. Información de Usuario e ID Actual."
		echo
		whoami
		echo
		id
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "2. Informaciín de Usuario e ID Actual." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		whoami | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		id | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "2. Informaciín de Usuario e ID Actual." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		whoami | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		id | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    3)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "3. Información de la Distribución de Linux."
		echo
		lsb_release -a
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "3. Información de la Distribución de Linux." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		lsb_release -a | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "3. Información de la Distribución de Linux." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		lsb_release -a | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    4)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "4. Lista de Usuarios Registrados Actuales."
		echo
		w
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "4. Lista de Usuarios Registrados Actuales." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		w | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "4. Lista de Usuarios Registrados Actuales." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		w | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    5)	
	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "5. Información del Tiempo de Actividad de Servidor de Linux -> $HOSTNAME."
		echo
		uptime
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "5. Información del Tiempo de Actividad de Servidor de Linux -> $HOSTNAME." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		uptime | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "5. Información del Tiempo de Actividad de Servidor de Linux -> $HOSTNAME." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		uptime | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    6)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "6. Servicios en Uso."
		echo
		service --status-all |grep "+"
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "6. Servicios en Uso." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		service --status-all |grep "+" | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "6. Servicios en Uso." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		service --status-all |grep "+" | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    7)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "7. Conexiones a Internet Activas y Puertos Abiertos."
		echo
		netstat -natp
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "7. Conexiones a Internet Activas y Puertos Abiertos." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		netstat -natp | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "7. Conexiones a Internet Activas y Puertos Abiertos." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		netstat -natp | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    8)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "8. Comprobación del Espacio Disponible."
		echo
		df -h
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "8. Comprobación del Espacio Disponible." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		df -h | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "8. Comprobación del Espacio Disponible." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		df -h | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    9)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "9. Comporobación de Memoria."
		echo
		free -h
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "9. Comporobación de Memoria." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		free -h | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "9. Comporobación de Memoria." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		free -h | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    10)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "10. Historial de Comandos."
		echo
		history
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "10. Historial de Comandos." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		history | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "10. Historial de Comandos." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		history | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    11)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "11. Interfaces de Red."
		echo
		ifconfig -a
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "11. Interfaces de Red." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		ifconfig -a | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "11. Interfaces de Red." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		ifconfig -a | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    12)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "12. Información Sobre las Tablas de IPs."
		echo
		iptables -L -n -v
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "12. Información Sobre las Tablas de IPs." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		iptables -L -n -v | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "12. Información Sobre las Tablas de IPs." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		iptables -L -n -v | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    13)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "13. Comprobación de Procesos en Ejecución."
		echo
		ps -a
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "13. Comprobación de Procesos en Ejecución." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		ps -a | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "13. Comprobación de Procesos en Ejecución." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		ps -a | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    14)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "14. Comprobación de la Configuración SSH."
		echo
		cat /etc/ssh/sshd_config
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "14. Comprobación de la Configuración SSH." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cat /etc/ssh/sshd_config | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "14. Comprobación de la Configuración SSH." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cat /etc/ssh/sshd_config | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    15)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
	    	echo -e "15. Lista de Todos lo Paquetes Instalados."
	    	echo
		apt-cache pkgnames
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
	    	echo -e "15. Lista de Todos lo Paquetes Instalados." | tee -a auditoria.txt > /dev/null
	    	echo | tee -a auditoria.txt > /dev/null
		apt-cache pkgnames | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
	    	echo -e "15. Lista de Todos lo Paquetes Instalados." | tee -a auditoria.txt
	    	echo | tee -a auditoria.txt
		apt-cache pkgnames | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    16)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "16. Parámetros de Red."
		echo
		cat /etc/sysctl.conf
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "16. Parámetros de Red." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cat /etc/sysctl.conf | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "16. Parámetros de Red." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cat /etc/sysctl.conf | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    17)	
    	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "17. Política de Contraseñas."
		echo
		cat /etc/pam.d/common-password
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "17. Política de Contraseñas." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cat /etc/pam.d/common-password | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "17. Política de Contraseñas." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cat /etc/pam.d/common-password | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    18)	
	if [[ $opcion -eq 1 ]]
    	then
	    	echo
		echo -e "18. Comprobación del Archivo de Listas de Repositorios."
		echo
		cat /etc/apt/sources.list
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "18. Comprobación del Archivo de Listas de Repositorios." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cat /etc/apt/sources.list | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "18. Comprobación del Archivo de Listas de Repositorios." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cat /etc/apt/sources.list | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    19)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
	    	echo -e "19. Comprobar Dependencias Rotas."
		echo
		apt-get check
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
	    	echo -e "19. Comprobar Dependencias Rotas." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		apt-get check | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
	    	echo -e "19. Comprobar Dependencias Rotas." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		apt-get check | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    20)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "20. Banner del Mensaje del Día."
		echo
		cat /etc/motd
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "20. Banner del Mensaje del Día." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cat /etc/motd | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "20. Banner del Mensaje del Día." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cat /etc/motd | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    21)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "21. Lista de Nombres de Usuarios."
		echo
		cut -d: -f1 /etc/passwd
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "21. Lista de Nombres de Usuarios." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cut -d: -f1 /etc/passwd | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "21. Lista de Nombres de Usuarios." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cut -d: -f1 /etc/passwd | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    22)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "22. Comprobación de Contraseñas Nulas."
		echo
		users="$(cut -d: -f 1 /etc/passwd)"
		for x in $users
		do
		passwd -S $x |grep "NP"
		done
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "22. Comprobación de Contraseñas Nulas." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		users="$(cut -d: -f 1 /etc/passwd)" | tee -a auditoria.txt > /dev/null
		for x in $users
		do
		passwd -S $x |grep "NP" | tee -a auditoria.txt > /dev/null
		done
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "22. Comprobación de Contraseñas Nulas." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		users="$(cut -d: -f 1 /etc/passwd)" | tee -a auditoria.txt
		for x in $users
		do
		passwd -S $x |grep "NP" | tee -a auditoria.txt
		done
		echo | tee -a auditoria.txt
	fi
        ;;
    23)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "23. Tabla de Enrutamiento IP."
		echo
		route
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "23. Tabla de Enrutamiento IP." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		route | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "23. Tabla de Enrutamiento IP." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		route | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    24)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "24. Mensajes del Kernel."
		echo
		sudo dmesg
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "24. Mensajes del Kernel." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		sudo dmesg | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "24. Mensajes del Kernel." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		sudo dmesg | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    25)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "25. Comprobar los Paquetes Actualizables."
		echo
		apt list --upgradeable
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "25. Comprobar los Paquetes Actualizables." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		apt list --upgradeable | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "25. Comprobar los Paquetes Actualizables." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		apt list --upgradeable | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    26)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "26. Información del Sistema y de la CPU."
		echo
		cat /proc/cpuinfo
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "26. Información del Sistema y de la CPU." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cat /proc/cpuinfo | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "26. Información del Sistema y de la CPU." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cat /proc/cpuinfo | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    27)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "27. Paquetes TCP."
		echo
		cat /etc/hosts.allow
		echo
		echo "///////////////////////////////////////"
		echo
		cat /etc/hosts.deny
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "27. Paquetes TCP." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cat /etc/hosts.allow | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		echo "///////////////////////////////////////" | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		cat /etc/hosts.deny | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "27. Paquetes TCP." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cat /etc/hosts.allow | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		echo "///////////////////////////////////////" | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		cat /etc/hosts.deny | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    28)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "28. Intentos Fallidos de Login."
		echo
		grep --color "failure" /var/log/auth.log
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "28. Intentos Fallidos de Login." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		grep --color "failure" /var/log/auth.log | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "28. Intentos Fallidos de Login." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		grep --color "failure" /var/log/auth.log | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    29)	
    	if [[ $opcion -eq 1 ]]
    	then
    		echo
		echo -e "29. Realizar un Chequeo Completo del Sistema."
		echo
		ejecutarPrograma
		echo
	elif [[ $opcion -eq 2 ]]
	then
		echo | tee -a auditoria.txt > /dev/null
		echo -e "29. Realizar un Chequeo Completo del Sistema." | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
		ejecutarPrograma | tee -a auditoria.txt > /dev/null
		echo | tee -a auditoria.txt > /dev/null
	else
		echo | tee -a auditoria.txt
		echo -e "29. Realizar un Chequeo Completo del Sistema." | tee -a auditoria.txt
		echo | tee -a auditoria.txt
		ejecutarPrograma | tee -a auditoria.txt
		echo | tee -a auditoria.txt
	fi
        ;;
    0)
    	echo " "
	echo "###########################################################"
	echo " "
    	echo "Ha salido del programa exitosamente."
        salir=$(salir=0)
        echo " "
	echo "###########################################################"
	echo " "
        ;;
esac;

}

function ayudasOpciones() {

case $num in
    1)
    	echo ""
    	echo "Esta opción mostrará la información del Kernel de Linux."
    	echo ""
        ;;
    2)
    	echo ""
    	echo "Esta opción mostrará la información del usuario y el ID del usuario actual."
    	echo ""
        ;;
    3)
    	echo ""
    	echo "Esta opción mostrará la información de la distribuición de Linux."
    	echo ""
        ;;
    4)
    	echo ""
    	echo "Esta opción mostrará la lista de usuarios registrados actuales."
    	echo ""
        ;;
    5)
    	echo ""
    	echo "Esta opción mostrará la información del tiempo de actividad de servidor de Linux."
    	echo ""
        ;;
    6)
    	echo ""
    	echo "Esta opción mostrará los servicios en Linux."
    	echo ""
        ;;
    7)
    	echo ""
    	echo "Esta opción mostrará la información de las conexiones a internet activas y puertos."
    	echo ""
        ;;
    8)
    	echo ""
    	echo "Esta opción realizará una comprobación del espacio disponible."
    	echo ""
        ;;
    9)
    	echo ""
    	echo "Esta opción realizará una comprobación de la memoria."
    	echo ""
        ;;
    10)
    	echo ""
    	echo "Esta opción mostrará el historial de comandos."
    	echo ""
        ;;
    11)
    	echo ""
    	echo "Esta opción mostrará las interfaces de red."
    	echo ""
        ;;
    12)
    	echo ""
    	echo "Esta opción mostrará información sobre las tablas de IP's."
    	echo ""
        ;;
    13)
    	echo ""
    	echo "Esta opción realizará una comprobación de los procesos en ejecución."
    	echo ""
        ;;
    14)
    	echo ""
    	echo "Esta opción realizará una comprobación de la configuración SSH."
    	echo ""
        ;;
    15)
    	echo ""
    	echo "Esta opción mostrará todos los paquetes instalados."
    	echo ""
        ;;
    16)
    	echo ""
    	echo "Esta opción mostrará todos los parámetros de red."
    	echo ""
        ;;
    17)
    	echo ""
    	echo "Esta opción mostrará la política de contraseñas."
    	echo ""
        ;;
    18)
    	echo ""
    	echo "Esta opción realizará una comprobación del archivo de la lista de repositorios."
    	echo ""
        ;;
    19)
    	echo ""
    	echo "Esta opción realizará una comprobación de las dependencias rotas."
    	echo ""
        ;;
    20)
    	echo ""
    	echo "Esta opción mostrará el banner del día."
    	echo ""
        ;;
    21)
    	echo ""
    	echo "Esta opción mostrará la lista de nombres de usuarios."
    	echo ""
        ;;
    22)
    	echo ""
    	echo "Esta opción realizará una comprobación de contraseñas nulas."
    	echo ""
        ;;
    23)
    	echo ""
    	echo "Esta opción mostrará la tabla de enrutamiento IP."
    	echo ""
        ;;
    24)
    	echo ""
    	echo "Esta opción mostrará los mensajes del Kernel."
    	echo ""
        ;;
    25)
    	echo ""
    	echo "Esta opción realizará una comprobación de los paquetes actualizables."
    	echo ""
        ;;
    26)
    	echo ""
    	echo "Esta opción mostrará la información del sistema y de la CPU."
    	echo ""
        ;;
    27)
    	echo ""
    	echo "Esta opción mostrará los paquetes TCP."
    	echo ""
        ;;
    28)
    	echo ""
    	echo "Esta opción mostrará los intentos fallidos de login."
    	echo ""
        ;;
    29)
    	echo ""
    	echo "Esta opción realizará un chequeo completo del sistema."
    	echo ""
        ;;
    *)
    	echo ""
	echo "Error con el parametro $ayuda, no existe la opción seleccionada."
	echo ""
        ;;
esac;
}

############################################# PROGRAMA ##############################################
echo -e "###############################################"
echo -e "###############################################"
echo -e "###############################################"
echo "_    _                 _          _ _ _   "
echo "| |  (_)_ _ _  ___ __  /_\ _  _ __| (_) |_ "
echo "| |__| |   \ || \ \ / / _ \ || / _  | |  _|"
echo "|____|_|_||_\_ _/_\_\/_/ \_\_ _\__ _|_|\__|"
echo
echo "###############################################"
echo "Bienvenido a una auditoria de sehuridad para Linux:"
echo "###############################################"
echo
echo "El script recogerá automáticamente información requerida:"
echo "La lista de verificación puede ayudarlo en el proceso de securizar su sistema:"
echo "Nota: ha sido probado para Debian Linux Distro:"
echo
sleep 3
echo "###############################################"
echo
echo "OK....$HOSTNAME..vamos...espere a que termine:"
echo
sleep 3
echo

#################################### INICIO DEL PROGRAMA ##########################################

declare -i salir=-1

while [ $salir -ne 0 ];
do

#Mostrar menu
imprimirMenu

if [[ $salir -ne 0 ]]
then
	num=$salir
	echo $num
	while [ $num -gt 29 ] || [ $num -lt 0 ];
	do
    		errorMenu
    		unset -v ayuda
    		read -p "Introduce una opcion del menu [0-29]: " num ayuda;
	done
else
	echo "Ha salido del programa exitosamente."
	exit 1
fi
################ Opciones del Programa ################
if [[ ! -z $ayuda ]]
then
	if [[ $ayuda == "--help" ]]
	then
		echo
		echo "############################### AYUDA ###############################"
		echo
		ayudasOpciones
		echo 
		echo "#####################################################################"
	else
		echo "Error con el parametro $ayuda, no existe el parámetro seleccionado."
	fi
else
	################ Submenu para imprimir por pantalla o no #####################
	declare -i opcion=0
	while [ $opcion -gt 3 ] || [ $opcion -lt 1 ];
	do
		echo
		echo "Antes de ejecutar la opción solicitada."
		echo
		echo "	1. ¿Quiere mostrar el resultado por pantalla?"
		echo "	2. ¿Quiere guardar el resultado en un fichero?"
		echo "	3. ¿Quiere ambas opciones?"
		read opcion
		if [ $opcion -gt 3 ] || [ $opcion -lt 1 ]
		then
			echo 
			errorMenu
		else 
			echo
			echo "La opción elegida es la opción $opcion."
		fi
	done
	opcionesCase
fi
done
exit 0;

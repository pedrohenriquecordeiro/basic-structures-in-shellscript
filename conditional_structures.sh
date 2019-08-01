#Escrever um shell script que recebe um arquivo como
#argumento em linha de comando e verifica se existe ou não. Caso exista,
#verifique se é um arquivo, um diretório ou desconhecido mostrando quais as
#permissões que o usuário atual (não do dono do arquivo) possui sobre ele.
#Caso não exista, imprima que é inválido. 

#!/bin/sh

a = $( ls -l $1 | awk -F" " '{print $1}' | cut -c 1)

user_atual = $( whoami )
user_dono = $( ls -l $1 | awk -F" " '{print $3}')
user_grupo = $( ls -l $1 | awk -F" " '{print $4}')

per_dono = $( ls -l $1 | awk -F" " '{print $1}' | cut -c 2-4)
per_grupo = $( ls -l $1 | awk -F" " '{print $1}' | cut -c 5-7)
per_all = $( ls -l $1 | awk -F" " '{print $1}' | cut -c 8-10)

if[ "$#" -eq 1 ] then
	case "$user_atual" in
		"&user_dono")
			r=$(echo "$per_dono");
			;;
		"&user_grupo")
			r=$(echo "$per_grupo");
			;;
		*)
			r=$(echo "$per_all");
			;;
	esac
	
	case "$a" in
		-)
			echo "$1 : arquivo ($r) ";
			;;
		d)
			echo "$1 : diretorio ($r) ";
			;;
		-)
			echo "$1 : desconhecido ($r) ";
			;;
	esac
else
	echo "./file [Arquivo]";
fi





#Escrever um shell script que recebe três números
#inteiros pela entrada padrão e mostre qual o maior deles

#!/bin/sh

if[ "$1" -gt "$2" -a "$1" -gt "$3"];then
	echo "O maior numero e o $1";
elif[ "$2" -gt "$1" -a "$2" -gt "$3"];then
	echo "O maior numero e o $2";
elif[ "$3" -gt "$2" -a "$3" -gt "$1"];then
	echo "O maior numero e o $3";
else
	if[ "$1" -eq "$2" ];then
		if[ "$3" -lt "$2" ]; then
			echo "O maior numero e o $2";
		elif[ "$2" -lt "$3" ]; then
			echo "O maior numero e o $3";
		else
			echo "Todos os numeros sao identicos";
		fi
	elif[ "$1" -eq "$3" ];then
		if[ "$2" -lt "$3" ]; then
			echo "O maior numero e o $1";
		elif[ "$3" -lt "$2" ]; then
			echo "O maior numero e o $2";
		else
			echo "Todos os numeros sao identicos";
		fi
	elif[ "$3" -eq "$2" ];then
		if[ "$1" -lt "$2" ]; then
			echo "O maior numero e o $2";
		elif[ "$2" -lt "$1" ]; then
			echo "O maior numero e o $1";
		else
			echo "Todos os numeros sao identicos";
		fi
	fi
fi





#Escrever um shell script para cumprimentar um usuário
#com "Bom dia", "Boa tarde" ou "Boa noite" dependendo do horário do
#sistema. A saudação deve incluir o nome completo do usuário atualmente
#logado. Dica: use o comando whoami para obter o usuário atual e depois
#consulte o arquivo /etc/passwd na quinta coluna para obter o seu nome
#completo. As horas do dia são divididas da seguinte maneira:
#• Dia: até 12:00
#• Tarde: a partir de 12:00 e até 18:00
#• Noite: a partir das 18:00

#!/bin/sh
			
a = $(date | awk -F" " '{print $4}' | awk -F":" '{print $1"."$2}')
b=$(whoami)
c=$(echo "$a >= 6.00 && $a < 12.00" | bc)
d=$(echo "$a >= 12.00 && $a < 18.00" | bc)
e=$(echo "$a >= 18.00 && $a < 6.00" | bc)

if[ $c -eq "1"]; then
	echo "Bom dia $b, seja bem vindo.";
elif[ $d -eq "1"]; then
	echo "Boa tarde $b, seja bem vindo.";
elif[ $e -eq "1"]; then
	echo "Boa noite $b, seja bem vindo.";
else
	echo "Boa noite $b, seja bem vindo.";
if





#Escreva um programa capaz de realizar cálculos com
#expressões aritméticas entre dois numeros em ponto flutuante,
#com apenas um operador (+, -, x, /) e imprimir o resultado em ponto flutuante.
#O programa deve ler os dois números e o operador via parâmetros em linha de
#comando. Caso não sejam especificados os três parâmetros, deve-se
#mostrar uma mensagem de ajuda. Se o operador não for um dos quatro
#suportados, deve-se mostrar uma mensagem de erro

#!/bin/sh

case "$#" in
	"3")
		case "$2" in
			"+")
				a = $(echo "$1 + $3" | bc)
				;;
			"-")
				a = $(echo "$1 - $3" | bc)
				;;
			"x")
				a = $(echo "$1 * $3" | bc)
				;;
			"/")
				a = $(echo "scale=6 ; $1 / $3" | bc)
				;;
			*)
				a = $(echo "Operador inválido")
				;;
		esac
	*)
		a = $(echo "./make [NUMERO] [OPERADOR] [NUMERO]")
		;;
	esac
echo "$a"
#Mostrar os sete dias de semana usando código de três dígitos
#indicando os que são dia de semana e quais são fim de semana.

#!/bin/sh
for day in Mon Tue Wed Thu Fri Sat Sun;
	do
		case "$day" in
		"Sat") echo "$day (weekend)"; ;;
		"Sun") echo "$day (weekend)"; ;;
		*)     echo "$day (weekday)"; ;;
		esac
	done
	




#Mostrar todos os usuários do arquivo /etc/passwd

#!/bin/sh
for usr in $(cat /etc/passwd | awk -F ":" '{print $1}');
	do
		echo "user $((++i)) : $usr";
	done



	
	
#Sortear n rodadas de dados (de 1 a 6), definidas pelo usuário
#via argumentos em linha de comando, imprimir a frequência de cada
#lado.

#!/bin/sh
for(( j=0 ; j<$1 , j++));
	do	
		p = $((RANDOM%6 + 1));
		if[ "$p" -eq 1 ] ; then a = $((a+1));
		elif[ "$p" -eq 2 ] ; then a = $((b+1));
		elif[ "$p" -eq 3 ] ; then a = $((c+1));
		elif[ "$p" -eq 4 ] ; then a = $((d+1));
		elif[ "$p" -eq 5 ] ; then a = $((e+1));
		else f=$((f+1));
	done
	
echo "Dice 1 : $a"
echo "Dice 2 : $b"
echo "Dice 3 : $c"
echo "Dice 4 : $d"
echo "Dice 5 : $e"
echo "Dice 6 : $f"





#Receber um ou mais números via argumentos em linha de
#comando e mostrar o menor e o maior deles. Restrição: não é
#permitido usar o comando sort nem outro comando similar.

#!/bin/sh
input = ($@);
maior = $1;
menor = $1;

for(( i=1 ; i<$# ; i++));
	do	
		a = ${input[i]};
		if[ "$a" -gt "$maior" ]; then maior = $a; fi
		if[ "$a" -lt "$menor" ]; then menor = $a; fi
	done

echo "Maior :: $maior";
echo "Menor :: $menor";





#Escrever um shell script para treinar um usuário com
#operações básicas de aritmética: soma e subtração. Esse script poderia ser
#colocado na inicialização de cada terminal, obrigando o usuário a informar o
#resultado correto para ter acesso a ele.
#O script deve gerar dois números aleatórios entre 1 e 999 (inclusivos)
#que serão usados como operandos. O script também deve gerar
#aleatoriamente o operando (+ ou -).

#!/bin/sh
num_1 = $((RANDOM % 999+1 ))
num_2 = $((RANDOM % 999+1 ))
num_3 = $((RANDOM % 2 ))

if[ "$num_3" -eq 1 ]; then 
	s = "+" ;
	resultado = $((num_1 + num_2));
else
	s = "-";
	resultado = $((num_1 - num_2)); 
fi

echo"$num_1";
echo"$s";
echo"$num_2";
echo -n "?";
read r;

while[ "$r" -ne "$resultado"] ; do	
	echo "Wrong answer";
	printf "?";
	read r;
done

echo "Rigth answer";





#Escrever um jogo de adivinhação de um número em shell
#script. O programa deverá selecionar um número aleatório entre 1 e 1000
#(inclusivos) sem informar ao usuário qual. Se o usuário acertar o número, o
#programa deve informar que o usuário venceu; caso contrário, o programa
#deve informar se o número sorteado é menor ou maior que aquele escolhido
#pelo usuário. O jogo continua indefinidamente até que o usuário acerte o
#número. 

#!/bin/sh
echo "Try to guess the number I thought!"
number = $((RANDOM %1000 + 1));
echo -n "Choose a number (1 a 1000):";
read in_number;
until[ "$number" -eq "$in_number"]; do
	echo -n "Choose a number ( 1 a 1000 ): ";
	read in_number;
	if[ "$in_number" -lt "$number" ]; then
		echo "My number ir higther than $in_number";
	elif[ "in_number" -gt "number"]; then 
		echo "My number is lower than $in_number";
	fi
done

echo "Congratulations";  
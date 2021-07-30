#!/bin/bash

echo Input two numbers with space in between

read a b

echo $a $b

#変数の数が2より小さい場合
if [ -z "$b" ] >&/dev/null;
then
       echo "!ERROR!:Input two numbers with space in between."
       exit 1
fi

#変数が0より小さい場合
if [ $a -le 0 -o $b -le 0 ] >&/dev/null;
then
       echo "!ERROR!:Input number which is greater than 0."
       exit 1
fi

#変数が数字じゃない場合

if expr "$a" : "[0-9]*$" >&/dev/null;
then
	1>/dev/null
else
	echo "!ERROR!$a is not a number.Input an integer."
fi

if expr "$b" : "[0-9]*$" >&/dev/null;
then
	1>/dev/null
else
	echo "!ERROR!$b is not a number.Input an integer."
fi


#--------------------------------------------------------------

P=$a

#最大公約数の計算
if [ $b -lt $P ] >&/dev/null;
	then
	P=$b
fi

while [ $P -ne 0 ] >&/dev/null
	do
		x=$(expr $a % $P)
		y=$(expr $b % $P)
 
	if [ $x -eq 0 -a $y -eq 0 ];
	then
		echo GCD of $a and $b is $P
	break
	fi
		P=$(expr $P - 1)
 
done

#---------------------------------------------------------------

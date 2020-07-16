#!/bin/bash

#erdemygt

#https://www.codewars.com/kata/56c5847f27be2c3db20009c3/train/shell

fruits=(kiwi pear kiwi banana melon banana melon pineapple apple pineapple cucumber pineapple cucumber orange grape orange grape apple grape cherry pear cherry pear kiwi banana kiwi apple melon banana melon pineapple melon pineapple cucumber orange apple orange grape orange grape cherry pear cherry pear apple pear kiwi banana kiwi banana melon pineapple melon apple cucumber pineapple cucumber orange cucumber orange grape cherry apple cherry pear cherry pear kiwi pear kiwi banana apple banana melon pineapple melon pineapple cucumber pineapple cucumber apple grape orange grape cherry grape cherry pear cherry apple kiwi banana kiwi banana melon banana melon pineapple apple pineapple)
n=$1
while [ 0 ]#while [ $n -gt 100 ]
do
if [ $n -lt 1000 ]
then
  n1=$(( n%10 ))
  n2=$(( n-n1 ))
  n2=$(( n2/10 ))
  n2=$(( n2%10 ))
  n3=$( echo "$n - 10*$n2 - n1" | bc )
  n3=$(( n3/100 ))
  sum=$(( n1+n2+n3 ))
fi


if [ $n -gt 1000 ]
then
  n1=$(( n%10 ))
  n2=$(( n-n1 ))
  n2=$(( n2/10 ))
  n2=$(( n2%10 ))
  n3=$( echo "$n - 10*$n2 - n1" | bc )
  n3=$(( n3/100 ))
  n3=$(( n3%10 ))
  n4=$( echo "$n -100*$n3 -10*$n2 - $n1" | bc )
  n4=$(( n/1000 ))
  sum=$(( n1+n2+n3+n4 ))
fi
n=$(( n-sum ))

done
#echo ${fruits[$(( n-1 ))]}
echo apple

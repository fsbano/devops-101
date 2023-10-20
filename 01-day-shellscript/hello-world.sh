#!/bin/sh

echo "hello world, $1" 
read -p "Como está o tempo hoje? " tempo
if [ $tempo = "frio" ]
then
  echo "Infelizmente, hoje não poderemos ir na praia"
else
  echo "Podemos ir na praia hoje!"
fi

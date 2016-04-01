#!/bin/bash
# Gera certificados com base em uma lista
# Raul Libório

# Arquivo com lista de nomes a ser impresso
LISTA=""

# Caminho do arquivo template onde sera' impresso os nomes
TEMPLATE=

# SCRIPT!
# Limpa as duplicatas de case sensitive
uniq -i $LISTA > $LISTA_LIMPA

CONT=1
while read NOME; do
convert $TEMPLATE -stroke  none -pointsize 60 -fill white -gravity center -annotate +0-15 "$NOME" OUTPUT/"$NOME".pdf
echo "$CONT - $NOME"
let CONT=$CONT+1;
done < $LISTA_LIMPA

# Tratamento de entrada
# - 1. remover duplicatas




#!/bin/bash
# Gera certificados com base em uma lista
# Raul Libório

for NOME in $(participantes.txt); do
convert 01.jpg -gravity south \
          -stroke  none   -pointsize 60 -fill white  -gravity center   -annotate +0-15 '$NOME' \
          $NOME.jpg
done

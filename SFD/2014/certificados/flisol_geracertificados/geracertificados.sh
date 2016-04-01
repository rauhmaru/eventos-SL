#!/bin/bash
# Gera certificados com base em uma lista
# Raul Libório

#v 0.1 - script com geracao de certificados e envio
#v 0.2 - conversao em caixa alta antes do envio
 
# recomendo que coloque todos os caracteres em caixa alta antes, com
# a ajuda do libreOffice, é mais simples. Faremos essa atualização em breve

# Arquivo com lista de nomes a ser impresso
LISTA="$1"
#Lista com os nomes em caixa alta, sem duplicatas e sem sinais
LISTA_LIMPA="/tmp/lista_limpa.txt"
# Caminho do arquivo template onde sera' impresso os nomes
TEMPLATE="$2"

geracertificado(){

uniq -i $LISTA | cut -f1 | tr [:lower:] [:upper:] > $LISTA_LIMPA
[ -d OUTPUT ] || mkdir OUTPUT

# Limpa as duplicatas de case sensitive e transforma todos em caixa alta

CONT=1
while read NOME; do
	convert $TEMPLATE -stroke  none -pointsize 45 -fill white -gravity center -annotate +0-15 "$NOME" OUTPUT/"$NOME".pdf
	echo "$CONT - $NOME"
	let CONT=$CONT+1;
done < $LISTA_LIMPA
}

envio(){
export flisol_emailto="$EMAIL"
export flisol_subject="CERTIFICADO FLISOL 2014"
export flisol_body="$MENSAGEM"
export smtpserver=smtp.gmail.com
export smtplogin=rauhmaru@gmail.com
export smtppass=password


# Script!

while read NOME; do

MENSAGEM="
Ola, $NOME\n\n
Segue em anexo o seu certificado de participacao do Software Freedom Day 2014.\n
Agradecemos pela sua presenca! Nos vemos ano que vem!\n\n
Software Freedom Day 2014 SALVADOR/BA
"
export smtpemailfrom='SFD2014<rauhmaru@opensuse.org>'
EMAIL=$( grep -i "$NOME" $LISTA | awk '{print $NF}' | tr [:upper:] [:lower:]) 
CERTIFICADO="OUTPUT/$NOME.pdf"
echo $NOME
echo $EMAIL
echo -------
/usr/bin/sendEmail -f $smtpemailfrom -t $EMAIL -u $flisol_subject -m $MENSAGEM -s $smtpserver:25 -xu $smtplogin -xp $smtppass -a "$CERTIFICADO"
#echo -e "NOME: $NOME \t EMAIL: $EMAIL\t CERT: $CERTIFICADO"

done < $LISTA_LIMPA
}

geracertificado
#envio

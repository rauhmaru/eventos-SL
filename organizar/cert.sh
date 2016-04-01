#! /bin/bash
CERT=CertificadoFlisol2011_v1.svg

for i in `cat lista.txt`; do
	cp $CERT $i.svg
	sed -i 's/XYZ/\$i/g' $i.svg
	inkscape $i.svg -A certificados/$i.pdf
done

#! /bin/bash
# Gera links

echo "<center>" > blog.txt
for i in `cat *.txt`; do
	echo "<div style='float:left; width:30%'><img src="$i"></div>" >> blog.txt
done
echo "</center>" >> blog.txt




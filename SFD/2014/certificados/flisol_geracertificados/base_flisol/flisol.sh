#!/bin/bash
export smtpemailfrom='FLISOL2014<rauhmaru@opensuse.org>'
export flisolemailto=$1
export flisolsubject=$2
export flisolbody=$3
export smtpserver=smtp.gmail.com
export smtplogin=rauhmaru@gmail.com
export smtppass=password

/usr/bin/sendEmail -f $smtpemailfrom -t $flisolemailto -u $flisolsubject -m $flisolbody -s $smtpserver:25 -xu $smtplogin -xp $smtppass


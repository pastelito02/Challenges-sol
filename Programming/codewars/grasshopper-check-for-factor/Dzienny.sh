#Dzienny
base=$1
factor=$2
(( base % factor )) && echo "false" || echo "true"

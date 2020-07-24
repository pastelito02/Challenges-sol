# jimstr
h=$1
m=$2
s=$3
echo $(( ($h * 3600 + $m * 60 + $s) * 1000 ))

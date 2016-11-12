

ARG=$1

for p in $(ps -eocomm,pid | grep  $ARG | sed "s/$ARG\s*//g")
do
  echo "killing $p"
  kill -9 $p
done

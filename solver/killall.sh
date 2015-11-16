



for p in $(ps -eocomm,pid | grep run.sh | sed "s/run.sh\s*//g")
do
  echo "killing $p"
  kill -9 $p
done

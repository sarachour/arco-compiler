#!/bin/bash

BENCH=$1 

echo "y" | sudo apt-get install mailutils
git pull
make clean; make

./run.sh run $BENCH > log.txt

git add output
git commit -a -m "added results from <$BENCH> from job"
git push

tail -n 100 log.txt > sample.txt
mail -s "Job Finished <$BENCH>" sarachour@gmail.com < sample.txt

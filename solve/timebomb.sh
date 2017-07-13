#!/bin/bash

CMD=$1
WAITTIME=$2
echo "#!/bin/bash" > _script.sh
echo $CMD >> _script.sh
chmod +x _script.sh

timeout ${WAITTIME}s ./_script.sh
./killall.sh dReal

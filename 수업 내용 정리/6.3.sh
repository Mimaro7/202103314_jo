#들어오는 인수 개수 프린트
#들어오는 모든 인수 프린트
#모든 인수 순회하면서 하나씩 프린트

#!/bin/bash
echo $#


echo $*


for var "$*"
do
echo $var
done

for var "$@"
do
echo $var
done
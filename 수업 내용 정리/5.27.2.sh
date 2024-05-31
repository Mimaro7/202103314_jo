#!/bin/bash


dir="$1"
echo $dir1

case $dir in
  $dir=1) 
   echo 1월 
  ;;
  $dir=2)
   echo 2월 
  ;;
esac

예시
#!/bin/bash
dir=$1
if [ -z "$#" ]
then
echo "오류"
exit 3
elif [ $# -ne 0 ]
then
echo 실행
case $1
in
1)
echo "1월"
;;
2)
echo "2월"
;;
3)
echo "3월"
;;
4)
echo "4월"
;;
5)
echo "5월"
;;
6)
echo "6월"
;;
7)
echo "7월"
;;
8)
echo "8월"
;;
9)
echo "9월"
;;
10)
echo "10월"
;;
11)
echo "11월"
;;
12)
echo "12월"
;;
*)
echo "$1월은 잘못됐습니다"
;;
esac
elif [ $# -gt 2 ]
then
echo "오류"
exit 2
fi
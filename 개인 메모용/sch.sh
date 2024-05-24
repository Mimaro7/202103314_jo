#!/bin/bash

dir="$1"
dir2="$2"
search=$(grep "$dir2" book.txt)


if [ "$dir" == "1" ]; then
  if [ -n "$search" ]; then
    echo "검색 결과는 $search 입니다."
  else  
    echo "검색 결과가 존재하지 않습니다."
  fi



elif [ "$dir" == "2" ]; then
  echo "$dir2" >> book.txt
  echo "$dir2 를 연락부에 추가했습니다."



elif [ "$dir" == "3" ]; then
  if [ -n "$search" ]; then
    sed -i "/$dir2/d" book.txt
    echo "$dir2 를 연락부에서 삭제했습니다."
  else
    echo "존재하지 않는 연락처입니다."
  fi


else
  echo "잘못된 선택입니다."
fi

#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "입력은 1개여야함"
  exit 1
fi

name="$1"
chk=0

while [ $chk -ne 1 ]; do

  login_users=$(who | cut -d ' ' -f1 | sort | uniq)
  search=$(echo "$login_users" | grep -w "$name")

  if [ "$search" = "$name" ]; then
    chk=1
    echo "$name 로그인함!"
  fi

  sleep 60

done

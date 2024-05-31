#!/bin/bash

date=15

if [ $date -gt 0 ] && [ $date -lt 9 ]
then  
  echo "굿모닝"
  exit 0
elif [ $date -lt 17 ]
then
  echo "굿애프터눈"
  exit 1
else
  echo "굿이브닝"
  exit 2
fi
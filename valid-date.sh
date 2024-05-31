#!/bin/bash


if [ "$#" -ne 3 ]; then
  echo "입력값 오류"
  exit 1
fi

month=$1
day=$2
year=$3

upper_month=0
month_num=0

case "$1" in
  jan|january|1) upper_month="Jan"; month_num=1 ;;
  feb|february|2) upper_month="Feb"; month_num=2 ;;
  mar|march|3) upper_month="Mar"; month_num=3 ;;
  apr|april|4) upper_month="Apr"; month_num=4 ;;
  may|5) upper_month="May"; month_num=5 ;;
  jun|june|6) upper_month="Jun"; month_num=6 ;;
  jul|july|7) upper_month="Jul"; month_num=7 ;;
  aug|august|8) upper_month="Aug"; month_num=8 ;;
  sep|september|9) upper_month="Sep"; month_num=9 ;;
  oct|october|10) upper_month="Oct"; month_num=10 ;;
  nov|november|11) upper_month="Nov"; month_num=11 ;;
  dec|december|12) upper_month="Dec"; month_num=12 ;;
  *) upper_month="0" ;; 
esac



if [ "$upper_month" = "0" ]; then
  echo "유효하지 않은 월: $month"
  echo "$month $day $year는 유효하지 않습니다"
  exit 1
fi

leap_year=0

if (( year % 4 != 0 )); then
   leap_year=0
elif (( year % 100 != 0 )); then
  leap_year=1
elif (( year % 400 != 0 )); then
  leap_year=0
else
  leap_year=1
fi


days_in_month=(31 28 31 30 31 30 31 31 30 31 30 31)

if [ "$leap_year" -eq 1 ]; then
  days_in_month[1]=29
fi

if (( day < 1 || day > ${days_in_month[month_num-1]} )); then
  echo "유효하지 않은 일: $day ,$month 월은 ${days_in_month[month_num-1]} 일까지 있습니다."
  echo "$month $day $year는 유효하지 않습니다"
  exit 1
fi

# 유효한 날짜 출력
echo "$upper_month $day $year"

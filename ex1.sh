#!/bin/bash

dir="$1"

dir_file=$(ls -1 "$dir" | cut -c1 | grep -v d |wc -l)
dir_num=$(ls -1 "$dir" | cut -c1 | grep d |wc -l)



echo "현재 위치 : $dir"
echo "파일 $dir_file개, 폴더 $dir_num개 입니다"
    
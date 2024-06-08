#!/bin/bash

phonebook_file="phonebook.txt"

if [ "$#" -eq 2 ]; then
    name="$1"
    phone_number="$2"

    test_num='^[0-9]+$'
    if ! [[ $phone_number =~ $test_num ]]; then
        echo "잘못된 전화번호 입니다. 숫자만 입력해주세요"
        exit 1
    fi
    
    if ! [[ ${#phone_number} -eq 10 || ${#phone_number} -eq 11 ]]; then
        echo "전화번호는 10자리 또는 11자리여야 합니다."
        exit 1
    fi

    if [ "${phone_number:0:2}" == "02" ]; then
        area_code="${phone_number:0:2}"
    else
        area_code="${phone_number:0:3}"
    fi

    area_name=""
    case "$area_code" in
        "02")
            area_name="서울"
            ;;
        "031")
            area_name="경기"
            ;;
        "032")
            area_name="인천"
            ;;
        "033")
            area_name="강원"
            ;;
        "041")
            area_name="충남"
            ;;
        "042")
            area_name="대전"
            ;;
        "010")
            area_name="일반 휴대전화"
            ;;
        *)
            area_name="기타"
            ;;
    esac

    existing_entry=$(grep -i "^$name" "$phonebook_file")
    if [[ $existing_entry ]]; then
        existing_phone_number=$(echo "$existing_entry" | awk '{print $2}')
        if [ "$phone_number" == "$existing_phone_number" ]; then
            echo "동일한 전화번호가 이미 존재합니다."
            exit 0
        else
            sed -i "/^$name/d" "$phonebook_file"
        fi
    fi

    if [ "${phone_number:0:2}" == "02" ]; then
        formatted_phone_number="${phone_number:0:2}-${phone_number:2:4}-${phone_number:6}"
    else
        formatted_phone_number="${phone_number:0:3}-${phone_number:3:4}-${phone_number:7}"
    fi

    new_entry="$name $formatted_phone_number $area_name"

    echo "$new_entry" >> "$phonebook_file"
    sort -o "$phonebook_file" "$phonebook_file"
    echo "전화번호가 성공적으로 추가되었습니다."
    exit 0
else
    echo "사용법: $0 <이름> [전화번호]"
    exit 1
fi

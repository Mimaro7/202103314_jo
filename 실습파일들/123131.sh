
#!/bin/bash


validchars="0123456789"

if [ "$validchars" = "$1" ]; then
  echo 숫자입니다.
else
  echo 숫자가 아닙니다.
fi

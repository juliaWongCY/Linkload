# edit this file to build your last_touch script as required for question 7.

#!/bin/bash

size=0

if [ "$#" -gt 1 ]
then
  echo "Error: Please enter one specific directory."
  exit -1
fi


if [ "$#" -eq 0 ]
then

git ls-files | while read file
do

  len=${#file}
  #len=`echo "$file" | gawk -F\/ '{printf "%s", $NF}' | wc -c`
  if [ $len -gt $size ]
  then size=$len
  #echo $size
  fi

  #size=$[${#file} + 1]

  git log -n 1 --pretty="%aI  `printf "%-s" [%h]:$file`  (%an)"
done

fi


path="$1"

if [ "$#" -eq 1 ]
then
  if [ ! -d "$path" ] || [ ! -d .git ]

  # git rev-parse --git-dir

  then
    echo "Error: Please enter a correct directory."
    exit -1
  else
  # to print out the last commit, use -n 1
  # The %aI shows the UTC time-stamp
  # The %h shows therevision_id
  # The %an shows the author
  # To pad with spaces and left aligned, we use %-5s

  #pwd

  cd "$1"
  #cd "$(dirname -- "$1")"
  #pwd



  git ls-files | while read file
  do
    git log -n 1 --pretty="%aI  `printf "%-43s" [%h]:$file`  (%an)"
  done

  if [ git ls-files --others =~ $file ]
  then
    echo "[***not under version control***]: $file"
  fi

  #git ls-files | while read file;\
  #do git log -n 1\
  #  --pretty="%aI  [%h]:$file %5s (%an)" -- $file; \
  #done


  fi
fi

#path=$(echo $1 | tr "/")"$1"

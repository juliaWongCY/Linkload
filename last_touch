#!/bin/bash


# When there more than one argument passed in
if [ "$#" -gt 1 ]
then
  echo "Error: Please enter one specific directory."
  exit -1
fi


# When there is only one arh=gument passed in
size=0

if [ "$#" -eq 0 ]
then

  for file in `git ls-files`
  do

  len=${#file}
    if [ $len -gt $size ]
    then
      size=$len
    fi
  done

  for file in `git ls-files`
  do

  #Getting the time-stamp
  date=$(git log -n 1 --pretty=%cI $file)

  #Getting the revision id
  revision_id=$(git log -n 1 --abbrev=5 --pretty=%h $file)

  #Getting the author
  author=$(git log -n 1 --pretty=%an $file)
  #echo $author

printf "%s [%s]: %-${size}s (%s)\n" "$date" "$revision_id" $file "$author"

done
fi


# When there is one argument passing in

# The argument passing in is the correct directory
path="$1"

if [ "$#" -eq 1 ]
then
  # Checking if the argument is a correct git directory
  if [ ! -d "$path" ] || [ ! -d .git ]
  then
    echo "Error: Please enter a correct directory."
    exit -1
  else

  #Going into the correct directory
  cd "$1"
  # Finding the longest file name for padding later
  for file in `git ls-files`
  do
  len=${#file}
    if [ $len -gt $size ]
    then
      size=$len
    fi
  done

  for file in `git ls-files`
  do
  #Getting the time-stamp
  date=$(git log -n 1 --pretty=%cI $file)

  #Getting the revision id
  revision_id=$(git log -n 1 --abbrev=5 --pretty=%h $file)

  #Getting the author
  author=$(git log -n 1 --pretty=%an $file)
  #echo $author

  printf "%s [%s]: %-${size}s (%s)\n" "$date" "$revision_id" $file "$author"


  for files in `git ls-files --others`
  do
    if [ $files == $file ]
    then
      echo "[***not under version control***]: $file"
    fi
  done

  done
  fi
fi

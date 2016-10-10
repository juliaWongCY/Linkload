# edit this file to build your last_touch script as required for question 7.

#!/bin/bash

# to print out the last commit, use -n 1
git=`git ls-files | while read file;\
do git log -n 1\
  --pretty="%ad  [%h]:$file     (%an)" -- $file; \
done`

echo "$git"

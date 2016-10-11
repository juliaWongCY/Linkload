# edit this file to build your last_touch script as required for question 7.

#!/bin/bash



dir= `$1`
echo "$dir"
# to print out the last commit, use -n 1
# The %aI shows the UTC time-stamp
# The %h shows therevision_id
# The %an shows the author
git=`git ls-files | while read file;\
do git log -n 1\
  --pretty="%aI  [%h]:$file     (%an)" -- $file; \
done`

echo "$git"

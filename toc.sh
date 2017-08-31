#!/bin/bash
for f in $(ls -v $1/*.md); do
  name=`basename $f .md`
  name=$(echo "$name" | sed -E 's/(^|_)([a-z])/ \U\2/g')
  name=${name//_/ }
  echo "    * [${name#* }]($f)"
done

#!/usr/bin/env bash

for_archive="common_archive"
extension="tgz"

if [ -d $for_archive ]
then
  rm -rf $for_archive
fi

cp -R common $for_archive

rm -rf $for_archive/{.git,node_modules}

echo "Space before archive: $( du -sh $for_archive )"

if [ -e "$for_archive.$extension" ]
then
  rm "$for_archive.$extension"
fi

tar -czvf "$for_archive.$extension" $for_archive

rm -rf $for_archive

ls -lap

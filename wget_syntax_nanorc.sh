#!/bin/sh -eu

cd /usr/share/nano || exit 1
wget -N -nd -A nanorc -R robots.txt -l 1 -r https://nanosyntax.googlecode.com/svn/trunk/syntax-nanorc/
if [ -e .nanorc_list ] ; then rm .nanorc_list ; fi
cd ~root
ls -1 /usr/share/nano/*.nanorc | while read line
do
    echo include $line>>.nanorc_list
done
ls -la .nanorc_list

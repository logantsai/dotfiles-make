#!/usr/bin/env bash

[ -e Makefile ] && rm -f Makefile

if [[ "$OSTYPE" == darwin* ]]; then
    platform="macos"
elif [[ "$OSTYPE" == linux* ]]; then
    platform="ubuntu"
else
    echo "[ERROR] unkown OSTYPE: $OSTYPE"
    exit 1
fi

echo "---- $platform ----"
sup_pkg="git vim"


# pkg list
echo "pkglist=$sup_pkg" > Makefile.tmp
echo -e "" >> Makefile.tmp
echo "all: \$(OS) \$(pkglist:=.pkg)" >> Makefile.tmp
echo -e "" >> Makefile.tmp

# Collect the config file
for subdir in $sup_pkg
do
    cat $subdir/config.$platform >> Makefile.tmp
    echo -e "" >> Makefile.tmp
done

# Generate the makefile
cat Makefile.head Makefile.tmp Makefile.tail > Makefile
rm -f Makefile.tmp
chmod a-w Makefile

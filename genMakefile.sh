#!/usr/bin/env bash

[ -e Makefile ] && rm -f Makefile

release=""

if [[ "$OSTYPE" == darwin* ]]; then
    platform="macos"
elif [[ "$OSTYPE" == linux* ]]; then
    platform="ubuntu"
    release=`lsb_release -rs`
else
    echo "[ERROR] unkown OSTYPE: $OSTYPE"
    exit 1
fi

echo "---- Generate $platform:$release Makefile ----"

sup_pkg="git vim tmux zsh starship"

# makefile.middle
echo "pkglist=$sup_pkg" > Makefile.tmp
echo -e "" >> Makefile.tmp
echo "all: \$(OS) \$(pkglist:=.pkg)" >> Makefile.tmp
echo -e "" >> Makefile.tmp

# Collect the config file
for subdir in $sup_pkg
do
    if [[ -f $subdir/config.$platform$release ]]; then
        cat $subdir/config.$platform$release >> Makefile.tmp
    else
        cat $subdir/config.$platform >> Makefile.tmp
    fi
    echo -e "" >> Makefile.tmp
done

# Generate the makefile
cat Makefile.head Makefile.tmp Makefile.tail > Makefile
rm -f Makefile.tmp
chmod a-w Makefile

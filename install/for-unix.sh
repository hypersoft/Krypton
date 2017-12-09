#!/usr/bin/env bash

echo

RLWRAP=`type -p rlwrap`;
BASH=`type -p bash`;

[[ -z "$RLWRAP" ]] && {
    echo "Warning: rlwrap support not available; krypton will install with limited interactive mode support";
    echo "Please install the rlwrap package for your system to enable enhanced interactive mode support";
    echo
} || {
 RLWRAP="$RLWRAP -c --command-name krypton ";
}

KRYPTON=`pwd`

JAR_PATH=${0%*install/for-unix.sh}jar/krypton.jar

INSTALL_LIB_PATH=/usr/lib
INSTALL_BIN_PATH=/bin

read -e -p "This script will install (library) krypton.jar to: " -i "$INSTALL_LIB_PATH" INSTALL_LIB_PATH;

test -w "$INSTALL_LIB_PATH" || {
    echo "You do not have the permissions needed to install krypton.jar to: $INSTALL_LIB_PATH";
    exit 1;
}

read -e -p "This script will install (program) krypton to: " -i "$INSTALL_BIN_PATH" INSTALL_BIN_PATH;

test -w "$INSTALL_BIN_PATH" || {
    echo "You do not have the permissions needed to install krypton to: $INSTALL_BIN_PATH";
    exit 1;
}

echo

# install the library
cp -v "$JAR_PATH" "$INSTALL_LIB_PATH";

# install the launcher
echo $'\n'"generating $INSTALL_BIN_PATH/krypton launcher..."
cat <<EOF > "$INSTALL_BIN_PATH/krypton"
#!${BASH}

${RLWRAP}java -jar ${INSTALL_LIB_PATH}/krypton.jar "\$@";

EOF

chmod +x "$INSTALL_BIN_PATH/krypton";

echo $'\n'"Thank you for choosing Krypton by Hypersoft-Systems: U.-S.-A."$'\n';

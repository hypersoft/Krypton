#!/usr/bin/env bash

RLWRAP=`type -p rlwrap`;
BASH=`type -p bash`;

INSTALL_LIB_PATH=/usr/lib
INSTALL_BIN_PATH=/bin
INSTALL_EXT_PATH= # a custom classpath if specified parameter

automatic=0;

script=$(cat <<EOF
while [[ "\${1:0:2}" == -- ]]; do
    if [[ "\$1" == '--automatic' ]]; then
     automatic=1; shift; continue;
    fi;
    if [[ "\$1" == '--classpath' ]]; then
        INSTALL_EXT_PATH="-classpath \$2 "; shift 2; continue;
    fi;
    if [[ "\$1" == '--libraries' ]]; then
        INSTALL_LIB_PATH="\$2"; shift 2; continue;
    fi;
    if [[ "\$1" == '--commands' ]]; then
        INSTALL_BIN_PATH="\$2"; shift 2; continue;
    fi;
    break;
done;
EOF
);

[[ "$1" =~ -(h|-help|\?) ]] && {
    printf "%s\n" "$script";
    exit 1;
} || {
    eval $script;
}

[[ -z "$RLWRAP" ]] && {
    echo "Warning: rlwrap support not available; krypton will install with limited interactive mode support";
    echo "Please install the rlwrap package for your system to enable enhanced interactive mode support";
    echo
} || {
 RLWRAP="$RLWRAP -c --command-name krypton ";
}

KRYPTON=`pwd`

JAR_PATH="${0%*install/for-unix.sh}jar/*.jar"


((automatic == 0)) && {
echo
read -e -p "This script will install krypton (library) directory to: " -i "$INSTALL_LIB_PATH" INSTALL_LIB_PATH;
[[ -z "$INSTALL_LIB_PATH" ]] && exit 1;
}

test -w "$INSTALL_LIB_PATH" || {
    echo "You do not have the permissions needed to install krypton libraries to: $INSTALL_LIB_PATH";
    exit 1;
}

INSTALL_LIB_PATH="$INSTALL_LIB_PATH/krypton";
if [[ -e "$INSTALL_LIB_PATH" ]]; then
    rm -rf "$INSTALL_LIB_PATH"/*;
else
    mkdir -v "$INSTALL_LIB_PATH";
fi

((automatic == 0)) && {
read -e -p "This script will install (command) krypton to: " -i "$INSTALL_BIN_PATH" INSTALL_BIN_PATH;
[[ -z "$INSTALL_LIB_PATH" ]] && exit 1;
}

test -w "$INSTALL_BIN_PATH" || {
    echo "You do not have the permissions needed to install the krypton command to: $INSTALL_BIN_PATH";
    exit 1;
}

echo

echo "installing required libraries...";
cp -v $JAR_PATH "$INSTALL_LIB_PATH" || exit $?;

echo $'\n'"generating $INSTALL_BIN_PATH/krypton launcher..."
{
cat <<EOF > "$INSTALL_BIN_PATH/krypton"
#!${BASH}

${RLWRAP}java ${INSTALL_EXT_PATH}-jar ${INSTALL_LIB_PATH}/krypton.jar "\$@";

EOF
} || exit $?;

echo
chmod -v +x "$INSTALL_BIN_PATH/krypton" || exit $?;

echo $'\n'"Thank you for choosing Krypton by Hypersoft-Systems: U.-S.-A."$'\n';

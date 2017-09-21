#!/bin/bash

if [ $? -ne 0 ]; then /bin/bash -c "$0"; exit; fi

export REGULAR_PWD=$PWD
export DBUS_SRC_PATH=$REGULAR_PWD/dbus-1.10.10
export EXPAT_SRC_PATH=$REGULAR_PWD/expat-2.2.4
export DBUS_RUNTIME_SRC_PATH=$REGULAR_PWD/capicxx-dbus-runtime
export DBUS_GENERATOR=$REGULAR_PWD/commonapi_dbus_generator
export GENERATOR=$REGULAR_PWD/commonapi-generator

rm -rf $DBUS_SRC_PATH
rm -rf $EXPAT_SRC_PATH
rm -rf $DBUS_RUNTIME_SRC_PATH
rm -rf $DBUS_GENERATOR
rm -rf $GENERATOR
rm -rf ./Uses_libs

echo "-------------------------------------"
read -n1 -r -p "Script finalized :-)" key

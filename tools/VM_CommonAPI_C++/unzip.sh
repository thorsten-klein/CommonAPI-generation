#!/bin/bash

if [ $? -ne 0 ]; then /bin/bash -c "$0"; exit; fi

export SOURCES_DIR=$PWD/../Sources

#Unzip zip files
tar -xzf $SOURCES_DIR/dbus-1.10.10.tar.gz

unzip $SOURCES_DIR/capicxx-dbus-runtime-master.zip
mv ./capicxx-dbus-runtime-master ./capicxx-dbus-runtime

unzip $SOURCES_DIR/capicxx-core-runtime-master.zip
mv ./capicxx-core-runtime-master ./capicxx-dbus-runtime/capicxx-core-runtime

tar xfvj $SOURCES_DIR/expat-2.2.4.tar.bz2 # not needed for VM


mkdir commonapi_dbus_generator
cd ./commonapi_dbus_generator
unzip $SOURCES_DIR/commonapi_dbus_generator.zip
cd ..

mkdir commonapi-generator
cd ./commonapi-generator
unzip $SOURCES_DIR/commonapi-generator.zip
cd ..

#echo "-------------------------------------"
#read -n1 -r -p "Script finalized :-)" key

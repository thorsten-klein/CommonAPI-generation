#!/bin/bash

if [ $? -ne 0 ]; then /bin/bash -c "$0"; exit; fi

echo "Generating fidl ..."
../tools/VM_CommonAPI_C++/commonapi-generator/commonapi-generator-linux-x86_64 -sk ./fidl/E00HelloWorld.fidl
../tools/VM_CommonAPI_C++/commonapi_dbus_generator/commonapi-dbus-generator-linux-x86_64 ./fidl/E00HelloWorld.fidl


echo "-------------------------------------"
read -n1 -r -p "Script finalized :-)" key

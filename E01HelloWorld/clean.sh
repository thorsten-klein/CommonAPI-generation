#!/bin/bash

if [ $? -ne 0 ]; then /bin/bash -c "$0"; exit; fi


echo "removing folder ./build ..."
rm -rf ./build

echo "removing folder ./src-gen ..."
rm -rf ./src-gen

echo "removing CodeBench output folder(s) ..."
#rm -rf ./Client_Debug/
#rm -rf ./Client_Release/
#rm -rf ./Server_Debug/
#rm -rf ./Server_Release/
#rm -rf ./VM_Linux_Client_Debug/
#rm -rf ./VM_Linux_Client_Release/
#rm -rf ./VM_Linux_Server_Debug/
#rm -rf ./VM_Linux_Server_Release/

read -n1 -r -p "-------------------------------------" key

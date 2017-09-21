#!/bin/bash

if [ $? -ne 0 ]; then /bin/bash -c "$0"; exit; fi

# cmake generation
echo "Generating built setup via cmake ..."
mkdir ./build
cd ./build
cmake ..

echo "Build with make ..."
make


echo "-------------------------------------"
read -n1 -r -p "Script finalized :-)" key

#!/bin/bash

if [ $? -ne 0 ]; then /bin/bash -c "$0"; exit; fi

export REPO_DIR=$PWD

# Build CommonAPI-C++
cd $REPO_DIR/tools/VM_CommonAPI_C++
./build_VM.sh

# Compile Example E01
cd $REPO_DIR/E01HelloWorld
./prepare.sh
./VM_built.sh

#execute compiled Applications
cd ./build
./HelloWorldServer # not working
./HelloWorldClient # not working

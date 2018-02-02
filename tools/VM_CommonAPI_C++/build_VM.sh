#!/bin/bash

if [ $? -ne 0 ]; then /bin/bash -c "$0"; exit; fi

#set -e

echo "--------------------------------------------------------------------------------------------"
echo define paths to extracted sources
echo "--------------------------------------------------------------------------------------------"
export REGULAR_PWD=$PWD
export DBUS_SRC_PATH=$REGULAR_PWD/dbus-1.10.10
export EXPAT_SRC_PATH=$REGULAR_PWD/expat-2.2.4
export DBUS_RUNTIME_SRC_PATH=$REGULAR_PWD/capicxx-dbus-runtime
export CORE_RUNTIME_SRC_PATH=$DBUS_RUNTIME_SRC_PATH/capicxx-core-runtime

echo "--------------------------------------------------------------------------------------------"
echo unzip files
echo "--------------------------------------------------------------------------------------------"
./unzip.sh


echo "--------------------------------------------------------------------------------------------"
echo build capicxx-core-runtime
echo "--------------------------------------------------------------------------------------------"
cd $CORE_RUNTIME_SRC_PATH
mkdir ./build
cd build
cmake ..
make



echo "--------------------------------------------------------------------------------------------"
echo Apply patches to dbus
echo "--------------------------------------------------------------------------------------------"
cd $DBUS_SRC_PATH
for i in $DBUS_RUNTIME_SRC_PATH/src/dbus-patches/*.patch; do patch -p1 < $i; done


echo "--------------------------------------------------------------------------------------------"
echo build expatl
echo "--------------------------------------------------------------------------------------------"
echo "Not necessary for VM Built ..."
export EXPAT_BUILD=$EXPAT_SRC_PATH/build
export EXPAT_FINAL=$EXPAT_SRC_PATH/final
mkdir $EXPAT_BUILD
mkdir $EXPAT_FINAL

cd $EXPAT_BUILD
$EXPAT_SRC_PATH/configure $CONFIGURE_FLAGS --prefix=$EXPAT_FINAL
make
make install
#cd $EXPAT_FINAL
#ls


export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$EXPAT_FINAL/lib/pkgconfig
export DBUS_BUILD=$DBUS_SRC_PATH # not working in subfolder /build?
export DBUS_FINAL=$DBUS_SRC_PATH/final
mkdir $DBUS_BUILD 
mkdir $DBUS_FINAL

export CFLAGS="$CFLAGS -O0"
export CXXFLAGS="$CXXFLAGS -O0"

echo "--------------------------------------------------------------------------------------------"
echo build dbus
echo "--------------------------------------------------------------------------------------------"
cd $DBUS_BUILD 
$DBUS_SRC_PATH/configure $CONFIGURE_FLAGS --enable-tests=no --enable-modular-tests=no #--prefix=$DBUS_BUILD 
make #V=1 #VERBOSE=1
make install DESTDIR=$DBUS_FINAL #V=1





echo "--------------------------------------------------------------------------------------------"
echo build capicxx-dbus-runtime
echo "--------------------------------------------------------------------------------------------"
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$DBUS_SRC_PATH # $DBUS_BUILD # ???
cd $DBUS_RUNTIME_SRC_PATH
mkdir ./build
cd ./build
cmake .. -DUSE_INSTALLED_COMMONAPI=OFF -DUSE_INSTALLED_DBUS=OFF -DDBus_INCLUDE_DIRS=$DBUS_BUILD #--debug-output --trace -Wdev -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -LH #DDBus_INCLUDE_DIRS must be set since otherwise some error with path occurs???
make #V=1 #VERBOSE=1

echo "--------------------------------------------------------------------------------------------"
echo Copying generated libraries
echo "--------------------------------------------------------------------------------------------"
mkdir $REGULAR_PWD/Uses_libs
cp $DBUS_RUNTIME_SRC_PATH/build/libCommonAPI-DBus.so.3.1.12 $REGULAR_PWD/Uses_libs/
cp $CORE_RUNTIME_SRC_PATH/build/libCommonAPI.so.3.1.12 $REGULAR_PWD/Uses_libs/


echo "-------------------------------------"
read -n1 -r -p "Waiting for any key to close window :-)" key



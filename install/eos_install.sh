#!/usr/bin/env bash

GLOBAL_PATH=$(pwd)
EOS_SOURCE_DIR=$HOME/opt/source
TAG="DAWN-2018-05-16"

if [[ ! -d $EOS_SOURCE_DIR ]]; then
	echo "..:: Downloading EOS Sources ::..";
	mkdir $EOS_SOURCE_DIR
	cd $EOS_SOURCE_DIR

	git clone https://github.com/eosio/eos --recursive .
	git checkout $TAG
	git submodule update --init --recursive
	cd $GLOBAL_PATH
fi


# Compile Sources
if [[ ! -d $EOS_SOURCE_DIR/build ]]; then
	echo "..:: Compiling EOS Sources ::..";
	cd $EOS_SOURCE_DIR
	git pull
	./eosio_build.sh
	cd $GLOBAL_PATH
fi
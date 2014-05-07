#!/usr/bin/env bash

PROJECT_PATH=$1
ENV_NAME=$2

echo "--- Create Laravel project ---"

cd ${PROJECT_PATH}
wget https://github.com/laravel/laravel/archive/master.zip
unzip -o master.zip && rm master.zip
cp -r laravel-master/* ./
rm -r -f laravel-master

mkdir ${PROJECT_PATH}/app/config/${ENV_NAME}
cp ${PROJECT_PATH}/vagrant/templates/laravel_config_app.stub ${PROJECT_PATH}/app/config/${ENV_NAME}/app.php

composer global require "laravel/envoy=~1.0"

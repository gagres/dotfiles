#!/bin/bash

sudo apt-get -qq install lsb-release \
  ca-certificates \
  apt-transport-https \
  software-properties-common

sudo add-apt-repository ppa:ondrej/php

sudo apt update

sudo apt install php8.0
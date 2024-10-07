#!/bin/bash

groupadd -o -g $HOST_GROUP docker
useradd -d /app -s /bin/bash -u $HOST_USER -g docker $HOST_USER_NAME
usermod -a -G video $HOST_USER_NAME
chown -R $HOST_USER_NAME .
sudo -u $HOST_USER_NAME python3 run.py --execution-provider cuda $@

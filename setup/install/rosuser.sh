#!/usr/bin/env bash

set -e

apt-get update && apt-get install --no-install-recommends --allow-unauthenticated -y \
	sudo

# Configure user
passwd=rosuser
uid=1000
gid=1000

export PASSWD=$passwd
#export UID=$uid
export GID=$gid

groupadd $USER && \
    useradd --create-home --no-log-init -g $USER $USER && \
    usermod -aG sudo $USER && \
    echo "$PASSWD:$PASSWD" | chpasswd && \
    chsh -s /bin/bash $USER && \
    # Replace 1000 with your user/group id
    #usermod  --uid $UID $USER && \
    groupmod --gid $GID $USER


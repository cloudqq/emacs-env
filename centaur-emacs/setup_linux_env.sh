#!/usr/bin/env bash

# 自定义的用户名
USER=user
WORKDIR=/mnt/workspace

VOL_HOME=home20201225

docker volume create $VOL_HOME

docker run -ti --rm \
       -v $(pwd):${WORKDIR} \
       -v ${VOL_HOME}:/home/${USER} \
       -e WORKSPACE=${WORKDIR} \
       -e UNAME="${USER}" \
       -e GNAME="${USER}" \
       -e UID="1000" \
       -e GID="1000" \
       -e UHOME="/home/${USER}" \
      cloudqq/emacs-docker-27:latest sh -c "git clone --depth 1 https://github.com/seagle0128/.emacs.d.git ~/.emacs.d; emacs --script ~/.emacs.d/init.el"

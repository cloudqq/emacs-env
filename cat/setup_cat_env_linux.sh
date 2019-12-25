#!/usr/bin/env bash

# 自定义的用户名
USER=user
WORKDIR=/mnt/workspace

VOL_HOME=home20201224

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
      cloudqq/emacs-docker-27:latest sh -c "git clone --recurse-submodules -j8 https://github.com/MatthewZMD/.emacs.d.git ~/.emacs.d; emacs --script ~/.emacs.d/init.el"

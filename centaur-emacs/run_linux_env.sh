#!/usr/bin/env bash
#
# 自定义的用户名
USER=user
WORKDIR=/mnt/workspace
VOL_HOME=home20201225

docker run -ti --rm  \
 -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
 -v $(pwd):${WORKDIR} \
 -v ${VOL_HOME}:/home/${USER} \
 -v /etc/localtime:/etc/localtime:ro \
 -e http_proxy= \
 -e https_proxy= \
 -e DISPLAY=$DISPLAY \
 -e UNAME="${USER}"\
 -e GNAME="${USER}"\
 -e UID="1000"\
 -e GID="1000"\
 -e UHOME="/home/${USER}" \
 -e WORKSPACE="${WORKDIR}" \
 -e LANG=zh_CN.UTF-8 \
 -e LANGUAGE=zh_CN:en_US \
 -e LC_CTYPE=en_US.UTF-8 \
 -v ${HOME}/.Xauthority:/home/${USER}/.Xauthority \
 -w "${WORKDIR}" \
 cloudqq/emacs-docker-27:latest emacs

REM  可以自定义的用户名 工作目录 容器名称， 这里DISPLAY 必须根据实际情况来设置

SET USER=user
SET WORKDIR=/mnt/workspace
SET VOL_HOME=home20201224
SET DISPLAY=192.168.2.6:14

docker run -ti --rm  ^
 -v %CD%:%WORKDIR% ^
 -v %VOL_HOME%:/home/%USER% ^
 -e DISPLAY=%DISPLAY% ^
 -e UNAME="%USER%" ^
 -e GNAME="%USER%" ^
 -e UID="1000" ^
 -e GID="1000" ^
 -e UHOME="/home/%USER%" ^
 -e WORKSPACE="%WORKDIR%" ^
 -e LANG=zh_CN.UTF-8 ^
 -e LANGUAGE=zh_CN:en_US ^
 -e LC_CTYPE=en_US.UTF-8 ^
 -w "%WORKDIR%" ^
 cloudqq/emacs-docker-27:latest	emacs

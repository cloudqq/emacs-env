REM username
set USER=user

REM home volume
set VOL_HOME=home20201224

REM default workspace
set WORKDIR=/mnt/workspace

rem docker volume rm %VOL_HOME%
docker volume create %VOL_HOME%

docker run -it --rm ^
 -v %VOL_HOME%:/home/%USER% ^
 -e GID="1000" ^
 -e UID="1000" ^
 -v %PWD%:%WORKDIR% ^
 -e GNAME="%USER%" ^
 -e UNAME="%USER%" ^
 -e WORKSPACE=%WORKDIR% ^
 -e UHOME="/home/%USER%" ^
 cloudqq/emacs-docker-27:latest ^
 sh -c "git clone https://github.com/hlissner/doom-eamcs ~/.emacs.d; env ; ~/.emacs.d/bin/doom -y install"

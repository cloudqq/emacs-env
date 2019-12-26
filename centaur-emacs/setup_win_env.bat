REM username
set USER=user

REM home volume
set VOL_HOME=home20201225

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
 sh -c "git clone --depth 1 https://github.com/seagle0128/.emacs.d.git ~/.emacs.d; emacs --script ~/.emacs.d/init.el"

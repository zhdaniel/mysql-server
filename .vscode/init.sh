#!/bin/bash

ROOT=$(cd "`dirname $0`/.."; pwd)

cd $ROOT

if [ -e $ROOT/local/my.cnf ]; then
	exit
fi

if [ ! -d $ROOT/local ]; then
	mkdir -p $ROOT/local
fi

cat <<EOF > $ROOT/local/my.cnf
[client]
socket           = $ROOT/local/var/mysql.sock
[mysqld]
bind-address     = 127.0.0.1
basedir          = $ROOT/local
datadir          = $ROOT/local/data
general_log      = ON
general_log_file = $ROOT/local/log/mysqld.log
pid_file         = $ROOT/local/var/mysqld.pid
socket           = $ROOT/local/var/mysql.sock
log-error        = $ROOT/local/log/mysqld.err
sql-mode         = NO_ENGINE_SUBSTITUTION
EOF
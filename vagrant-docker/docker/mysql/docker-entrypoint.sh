#!/bin/bash
set -e

DATADIR='/var/lib/mysql'

if [ "${1:0:1}" = '-' ]; then
	set -- mysqld "$@"
fi

if [ ! -d "$DATADIR/mysql" -a "${1%_safe}" = 'mysqld' ]; then
	echo 'Running mysql_install_db ...'
	mysql_install_db
	echo 'Finished mysql_install_db'

	cat /tmp/root.sql /tmp/users.sql /tmp/data.sql > /tmp/init-db.sql

	set -- "$@" --init-file="/tmp/init-db.sql"
fi

chown -R mysql:mysql "$DATADIR"
exec "$@"

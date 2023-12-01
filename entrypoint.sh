#!/bin/sh
gosu postgres pg_basebackup -h ${POSTGRES_MASTER_HOST} -p ${POSTGRES_MASTER_PORT} -D ${PGDATA} -S ${POSTGRES_REPLICATION_SLOT} -X stream -U ${POSTGRES_REPLICATION_USER} -R -P
/usr/local/bin/docker-entrypoint.sh postgres

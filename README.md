Docker Container Setup for Replication Destination

1. Configure `postgresql.conf` and `pg_hba.conf` on the master server.
2. Setup a replicator user and a [replication slot](https://www.postgresql.org/docs/15/warm-standby.html#STREAMING-REPLICATION-SLOTS) on the master server.
        ```sql
        CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'example-replicator-pass';
        SELECT * FROM pg_create_physical_replication_slot('the_replication_slot'); 
        ```
3. Clone this repository on the replication destination server.
4. Copy and edit the example config files (config/docker.env and config/pgpass).
5. Change the ownership of config/pgpass to postgres: sudo chown 999:999 config/pgpass (where 999:999 represents postgres:postgres inside the container)
6. Ensure the master server is running with the configuration set in step 1 and is accessible from the replication destination.
7. Launch the container: docker compose up -d

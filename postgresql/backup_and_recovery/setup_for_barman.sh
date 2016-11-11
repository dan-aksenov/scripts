# PostgreSQL connection
# on db server
createuser -s -W barman
# add passw to .pgpass on barman server
# barman@backup$ psql -c 'SELECT version()' -U barman -h pg postgres

# PostgreSQL WAL archiving and replication postgresql.conf
# wal_level = 'replica' or 'hot_standby' for 9.6

# PostgreSQL streaming connection
# on db server
createuser -W --replication streaming_barman
# add passw to .pgpass on barman server
# barman@backup$ psql -U streaming_barman -h pg -c "IDENTIFY_SYSTEM" replication=1

# add postgresql.conf
# max_wal_senders = 2
# max_replication_slots = 2

# Server configuration file (on barman server) /etc/barman.d/pg.conf
# [pg]
# description =  "Our main PostgreSQL server"
# conninfo = host=pg user=barman dbname=postgres
# backup_method = postgres
# if streadming needed
# streaming_conninfo = host=pg user=streaming_barman dbname=postgres
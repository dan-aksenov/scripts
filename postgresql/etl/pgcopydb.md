# pgcopydb

`pgcopydb` is a tool that automates running `pg_dump | pg_restore` between two running Postgres servers. To make a copy of a database to another server as quickly as possible, one would like to use the parallel options of pg_dump and still be able to stream the data to as many pg_restore jobs.

The pgcopydb `clone --follow` command implements a full solution for online migration.

<https://github.com/dimitri/pgcopydb>

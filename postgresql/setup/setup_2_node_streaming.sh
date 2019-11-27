# Should use My ansible roles to install postgreses.
# Exit if any command fails
set -e

# Postgresql version
pg_ver=$1
# Streaming master
master=$2
# Streaming slaves.
slave=$3

echo Install Master
ansible-playbook -i ../ansible-hosts/test -l $master postgres_main.yml -e "postgresql_version=$pg_ver"
echo Install Slave
ansible-playbook -i ../ansible-hosts/test -l $slave postgres_main.yml --tags slave -e "postgresql_version=$pg_ver"

echo Edit config
ssh ansible@$master sudo sed -i 's/^#node_id=1/node_id=1/g' /etc/repmgr/$pg_ver/repmgr.conf
ssh ansible@$slave sudo sed -i 's/^#node_id=1/node_id=2/g' /etc/repmgr/$pg_ver/repmgr.conf

echo Register Master
ssh ansible@$master sudo -iu postgres /usr/pgsql-$pg_ver/bin/repmgr primary register
echo Clone Slave
ssh ansible@$slave sudo -iu postgres /usr/pgsql-$pg_ver/bin/repmgr -h $master -U repmgr -d repmgr standby clone
echo Start Slave
ssh ansible@$slave sudo -iu postgres /usr/pgsql-$pg_ver/bin/pg_ctl start -w -D /var/lib/pgsql/$pg_ver/data
echo Register Slave
ssh ansible@$slave sudo -iu postgres /usr/pgsql-$pg_ver/bin/repmgr standby register

ssh ansible@$slave sudo -iu postgres /usr/pgsql-$pg_ver/bin/repmgr cluster show

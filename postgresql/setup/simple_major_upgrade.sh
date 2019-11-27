# Postgresql version
pg_ver_old=$1
pg_ver_new=$2
master=cos7-sb1

ansible-playbook -i ../ansible-hosts/test -l $master postgres_main.yml --tags 1_repository,2_install,3_init -e "postgresql_version=$pg_ver_new"

ansible -i ../ansible-hosts/test $master -a "/usr/pgsql-$pg_ver_old/bin/pg_ctl stop -D /var/lib/pgsql/$pg_ver_old/data" --become --become-user=postgres -u ansible 

ssh ansible@$master sudo -u postgres cp /var/lib/pgsql/$pg_ver_old/data/conf.d/  /var/lib/pgsql/$pg_ver_new/data/ -R
ssh ansible@$master sudo -u postgres cp /var/lib/pgsql/$pg_ver_old/data/postgresql.conf /var/lib/pgsql/$pg_ver_new/data/postgresql.conf
ssh ansible@$master sudo -u postgres cp /var/lib/pgsql/$pg_ver_old/data/pg_hba.conf /var/lib/pgsql/$pg_ver_new/data/pg_hba.conf

cmd="/usr/pgsql-$pg_ver_new/bin/pg_upgrade -d /var/lib/pgsql/$pg_ver_old/data -D /var/lib/pgsql/$pg_ver_new/data -b /usr/pgsql-$pg_ver_old/bin/ -B /usr/pgsql-$pg_ver_new/bin/ -k"
ansible -i ../ansible-hosts/test $master -a "$cmd" --become --become-user=postgres -u ansible 

ansible-playbook -i ../ansible-hosts/test -l $master postgres_main.yml --tags 6_startdb -e "postgresql_version=$pg_ver_new"
#ansible -i ../ansible-hosts/test $master -a "/usr/pgsql-$pg_ver_new/bin/pg_ctl start -D /var/lib/pgsql/$pg_ver_new/data" --become --become-user=postgres -u ansible 

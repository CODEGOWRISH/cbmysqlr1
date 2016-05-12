#
#  Run mysql_secure_install
#
#  After:  initial instllation
#  Before: further configuration
#
#  To:
#  set root password, remove unnecessary databases, disallowing remote login etc
#
#  Reference:  http://www.tecmint.com/install-mariadb-in-linux/
#


bash 'Secure the installation' do
user 'root'

code <<-EOH

mysql --user=root <<EOF
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('newRoot123_123');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

# Start mysql service
service mysqld restart

EOH

end

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

initialRootPw=`awk '/localhost:/{print $NF}' /var/log/mysqld.log`
echo "" > /tmp/my.cnf
echo "" > /tmp/my.cnf
echo "[client]" >> /tmp/my.cnf
echo "user=root" >> /tmp/my.cnf
echo "password=$initialRootPw" >> /tmp/my.cnf
cat /tmp/my.cnf >> /etc/my.cnf

# restart mysql service
service mysqld restart

#
mysql --connect-expired-password --user=root <<EOF
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('#{node[:rootPass]}');
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

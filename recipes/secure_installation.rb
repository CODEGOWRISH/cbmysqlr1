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
    rootPass=`awk '/localhost:/{print $NF}' /var/log/mysqld.log`
    mysql_secure_installation <<EOF
    je8dl2jq.!jI
    newRoot123.!
    newRoot123.!
    Y
    newRoot123.!
    newRoot123.!
    Y
    Y  
    Y
    Y
    Y
    EOF

    # Start mysql service
    service mysqld restart

  EOH

end

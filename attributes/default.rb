#
#
#  Attributes file
#
#

default['rootPass']='root123_ROOT123'

#default['softwareStageDir'] = '/vagrant/MariaDB'
default['softwareStageDir'] = '/mysql-rpms'

# Test line
#default['rpmsToInstall'] = [
#'MariaDB-10.1.11-centos7-x86_64-common.rpm'
#]

default['packagesToRemove'] = [
  'postfix'
]

default['preReqPakages'] = [
  'boost-program-options',
  'unixODBC',
  'lsof',
  'perl-DBI'
]

# DO NOT change the order of rpms below
default['rpmsToInstall'] =
[
'mysql-commercial-common-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-libs-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-libs-compat-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-client-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-devel-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-embedded-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-embedded-compat-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-embedded-devel-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-server-5.7.12-1.1.el7.x86_64.rpm',
'mysql-commercial-test-5.7.12-1.1.el7.x86_64.rpm'
]

# my.cnf
default['myCnfFile'] = '/etc/my.cnf'

# Directories - datadir, binlog dir, db dir
default['dirList'] = {
                        'rootBase'   => '/mysqldata',
                        'mysqlBase'  => '/mysqldata/mysql',
                        'dataDir'    => '/mysqldata/mysql/data',
                        'binlogDir'  => '/mysqldata/mysql/binlog',
                        'dbDir'      => '/mysqldata/mysql/db',
                        'hrDbDir'    => '/mysqldata/mysql/db/hr'
                     }

default['binlogName']         = '/mysqldata/mysql/binlog/binlog'
default['binlogIndex']        = '/mysqldata/mysql/binlog/binlog.index'
default['expireLogDays']      = '2'
default['binlogFormat']       = 'mixed'

# HR DB SQL File
default['crDbHrSqlFile'] = 'create_db_hr.sql'


databag = Chef::DataBagItem.load("unenc", "passwords")
password = databag["mysqlrootstd"]
Chef::Log.info("Un-encrypted databag has - the standard mysql root password is: '#{password}'")

rootpwstandard = Chef::EncryptedDataBagItem.load("mysqlpasswords", "rootpwstandard")
password = rootpwstandard["password"]
Chef::Log.info("Encrypted databag has - the standard mysql root password is: '#{password}'")

#
#
#  create_server_cnf.rb
#
#

# Backup original configuration file

serverConfigFile = node[:myCnfFile]

execute "backup current #{serverConfigFile}" do
  user "root"
  command "mv #{serverConfigFile} #{serverConfigFile}.orig"
  #not_if File.exist?("#{serverConfigFile}.orig")

  not_if do ::File.exists?("#{serverConfigFile}.orig") end
end

template node[:myCnfFile] do
  source 'my_cnf.erb'
   owner 'root'
   group 'root'
    mode '0755'

  variables({
    :binlogName     => node[:binlogName],
    :binlogIndex    => node[:binlogIndex],
    :expireLogDays  => node[:expireLogDays],
    :binlogFormat   => node[:binlogFormat]
    })

end

# Start mysql service
service 'mysqld' do
  action [:restart]
end

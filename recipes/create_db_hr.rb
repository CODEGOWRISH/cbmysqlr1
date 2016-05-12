#
#
#  Create DB called hr
#
#

# Copy the SQL file to node
theFile=node[:crDbHrSqlFile]

cookbook_file "/tmp/#{theFile}" do
  source "#{theFile}"
  mode '0700'
  action :create
end

# Run the SQL using mysql user root
bash 'Create database HR and its objects' do 

  user 'root'

  code <<-EOH
    mysql -u root -proot < "/tmp/#{theFile}"       
  EOH
  
end
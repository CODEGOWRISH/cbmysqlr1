#
# Install rpms of Maria DB
#
# Works on Redhat and the likes
#
#

# Check if already exists
# TBD

# Install pre-requisites
node[:preReqPakages].each do |preReqPackage|

  puts "Installing Pre-requisites: #{preReqPackage}"
  yum_package "#{preReqPackage}" do
    action :install
  end

end

# Install RPMs
softwareStageDir = node[:softwareStageDir]

node[:rpmsToInstall].each do |rpmFile|

  #rpmPath = "#{softwareStageDir}" + "/" + "#{rpmFile}"  # This syntax too works
  rpmPath = "#{softwareStageDir}\/#{rpmFile}"

  puts "Installing: #{rpmPath}"

  rpm_package "#{rpmFile}" do
    action :install
    source "#{rpmPath}"
  end

  #execute 'install rpm' do
    #command "rpm -Uvh #{rpmPath}"
  #end

end

# Start mysql service
service 'mysqld' do
  action [:enable, :start]
end

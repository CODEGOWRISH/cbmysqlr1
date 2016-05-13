#
#  create_dirs_files.rb
#

node[:dirList].each do |dirType, dirName|

  puts dirName

  directory dirName do
    user 'mysql'
    group 'mysql'
    action :create
  end

end

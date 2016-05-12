#
#  create_dirs_files.rb
#

node[:dirList].each do |dirType, dirName| 

  puts dirName

  directory dirName do
    user 'root'
    action :create
  end

end
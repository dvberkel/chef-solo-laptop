# The basic setup for a computer

#execute "update sources" do
#  command "apt-get update -y"
#end

# all package to install
packages = %w{bzr mercurial subversion}

packages.each do |a_package|
  package a_package
end

# The basic setup for a computer

#execute "update sources" do
#  command "apt-get update -y"
#end

# all package to install

# packages = %w{bzr}

# packages.each do |a_package|
#   package a_package
# end

package 'subversion' do
  action :install
  options "--force-yes"
end

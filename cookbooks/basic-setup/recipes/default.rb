# The basic setup for a computer

#execute "update sources" do
#  command "apt-get update -y"
#end

# all package to install
vcss = %w{bzr mercurial subversion}
languages = %w{ghc6 swi-prolog}
packages = [ vcss, languages ]

packages.flatten.each do |a_package|
  package a_package
end

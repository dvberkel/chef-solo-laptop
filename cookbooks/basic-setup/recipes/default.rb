# The basic setup for a computer

#execute "update sources" do
#  command "apt-get update -y"
#end

# all package to install
vcss = %w{bzr mercurial subversion}
mathematics = %w{texlive-full geogebra genius coqide}
languages = %w{ghc6 swi-prolog ocaml erlang mit-scheme}
java = %w{openjdk-6-jdk openjdk-6-doc openjdk-6-source openjdk-7-jdk openjdk-7-doc openjdk-7-source}
packages = [ vcss, mathematics, languages, java ]

packages.flatten.each do |a_package|
  package a_package
end

# all recipes to include
recipes = %w{rvm nodejs nodejs::npm arduino}

recipes.each do |a_recipe|
  include_recipe a_recipe
end

# all files to create


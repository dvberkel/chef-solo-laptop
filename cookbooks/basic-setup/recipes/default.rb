# The basic setup for a computer

#execute "update sources" do
#  command "apt-get update -y"
#end

# all package to install
vcss = %w{bzr mercurial subversion}
mathematics = %w{texlive-full geogebra genius coqide}
languages = %w{haskell-platform swi-prolog ocaml erlang mit-scheme}
java = %w{openjdk-6-jdk openjdk-6-doc openjdk-6-source openjdk-7-jdk openjdk-7-doc openjdk-7-source maven2}
databases = %w{redis-server}
packages = [ vcss, mathematics, languages, java, databases]

packages.flatten.each do |a_package|
  package a_package
end

# all recipes to include
utils = %w{rvm phantomjs}
recent_languages = %w{nodejs nodejs::npm leiningen go}
recent_databases = %w{couchdb mysql::server}
electronics = %w{arduino}
recipes = [ utils, recent_languages, recent_databases, electronics, gurps ]

recipes.flatten.each do |a_recipe|
  include_recipe a_recipe
end

# all files to create


maintainer "Daan van Berkel"
maintainer_email "daan.v.berkel.1980@gmail.com"
license "MIT"
description "Installs and configures Arduino IDE."
version "0.0.1"

# The arduino recipe only installs Arduino IDE
recipe "arduino", "Installs Arduino in the home Directory"

# the rvm:install recipe installs
# a ruby implementation based on
# node attributes.
recipe "rvm::install", "Install a ruby implementation based on attributes"

%w{ubuntu}.each do |os|
  supports os
end

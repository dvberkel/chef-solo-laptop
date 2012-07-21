#
# Cookbook Name:: arduino
# Recipe:: default

# Make sure all the dependencies are present to install Arduino IDE
%w{avr-libc avrdude binutils-avr gcc-avr}.each do |a_package|
  package a_package
end

# Make sure the installation directory exist
directory "/home/dvberkel/bin" do
  owner "dvberkel"
  group "dvberkel"
  action :create
end

version = "arduino-1.0.1"
tarball = "#{version}-linux.tgz"

# Download Arduino IDE
execute "wget" do
  tarball_url = "https://arduino.googlecode.com/files/#{tarball}"
  cwd "/tmp"
  command "wget --output-document='#{tarball}' '#{tarball_url}'"
  creates "/tmp/#{tarball}"
  action :run
end

# Extract Arduino IDE
execute "tar" do
  user "dvberkel"
  group "dvberkel"

  installation_dir = "/home/dvberkel/bin"
  cwd installation_dir
  command "tar zxf /tmp/#{tarball}"
  creates installation_dir + "#{version}"
  action :run
end

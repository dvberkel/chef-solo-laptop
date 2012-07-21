#
# Cookbook Name:: arduino
# Recipe:: default

# Make sure all the dependencies are present to install Arduino IDE
%w{avr-libc avrdude binutils-avr gcc-avr}.each do |a_package|
  package a_package
end

version = node[:arduino][:version]
tarball = "#{version}-linux.tgz"

# Download Arduino IDE
execute "wget" do
  tarball_url = "#{node[:arduino][:download_url]}/#{tarball}"
  cwd "/tmp"
  command "wget --output-document='#{tarball}' '#{tarball_url}'"
  creates "/tmp/#{tarball}"
  action :run
end

node[:arduino][:users].each do |user|
  installation_dir = "/home/#{user}/#{node[:arduino][:relative_install_dir]}"

  # Make sure the installation directory exist
  directory installation_dir do
    owner user
    group user
    action :create
  end

  # Extract Arduino IDE
  execute "tar" do
    user user
    group user

    cwd installation_dir
    command "tar zxf /tmp/#{tarball}"
    creates installation_dir + "#{version}"
    action :run
  end

  # Add user to the dialout group
  group "dialout" do
    action :modify
    members user
    append true
  end
end

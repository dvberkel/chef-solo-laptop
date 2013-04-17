#
# Cookbook Name:: gcs
# Recipe:: default

version = "2011.01.02.1054"
download_url = "http://downloads.sourceforge.net/project/gcs-java/"
zipfile = "GCS-#{version}.zip"
referrer = "?r=&ts=1348396755&use_mirror=freefr"

# Download GCS
execute "wget" do
  url = "#{download_url}#{zipfile}#referrer"
  cwd "/tmp"
  command "wget --output-document='#{zipfile}' '#{url}'"
  creates "/tmp/#{zipfile}"
  action :run
end

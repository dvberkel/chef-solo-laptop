target = node[:go][:target]
user = node[:go][:user]

execute "clone repo" do
  cwd target
  command "hg clone -u release #{node[:go][:url]}"
  user user
  group user
  action :run
  creates "#{target}/go"
end

execute "build go" do
  cwd "#{target}/go/src"
  command "./all.bash"
  user user
  group group
  action :run
  creates "#{target}/go/bin"
end

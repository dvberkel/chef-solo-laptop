prerequisites = %w{build-essential chrpath git-core libssl-dev libfontconfig1-dev}

prerequisites.each do |a_package|
  package a_package
end

git "/home/dvberkel/scratch/phantomjs" do
  repository "git://github.com/ariya/phantomjs.git"
  revision "1.7"
  user "dvberkel"
  group "dvberkel"
end

execute "build phantomjs" do
  cwd "/home/dvberkel/scratch/phantomjs"
  command "./build.sh"
  user "dvberkel"
  group "dvberkel"
end

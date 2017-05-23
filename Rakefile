require 'rbconfig'
MRUBY_CONFIG=File.expand_path(ENV["MRUBY_CONFIG"] || "build_config.rb")
MRUBY_VERSION=ENV["MRUBY_VERSION"] || "master"

file :mruby do
  sh "git clone --depth=1 git://github.com/mruby/mruby.git"
  Dir.chdir("./mruby") do
    sh "git checkout #{MRUBY_VERSION} || true"
  end
end

desc "compile binary"
task :compile => :mruby do
  sh "cd mruby && MRUBY_CONFIG=#{MRUBY_CONFIG} rake all"
end

desc "build mruby container for unit test"
task :build do
  sh "docker build -t ipfilter:mruby ."
  sh "docker run -v `pwd`:/tmp -w /tmp -t ipfilter:mruby rake compile"
end

desc "test"
task :test => :mruby do
  sh "cd mruby && MRUBY_CONFIG=#{MRUBY_CONFIG} rake all test"
end

desc "cleanup"
task :clean do
  sh "cd mruby && rake deep_clean"
end

desc "setup environment"
task :setup do
  case RbConfig::CONFIG['host_os']
  when /darwin|mac os|linux/
    sh 'curl -O http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz'
    sh 'tar zxf GeoLite2-City.tar.gz'
    sh 'mv -fv GeoLite2-City_*/GeoLite2-City.mmdb /tmp/'
    sh 'rm -rf GeoLite2-City*'
    p 'please install libmaxminddb'
    p '[Mac OSX] brew install libmaxminddb libyaml'
    p '[CentOS] yum install epel-relase && yum install libmaxminddb-devel libyaml-devel'
  end
end

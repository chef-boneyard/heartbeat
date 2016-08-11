name              'heartbeat'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache 2.0'
description       'Installs but does not configure heartbeat'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.1.1'

recipe 'heartbeat', 'Installs, but does not configure, heartbeat'

%w( debian ubuntu centos redhat amazon scientific oracle ).each do |os|
  supports os
end

depends 'yum-epel'

source_url 'https://github.com/chef-cookbooks/heartbeat' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/heartbeat/issues' if respond_to?(:issues_url)

chef_version '>= 11' if respond_to?(:chef_version)

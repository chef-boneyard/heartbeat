name              'heartbeat'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache 2.0'
description       'Installs but does not configure heartbeat'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '2.0.0'

recipe 'heartbeat', 'Installs, but does not configure, heartbeat'

%w( debian ubuntu centos redhat amazon scientific oracle ).each do |os|
  supports os
end

depends 'yum-epel'

source_url 'https://github.com/chef-cookbooks/heartbeat'
issues_url 'https://github.com/chef-cookbooks/heartbeat/issues'
chef_version '>= 12.1'

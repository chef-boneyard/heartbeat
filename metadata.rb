name              'heartbeat'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache-2.0'
description       'Installs but does not configure heartbeat'
version           '3.0.0'

%w( debian ubuntu centos redhat amazon scientific oracle ).each do |os|
  supports os
end

depends 'yum-epel'

source_url 'https://github.com/chef-cookbooks/heartbeat'
issues_url 'https://github.com/chef-cookbooks/heartbeat/issues'
chef_version '>= 13'

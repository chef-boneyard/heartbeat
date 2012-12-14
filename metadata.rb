name              "heartbeat"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs but does not configure heartbeat"
version           "1.0.0"

recipe "heartbeat", "Installs, but does not configure, heartbeat"

%w{ debian ubuntu centos redhat amazon scientific fedora oracle }.each do |os|
  supports os
end

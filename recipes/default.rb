#
# Cookbook:: heartbeat
# Recipe:: default
#
# Copyright:: 2009-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if platform_family?('rhel', 'fedora') && node['platform_version'].to_i >= 7
  Chef::Application.fatal!('RHEL 7+ / Fedora no longer contain heartbeat packages. Cannot continue.')
end

include_recipe 'yum-epel::default' if platform_family?('rhel')

case node['platform_family']
when 'rhel'
  package %w(heartbeat heartbeat-devel)
when 'debian'
  package %w(heartbeat heartbeat-dev)
end

service 'heartbeat' do
  supports(
    restart: true,
    status: true
  )
  action :enable
end

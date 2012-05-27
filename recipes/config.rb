#
# Cookbook Name:: heartbeat
# Recipe:: config
#
# Copyright 2009-2011, Opscode, Inc.
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

include_recipe "heartbeat"

heartbeat "heartbeat" do
  auto_failback node['heartbeat']['config']['auto_failback']
  autojoin node['heartbeat']['config']['autojoin']
  compression node['heartbeat']['config']['compression']
  compression_threshold node['heartbeat']['config']['compression_threshold']
  deadtime node['heartbeat']['config']['deadtime']
  initdead node['heartbeat']['config']['initdead']
  keepalive node['heartbeat']['config']['keepalive']
  logfacility node['heartbeat']['config']['logfacility']
  udpport node['heartbeat']['config']['udpport']
  warntime node['heartbeat']['config']['warntime']
  search node['heartbeat']['config']['search']
  authkeys node['heartbeat']['config']['authkeys']
  active_key node['heartbeat']['config']['active_key']
  mode node['heartbeat']['config']['mode']
  interface node['heartbeat']['config']['interface']
  mcast_group node['heartbeat']['config']['mcast_group']
  mcast_ttl node['heartbeat']['config']['mcast_ttl']
  resources node['heartbeat']['config']['resource_ip']
end

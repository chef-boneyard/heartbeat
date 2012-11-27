#
# Cookbook Name:: heartbeat
# Provider:: default
#
# Copyright 2009-2012, Opscode, Inc.
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

action :create do
  query = new_resource.search || "recipes:#{new_resource.cookbook_name}\\:\\:#{new_resource.recipe_name}"
  nodes = search(:node, query)
  nodes << node if nodes.select{|n| n['macaddress'] == node['macaddress']}.empty?
  interface = new_resource.interface.is_a?(Array) ? new_resource.interface : [new_resource.interface]
  authkeys = new_resource.authkeys.is_a?(Array) ? new_resource.authkeys : [new_resource.authkeys]

  template "#{node['heartbeat']['conf_dir']}/ha.cf" do
    cookbook "heartbeat"
    source "ha.cf.erb"
    mode "644"
    owner "root"
    group "root"
    notifies :restart, "service[heartbeat]"
    variables :heartbeat => new_resource, :nodes => nodes, :interface => interface
  end

  template "#{node['heartbeat']['conf_dir']}/authkeys" do
    cookbook "heartbeat"
    source "authkeys.erb"
    owner "root"
    group "root"
    mode "600"
    notifies :restart, "service[heartbeat]"
    variables :active => new_resource.active_key || authkeys.length, :keys => authkeys
  end

  template "#{node['heartbeat']['conf_dir']}/haresources" do
    cookbook "heartbeat"
    source "haresources.erb"
    owner "root"
    group "root"
    mode "644"
    notifies :restart, "service[heartbeat]"
    variables :heartbeat => new_resource, :default => nodes.sort_by{|n| n['macaddress']}.first['hostname']
  end

end

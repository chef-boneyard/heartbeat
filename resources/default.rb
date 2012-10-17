#
# Cookbook Name:: heartbeat
# Resource:: default
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

default_action :create

def after_created
  run_context.resource_collection.each do |res|
    raise "You may only define a single heartbeat resource per node. Found #{res}: #{res.defined_at}" if res.is_a?(self.class) && res.name != name
  end
  raise "No resource groups specified" if resource_groups.empty?
end

# These map directly to ha.cf directives
attribute :auto_failback, :kind_of => [TrueClass, FalseClass], :default => false
attribute :autojoin, :equal_to => [:none, 'none', :other, 'other', :any, 'any'], :default => :none
attribute :compression, :equal_to => [nil, :zlib, 'zlib', :bz2, 'bz2'], :default => nil
attribute :compression_threshold, :kind_of => Integer, :default => 2
attribute :deadtime, :kind_of => Integer, :default => 2
attribute :initdead, :kind_of => Integer, :default => 15
attribute :keepalive, :kind_of => Integer, :default => 250
attribute :logfacility, :kind_of => String, :default => 'local0'
attribute :udpport, :kind_of => Integer, :default => 694
attribute :warntime, :kind_of => Integer, :default => 1

attribute :search, :kind_of => String
attribute :authkeys, :kind_of => [Array, String], :required => true
attribute :active_key, :kind_of => Integer
attribute :mode, :equal_to => [:bcast, 'bcast', :mcast, 'mcast', :ucast, 'ucast'], :default => :ucast
attribute :interface, :kind_of => [String, Array], :default => node['network']['default_interface']
attribute :mcast_group, :kind_of => String
attribute :mcast_ttl, :kind_of => Integer, :default => 1
attribute :resource_groups, :default => []

def resources(ip=nil, &block)
  group = ::Chef::Resource::HeartbeatResourceGroup.new(run_context, cookbook_name, recipe_name)
  group.ipaddr ip if ip
  group.instance_eval(&block) if block
  raise "No resources found in group" if group.sub_resources.empty?
  resource_groups.each do |g|
    raise "The first resource in each group must be distinct" if g.sub_resources.first.to_resource == group.sub_resources.first.to_resource
  end
  resource_groups << group
  group
end

#
# Cookbook Name:: heartbeat
# Attributes:: default
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

default['heartbeat']['conf_dir'] = '/etc/ha.d'

# These are all default nil so that the real defaults on the resource will apply
default['heartbeat']['config']['auto_failback'] = nil
default['heartbeat']['config']['autojoin'] = nil
default['heartbeat']['config']['compression'] = nil
default['heartbeat']['config']['compression_threshold'] = nil
default['heartbeat']['config']['deadtime'] = nil
default['heartbeat']['config']['initdead'] = nil
default['heartbeat']['config']['keepalive'] = nil
default['heartbeat']['config']['logfacility'] = nil
default['heartbeat']['config']['udpport'] = nil
default['heartbeat']['config']['warntime'] = nil
default['heartbeat']['config']['search'] = nil
default['heartbeat']['config']['authkeys'] = nil
default['heartbeat']['config']['active_key'] = nil
default['heartbeat']['config']['mode'] = nil
default['heartbeat']['config']['interface'] = nil
default['heartbeat']['config']['mcast_group'] = nil
default['heartbeat']['config']['mcast_ttl'] = nil
default['heartbeat']['config']['resource_ip'] = nil

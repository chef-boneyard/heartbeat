Description
===========

Installs heartbeat, and includes resources/providers for managing
heartbeat configuration.

It is outside the scope of this cookbook and the README to replace
documentation and user understanding of the linux-ha and heartbeat
project.

* http://linux-ha.org/wiki/Heartbeat

Requirements
============

Requires a Chef Server due to use of Search.

## Platform:

Supported via Platform Family:

* Debian
* RHEL

Attributes
==========

* `node['heartbeat']['conf_dir']` - Directory where heartbeat
  configuration lives.

The following attributes are used in `recipe[heartbeat::config]` to
pass into the LWRP used there. Each corresponds to a resource
attribute in the LWRP, making the recipe drivable with attributes,
e.g. set in a role. See the `heartbeat` resource attributes below for
descriptions.

* `node['heartbeat']['config']['auto_failback']`
* `node['heartbeat']['config']['autojoin']`
* `node['heartbeat']['config']['compression']`
* `node['heartbeat']['config']['compression_threshold']`
* `node['heartbeat']['config']['deadtime']`
* `node['heartbeat']['config']['initdead']`
* `node['heartbeat']['config']['keepalive']`
* `node['heartbeat']['config']['logfacility']`
* `node['heartbeat']['config']['udpport']`
* `node['heartbeat']['config']['warntime']`
* `node['heartbeat']['config']['search']`
* `node['heartbeat']['config']['authkeys']`
* `node['heartbeat']['config']['active_key']`
* `node['heartbeat']['config']['mode']`
* `node['heartbeat']['config']['interface']`
* `node['heartbeat']['config']['mcast_group']`
* `node['heartbeat']['config']['mcast_ttl']`
* `node['heartbeat']['config']['resource_ip']`

Resources/Providers
===================

## heartbeat

Manages heartbeat configuration files (ha.cf, authkeys, haresources).

### Actions

* `:create` - *Default* Creates the configuration. This will search for a
  specified query (see the `search` resource attribute below), and
  fall back to finding the cookbook and recipe name where the LWRP is
  used in the node's `recipes` attribute.

### Attributes

* `auto_failback` - used for the `auto_failback` configuration directive in ha.cf.
* `autojoin` - used for the `autojoin` configuration directive in ha.cf.
* `compression` - used for the `compression` configuration directive in ha.cf.
* `compression_threshold` - used for the `compression_threshold` configuration directive in ha.cf.
* `deadtime` - used for the `deadtime` configuration directive in ha.cf.
* `initdead` - used for the `initdead` configuration directive in ha.cf.
* `keepalive` - used for the `keepalive` configuration directive in ha.cf.
* `logfacility` - used for the `logfacility` configuration directive in ha.cf.
* `udpport` - used for the `udpport` configuration directive in ha.cf.
* `warntime` - used for the `warntime` configuration directive in ha.cf.
* `search` - a search query to use instead of the default (see
  description above).
* `authkeys` - sha1 keys used in the authkeys config file.
* `active_key` - the key used for the `auth` configuration directive
  in the authkeys config file.
* `interface` - used for the `` configuration directive in ha.cf.
* `mcast_group` - used for the `` configuration directive in ha.cf.
* `mcast_ttl` - used for the `` configuration directive in ha.cf.
* `mode` - tye network mode to use, can be ucast, bcast, or mcast,
  corresponds to the configuration directives in ha.cf.
* `resource_groups` - array of resource groups

### Examples

See `recipe[heartbeat::config]`.

## heartbeat\_ipaddr

Used in the `heartbeat` LWRP for the group IP.

## heartbeat\_resource\_group

Manages the haresources resource_groups.

Recipes
=======

default
-------

Installs the heartbeat and heartbeat-dev packages, and manages the
heartbeat service. The recipe does not at this time manage any configuration.

config
------

Uses the heartbeat LWRP with the `node['heartbeat']['config']`
attributes to manage a complete heartbeat configuration.

Usage
=====

Use the `default` recipe to install heartbeat's packages and manage
the service.

Use the LWRP in your own recipe, or set the attributes described above
and use the `config` recipe to setup a heartbeat-monitored application.

License and Author
==================

- Author:: Joshua Timberman <joshua@opscode.com>
- Author: Noah Kantrowitz <noah@opscode.com>

- Copyright:: 2009-2012, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

#
# Cookbook Name:: heartbeat
# Library:: default
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

class Chef
  class Resource
    class HeartbeatResourceGroup
      include Chef::Mixin::ParamsValidate
      include Chef::Mixin::RecipeDefinitionDSLCore

      attr_reader :run_context, :cookbook_name, :recipe_name, :sub_resources

      def initialize(run_context, cookbook_name, recipe_name)
        @run_context = run_context
        @cookbook_name = cookbook_name
        @recipe_name = recipe_name
        @sub_resources = []
      end

      def default_node(default_node=nil)
        set_or_return(:default_node, default_node, :kind_of => String)
      end

      def method_missing(name, *args, &block)
        # Build the set of names to check for a valid resource
        lookup_path = ["heartbeat_#{name}"]
        run_context.cookbook_collection.each do |cookbook_name, cookbook_ver|
          lookup_path << "#{cookbook_name}_heartbeat_#{name}"
        end
        resource = nil
        # Try to find our resource
        lookup_path.each do |resource_name|
          begin
            Chef::Log.debug "Trying to load heartbeat resource #{resource_name} for #{name}"
            resource = super(resource_name.to_sym, args.first || name, &block)
            break
          rescue NameError => e
            # Works on any MRI ruby
            if e.name == resource_name.to_sym || e.inspect =~ /\b#{resource_name}\b/
              next
            else
              raise e
            end
          end
        end
        raise NameError, "No resource found for #{name}. Tried #{lookup_path.join(', ')}" unless resource
        raise ArgumentError, "Resource instance #{resource} is not a valid heartbeat resource" unless resource.respond_to?(:to_resource)
        provider = resource.provider || begin
          Chef::Platform.provider_for_resource(resource)
        rescue ArgumentError => e
          nil
        end
        # As a default this has #action_nothing on it
        resource.provider Chef::Provider::HeartbeatNull unless provider
        @sub_resources << resource
        resource
      end

    end
  end
end

# Copyright 2017 Google Inc.
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

require 'overrides/resources'
require 'provider/ansible/facts_override'

module Overrides
  module Ansible
    # A class to control overridden properties on ansible.yaml in lieu of
    # values from api.yaml.
    class ResourceOverride < Overrides::ResourceOverride
      def self.attributes
        %i[
          access_api_results
          collection
          custom_create_resource
          custom_update_resource
          create
          delete
          has_tests
          hidden
          imports
          post_create
          post_action
          provider_helpers
          return_if_object
          template
          unwrap_resource
          update
          version_added

          facts
        ]
      end

      attr_reader(*attributes)
      def validate
        super

        @exclude ||= false

        check :access_api_results, type: :boolean, default: false
        check :collection, required: false, type: ::String
        check :custom_create_resource, type: :boolean, default: false
        check :custom_update_resource, type: :boolean, default: false
        check :create, type: ::String, required: false
        check :delete, type: ::String, required: false
        check :has_tests, type: :boolean, default: true
        check :hidden, type: ::Array, required: false
        check :imports, type: ::Array, default: []
        check :post_create, type: ::String, required: false
        check :post_action, type: ::String, required: false
        check :provider_helpers, type: ::Array, default: []
        check :return_if_object, type: ::String, required: false
        check :template, type: ::String, required: false
        check :update, type: ::String, required: false
        check :unwrap_resource, type: :boolean, default: false
        check :version_added, type: ::String, required: false

        check :facts, type: FactsOverride, default: FactsOverride.new
      end
    end

    # Product specific overriden properties for Ansible
    class ResourceOverride < Provider::ResourceOverride
      include OverrideProperties
      include ResourceOverrideSharedCode

      private

      def overriden
        Provider::Ansible::OverrideProperties
>>>>>>> more conversions have happened:provider/ansible/resource_override.rb
      end
    end
  end
end
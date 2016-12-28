##########################################################################
# Copyright 2016 ThoughtWorks, Inc.
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
##########################################################################

module ApiV1
  module Config
    module Materials
      class RepositoryCheckConnectionRepresenter < ApiV1::BaseRepresenter
        alias_method :package_repository, :represented

        property :plugin,
                 exec_context: :decorator

        collection :configuration,
                   decorator: ApiV1::Config::PluginConfigurationPropertyRepresenter,
                   exec_context: :decorator,
                   class: com.thoughtworks.go.domain.config.ConfigurationProperty


        def plugin=(value)
          plugin_configuration = com.thoughtworks.go.domain.config.PluginConfiguration.new(value, nil)
          package_repository.setPluginConfiguration(plugin_configuration)
        end

        def configuration=(value)
          package_repository.addConfigurations(value)
        end

      end
    end
  end
end
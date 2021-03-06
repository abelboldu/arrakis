# == Class: midonet
#
# Install all the midonet modules in a single machine with all
# the default parameters.
#
# == Examples
#
# The only way to call this class is using the include reserved word:
#
#     include midonet
#
# To more advanced usage of the midonet puppet module, check out the
# documentation for the midonet's modules:
#
# - midonet::repository
# - midonet::cassandra
# - midonet::zookeeper
# - midonet::midonet_agent
# - midonet::midonet_api
# - midonet::midonet_cli
# - midonet::neutron_plugin
#
# === Authors
#
# Midonet (http://midonet.org)
#
# === Copyright
#
# Copyright (c) 2015 Midokura SARL, All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class midonet {

    # Add zookeeper
    class {'midonet::zookeeper': }

    # Add cassandra
    class {'midonet::cassandra': }

    # Add midonet-agent
    class { 'midonet::midonet_agent':
        require => [Class['midonet::cassandra'],
                    Class['midonet::zookeeper']]
    }

    # Add midonet-api
    class {'midonet::midonet_api':}

    # Add midonet-cli
    class {'midonet::midonet_cli':}

}

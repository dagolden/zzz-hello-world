#
# Author:: David A. Golden (<dagolden@cpan.org>)
# Cookbook Name:: hello-world
# Attribute:: default
#
# Copyright 2012, David A. Golden
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

# perlbrew to execute with (should be a legal perlbrew target)
default['hello-world']['perl_version'] = 'perl-5.14.2'

# Install directory, repo and tag
default['hello-world']['deploy_dir'] = '/opt/hello-world'
default['hello-world']['deploy_repo'] = 'git://github.com/dagolden/zzz-hello-world.git'
default['hello-world']['deploy_tag'] = 'v1.0'

# Service user/group/port
default['hello-world']['user'] = "nobody"
default['hello-world']['group'] = "nogroup"
default['hello-world']['port'] = 8080


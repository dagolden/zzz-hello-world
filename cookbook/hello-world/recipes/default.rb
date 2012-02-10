#
# Cookbook Name:: hello-world
# Recipe:: default
#
# Copyright 2012, David Golden
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

include_recipe 'carton'

package 'git'

git node['hello-world']['deploy_dir'] do
  repository node['hello-world']['deploy_repo']
  reference node['hello-world']['deploy_tag']
  notifies :create, "carton_app[hello-world]"
  notifies :restart, "carton_app[hello-world]"
end

carton_app "hello-world" do
  perlbrew node['hello-world']['perl_version']
  command "starman -p #{node['hello-world']['port']} app.psgi"
  cwd node['hello-world']['deploy_dir']
  user node['hello-world']['user']
  group node['hello-world']['group']
  action [:create, :start]
end


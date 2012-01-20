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

include_recipe 'perlbrew'

perl_ver = node['hello-world']['perl_version']

perl_carton = "#{perl_ver}@carton"

perlbrew_perl perl_ver

perlbrew_lib perl_carton

perlbrew_run "cpanm Carton" do
  perlbrew perl_carton
end

package 'git'

git node['hello-world']['deploy_dir'] do
  repository node['hello-world']['deploy_repo']
  reference node['hello-world']['deploy_tag']
end

perlbrew_run "carton install" do
  cwd node['hello-world']['deploy_dir']
  environment( { 'PERL_CARTON_PATH' => "local-#{perl_ver}" } )
  perlbrew perl_carton
end

perlbrew_service "hello-world" do
  perlbrew perl_carton
  command "carton exec -Ilib -- starman -p #{node['hello-world']['port']} app.psgi"
  cwd node['hello-world']['deploy_dir']
  user node['hello-world']['user']
  group node['hello-world']['group']
  environment( { 'PERL_CARTON_PATH' => "local-#{perl_ver}" } )
end


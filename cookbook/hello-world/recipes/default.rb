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

git "/opt/hello-world" do
  repository "git://github.com/dagolden/zzz-hello-world.git"
  reference node['hello-world']['deploy_tag']
end

perlbrew_run "carton install" do
  cwd "/opt/hello-world"
  perlbrew perl_carton
end

perlbrew_run "carton exec -Ilib -- starman -D -p 80 app.psgi" do
  cwd "/opt/hello-world"
  perlbrew perl_carton
end


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

package 'git'

perlbrew_perl "perl-5.14.2" do
  action :install
end

perlbrew_lib "perl-5.14.2@carton" do
  action :create
end

perlbrew_run "cpanm Carton" do
  perlbrew "perl-5.14.2@carton"
end

git "/opt/hello-world" do
  repository "git://github.com/dagolden/zzz-hello-world.git"
  reference "v1.0"
  action :sync
end

perlbrew_run "carton install" do
  cwd "/opt/hello-world"
  perlbrew "perl-5.14.2@carton"
end

perlbrew_run "carton exec -Ilib -- starman -D -p 80 app.psgi" do
  cwd "/opt/hello-world"
  perlbrew "perl-5.14.2@carton"
end


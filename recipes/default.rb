# -*- coding: utf-8 -*-
#
# Cookbook Name:: light
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

install_dir = node['light']['install_dir']

execute 'make-light' do
  command 'make'
  cwd install_dir
  action :nothing
end

git install_dir do
  repository node['light']['repository']
  reference node['light']['reference']
  environment node['light']['env'] unless node['light']['env'].nil?
  action :sync
  notifies :run, 'execute[make-light]'
end

['/etc/light/save', '/etc/light/mincap'].each do |dir|
  directory dir do
    recursive true
    owner 'root'
    group 'root'
    mode '0755'
  end
end

link '/usr/local/bin/light' do
  owner 'root'
  group 'root'
  to "#{install_dir}/light"
end

file '/etc/udev/rules.d/90-backlight.rules' do
  owner 'root'
  group 'root'
  mode '0640'
  content ['ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"',
           'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"'].join("\n")
end

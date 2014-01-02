#
# Cookbook Name:: libguestfs
# Recipe:: default
#
# Copyright (C) 2013 Engine Yard, Inc.
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

case node['platform_family']
when 'debian'
  packages = %w{ libguestfs0 libguestfs-tools }
  if node['platform'] == 'ubuntu' && node['platform_version'].to_f < 14.04
    packages += %w{ guestfish }
  end
when 'rhel', 'fedora'
  packages = %w{ libguestfs libguestfs-tools }
else
  packages = []
end

packages.each do |p|
  package p
end

execute "update-guestfs-appliance" do
  creates node['libguestfs']['supermin_base']
  user "root"
  group "root"
  only_if { node['platform_family'] == 'debian' }
end

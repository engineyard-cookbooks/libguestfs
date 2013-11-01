#
# Cookbook Name:: libguestfs
# Recipe:: default
#
# Copyright (C) 2013 Engine Yard, Inc.
#
# All rights reserved - Do Not Redistribute
#

packages = %w{ guestfish libguestfs0 libguestfs-tools }
packages.each do |p|
  package p
end

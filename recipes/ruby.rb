#
# Cookbook Name:: libguestfs
# Recipe:: ruby
#
# Copyright (C) 2013 Engine Yard, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'libguestfs::default'
package 'ruby-guestfs'

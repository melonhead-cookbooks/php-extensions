#
# Author::  Joshua Timberman (<joshua@opscode.com>)
# Author::  Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: php
# Recipe:: module_memcache
#
# Copyright 2009-2011, Opscode, Inc.
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

case node['platform_family']
when 'rhel', 'fedora'
  case node['platform_version']
  when 6
    %w{ php-pecl-memcached }.each do |pkg|
      package pkg do
        action :install
      end
    end
  when 5
    package 'zlib-devel' do
      action :install
    end
    php_pear 'memcache' do
      action :install
    end
  end
when 'debian'
  package 'php5-memcache' do
    action :install
  end
end
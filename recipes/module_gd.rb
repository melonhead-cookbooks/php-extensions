#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_gd
#
# Copyright 2014, Salesforce
#

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    el5_range => 'php53-gd',
    'default' => 'php-gd'
  },
  'default' => 'php5-gd'
)

package pkg do
  action :install
end

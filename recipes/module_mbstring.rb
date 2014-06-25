#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_mbstring
#
# Copyright 2014, Salesforce
#

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    el5_range => 'php53-mbstring',
    'default' => 'php-mbstring'
  },
  'default' => 'php5-mbstring'
)

package pkg do
  action :install
end

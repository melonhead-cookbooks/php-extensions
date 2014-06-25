#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_pgsql
#
# Copyright 2014, Salesforce
#

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    el5_range => 'php53-pgsql',
    'default' => 'php-pgsql'
  },
  'default' => 'php5-pgsql'
)

package pkg do
  action :install
end

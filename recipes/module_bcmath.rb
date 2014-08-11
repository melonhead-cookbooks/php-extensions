#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_bcmath
#
# Copyright 2014, Salesforce
#

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    el5_range => 'php53-bcmath',
    'default' => 'php-bcmath'
  },
  'default' => 'php5-bcmath'
)

package pkg do
  action :install
end

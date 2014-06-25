#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_mcrypt
#
# Copyright 2014, Salesforce
#

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    el5_range => 'php53-mcrypt',
    'default' => 'php-mcrypt'
  },
  'default' => 'php5-mcrypt'
)

package pkg do
  action :install
end

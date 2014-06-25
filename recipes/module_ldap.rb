#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_ldap
#
# Copyright 2014, Salesforce
#

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    el5_range => 'php53-ldap',
    'default' => 'php-ldap'
  },
  'default' => 'php5-ldap'
)

package pkg do
  action :install
end

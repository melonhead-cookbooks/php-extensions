#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_fpdf
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  pearhub_chan = php_pear_channel 'pearhub.org' do
    action :discover
  end
  php_pear 'FPDF' do
    channel pearhub_chan.channel_name
    action :install
  end
when 'debian'
  package 'php-fpdf' do
    action :install
  end
end

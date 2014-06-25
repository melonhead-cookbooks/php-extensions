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
  file '/etc/php.d/fpdf.ini' do
    action :create
    content "extension=fpdf.so\n"
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, resources(service: 'apache2')
  end
when 'debian'
  package 'php-fpdf' do
    action :install
  end
end

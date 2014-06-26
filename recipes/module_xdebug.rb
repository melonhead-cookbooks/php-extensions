#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_xdebug
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  php_pear 'xdebug' do
    action :install
    zend_extensions ['xdebug.so']
    directives(remote_enable: 1, idekey: 'vagrant')
  end
when 'debian'
  package 'php5-xdebug' do
    action :install
  end
end

ruby_block 'set xdebug PAM configuration' do
  block do
    rc = Chef::Util::FileEdit.new('/etc/security/pam_env.conf')
    rc.insert_line_if_no_match(
      'PHP_IDE_CONFIG',
      'PHP_IDE_CONFIG DEFAULT="serverName=vagrant_cli"'
    )
    rc.write_file
  end
end

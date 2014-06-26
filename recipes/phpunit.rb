#
# Cookbook Name:: php-extensions
# Recipe:: phpunit
#
# Copyright (C) 2014 Salesforce
#
# All rights reserved - Do Not Redistribute
#

# Discover symfony's pear channel before installing PHPUnit
execute 'discover-symfony' do
  command 'pear channel-discover pear.symfony.com'
  action :run
  only_if "test 0 -eq `pear list-channels | grep -i 'pear.symfony.com' | wc -l`"
end

execute 'discover-phpunit' do
  command 'pear channel-discover pear.phpunit.de'
  action :run
  only_if "test 0 -eq `pear list-channels | grep -i 'pear.phpunit.de' | wc -l`"
end

php_pear_channel 'pear.symfony.com' do
  action :update
end

php_pear_channel 'pear.phpunit.de' do
  action :update
end

execute 'install phpunit' do
  command 'pear upgrade --alldeps pear.phpunit.de/PHPUnit'
  action :run
  only_if "test 0 -eq `phpunit --version | grep 'PHPUnit' | wc -l`"
end

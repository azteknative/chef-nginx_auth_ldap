#
# Cookbook Name:: nginx_auth_ldap
# Recipe:: default
#
# Copyright 2015, AzTek Native Ltd.
#
# All rights reserved - Do Not Redistribute
#

node.default['nginx']['source']['modules'] << 'nginx_auth_ldap::ngx_ldap_module'

include_recipe "nginx::source"


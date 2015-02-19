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

# Drop off LDAP server configuration
template "#{node['nginx']['dir']}/conf.d/auth_ldap.conf" do
  source "auth_ldap.conf.erb"
  owner "root"
  group "root"
  mode "0755"
end


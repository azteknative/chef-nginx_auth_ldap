#
# Cookbook Name:: nginx_auth_ldap
# Recipe:: ngx_ldap_module
#
# Copyright 2015, AzTek Native Ltd.
#
# All rights reserved - Do Not Redistribute
#

# Download nginx-ldap-module
remote_file "#{Chef::Config['file_cache_path']}/nginx-ldap.zip" do
  source   'https://github.com/kvspb/nginx-auth-ldap/archive/master.zip'
  owner    'root'
  group    node['root_group']
  mode     '0644'
end

# Ensure unzip is installed
package "unzip"

# Install appropriate openldap development/header packages
openldap_dev = value_for_platform(
  [ "debian", "ubuntu" ] => {
    "default" => "libldap2-dev"
  },
  [ "centos", "fedora", "redhat" ] => {
    "default" => "openldap-devel"
  }
)

package openldap_dev

# Extract nginx-ldap-module
bash 'extract_ldap_module' do
  cwd Chef::Config['file_cache_path']
  code "unzip nginx-ldap.zip"
  not_if { ::File.exist?("#{Chef::Config['file_cache_path']}/nginx-auth-ldap-master") }
end

node.run_state['nginx_configure_flags'] =
  node.run_state['nginx_configure_flags'] | ["--add-module=#{Chef::Config['file_cache_path']}/nginx-auth-ldap-master"]


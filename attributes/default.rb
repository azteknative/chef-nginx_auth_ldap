
# Required to ensure nginx is built from source.
override['nginx']['install_method'] = "source"

# Hash of LDAP servers
default['nginx']['auth_ldap']['servers'] = {
  "dirsrv" => {
    "basedn" => "dc=example,dc=com",
    "host" => "ldap.example.com",
    "ssl" => false,
    "port" => 389,
    "user_attribute" => "uid",
    "user_class" => "inetOrgPerson",
    "binddn" => "uid=tiddlywiki,ou=Service Accounts,dc=example,dc=com",
    "binddn_password" => "changeme",
    "require" => "valid_user"
  }
}


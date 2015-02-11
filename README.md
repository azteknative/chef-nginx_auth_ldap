nginx_auth_ldap Cookbook
========================
This cookbook handles the installation of the 3rd party nginx module that handles
authentication via LDAP ( https://github.com/kvspb/nginx-auth-ldap ).

Requirements
------------
#### platforms
- RHEL
- CentOS

Currently, this cookbook only works on RHEL systems; this is due to the package requirements
not being platform independent yet.

#### cookbooks
- `nginx` - without this, the nginx_auth_ldap cookbook is useless!

#### packages
- `unzip` - used to unzip the nginx-auth-ldap module source code.
- `openldap-devel` - needed to compile the nginx-auth-ldap module.

Usage
-----
#### nginx_auth_ldap::default

Just include `nginx_auth_ldap` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx_auth_ldap]"
  ]
}
```

This will handle adding the nginx_auth_ldap::ngx_ldap_module recipe to the
`node['nginx']['source']['modules']` attribute.


Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Author: Peter Green (peter.green@aztek-native.com)

```
Copyright 2015 AzTek Native Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

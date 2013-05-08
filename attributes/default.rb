#
# Cookbook Name:: idm
# Attributes:: default
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# default tomcat attributes



default['misc']['build_loc'] = "/home/vagrant/IDM402AE/test/install/utilities"
default['misc']['jre_loc']="/root/idm/jre"
default['misc']['admin_name']="admin.servers.system"
default['misc']['dn_admin_name']="cn=admin,ou=servers,o=system"
default['misc']['edirectory_port']="524"
default['misc']['ldap_port']="389"
default['misc']['ldaps_port']="636"
default['misc']['idm_password']="n"
default['misc']['simple_password'] = "/home/vagrant/IDM402AE/test/products/eDirectory/x64/nmas/NmasMethods/Novell/SimplePassword/config.txt"
default['misc']['cert'] = "/home/vagrant/IDM402AE/test/products/eDirectory/x64/nmas/NmasMethods/Novell/CertMutual/config.txt"
default['misc']['direct'] = "/home/vagrant/IDM402AE/test/products/eDirectory/x64/nmas/NmasMethods/Novell/DigestMD5/config.txt"
default['misc']['tree_name'] = "VAGRANT"


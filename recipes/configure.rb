#
# Cookbook Name:: postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

idm_install_loc=node['idm']['idm_install_loc']
idm_configure_build_loc=node['idm']['idm_configure_build_loc']
idm_build_loc=node['idm']['idm_build_loc']
jre_loc=node['idm']['jre_loc']


template "/tmp/idm_configure.properties" do
  source "idm_configure.properties.erb"
  owner "root" 
  mode "0644"  
end


execute "Configure IDM" do
  command " \"#{idm_configure_build_loc}\" -DIA_USER_JRE_HOME=\"#{jre_loc}\" -DINSTALL_ONLY=true -i silent -f \"/tmp/idm_configure.properties\" " 
  creates "/tmp/idm_configure.log"
  action :run
  end
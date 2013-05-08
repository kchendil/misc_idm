#
# Cookbook Name:: postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

build_loc=node['misc']['build_loc']
edirectory_port=node['misc']['edirectory_port']
ldap_port=node['misc']['ldap_port']
ldaps_port=node['misc']['ldaps_port']
admin_name=node['misc']['admin_name']
dn_admin_name=node['misc']['dn_admin_name']
idm_password=node['misc']['idm_password']
jre_loc=node['misc']['jre_loc']
simple_password=node['misc']['simple_password']
cert=node['misc']['cert']
direct=node['misc']['direct']


# execute "Install Simple NMAS Methods" do
  # command " LD_LIBRARY_PATH=\"#{build_loc}\" \"#{jre_loc}/bin/java\" -classpath \"#{build_loc}/instutil.jar\":\"#{build_loc}/uainstaller.jar\" -Djava.library.path=\"#{build_loc}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{edirectory_port} \"#{admin_name}\" #{idm_password} /opt/novell/eDirectory/bin/nmasinst \"#{simple_password}\" /var/opt/novell/nmas_simplepassword.log \"cn=Simple Password.cn=Authorized_Login_Methods.cn=Security\" " 
   # creates "/var/opt/novell/nmas_simplepassword.log"
  # action :run
  
# end

# execute "Install Certifcate NMAS Methods" do
  # command " LD_LIBRARY_PATH=\"#{build_loc}\" \"#{jre_loc}/bin/java\" -classpath \"#{build_loc}/instutil.jar\":\"#{build_loc}/uainstaller.jar\" -Djava.library.path=\"#{build_loc}\" com.novell.idm.wrapper.tools.InstallNMASmethods localhost #{edirectory_port} \"#{admin_name}\" #{idm_password} /opt/novell/eDirectory/bin/nmasinst \"#{cert}\" /var/opt/novell/nmas_cert.log \"cn=CertMutual.cn=Authorized_Login_Methods.cn=Security\" " 
   # creates "/var/opt/novell/nmas_simplepassword.log"
  # action :run
  
# end

# nmas_install "cert" do
  # enable true
# end

# nmas_install "simple" do
  # enable true
# end

# nmas_install "saml" do
  # enable true
# end

# nmas_install "digest" do
  # enable true
# end



# LD_LIBRARY_PATH="/AE/install/utilities"  "/AE/install/utilities/ldapmodify" -ZZ -h 127.0.0.1 -p 389 -D "cn=admin,ou=sa,o=system" -w ****** -a -c -f "/AE/install/utilities/idvault_default_new_dit.ldif"
  # exitValue = 0
# /opt/novell/eDirectory/bin/dxcmd -user "admin.sa.system" -host 127.0.0.1 -port 524 -password ****** -dnform dot -version 4.0.0 -setdriverset "driverset1.system" > "/var/opt/novell/idm/install/logs/idm_dxcmd_setdriverset.log"
  # exitValue = 0
# LD_LIBRARY_PATH="/AE/install/utilities" "/opt/novell/idm/jre/bin/java" -classpath "/AE/install/utilities/instutil.jar":"/AE/install/utilities/uainstaller.jar" -Djava.library.path="/AE/install/utilities" com.novell.idm.wrapper.tools.TriggerPartitionOperation 127.0.0.1 636 "cn=admin,ou=sa,o=system" ****** "cn=driverset1,o=system" > "/var/opt/novell/idm/install/logs/idm_partition_operation.log"
  # exitValue = 0



 execute "Enable Advanced Edition" do
   command "  echo 3 > \"/var/opt/novell/eDirectory/data/dib/.idme\" " 
    creates "/var/opt/novell/eDirectory/data/dib/.idme"
   action :run
  
 end

  execute "Password Policies" do
   command " LD_LIBRARY_PATH=\"#{build_loc}\"  \"#{build_loc}/ldapmodify\" -ZZ -h 127.0.0.1 -p #{ldap_port} -D \"#{dn_admin_name}\" -w #{idm_password} -a -c -f \"#{build_loc}/idvault_default_new_dit.ldif\" " 
   # creates "/var/opt/novell/eDirectory/data/dib/.idme"
   action :run
  
 end
 
 execute "Create Driver Set" do
   command " /opt/novell/eDirectory/bin/dxcmd -user \"#{admin_name}\" -host 127.0.0.1 -port #{edirectory_port} -password #{idm_password} -dnform dot -version 4.0.0 -setdriverset \"driverset1.system\" > \"/var/opt/novell/idm_dxcmd_setdriverset.log\" " 
   creates "/var/opt/novell/idm_dxcmd_setdriverset.log"
   action :run
  
 end
 
 execute "Driver Set Partition" do
   command " LD_LIBRARY_PATH=\"#{build_loc}\" \"#{jre_loc}/bin/java\" -classpath \"#{build_loc}/instutil.jar\":\"#{build_loc}/uainstaller.jar\" -Djava.library.path=\"#{build_loc}\" com.novell.idm.wrapper.tools.TriggerPartitionOperation 127.0.0.1 #{ldaps_port} \"#{dn_admin_name}\" #{idm_password} \"cn=driverset1,o=system\" > \"/var/opt/novell/idm_partition_operation.log\" " 
    creates "/var/opt/novell/idm_partition_operation.log"
   action :run
  
 end
 
 

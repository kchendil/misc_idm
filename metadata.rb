name             "misc"
maintainer       "NetIQ"
maintainer_email "kchendil@netiq.com"
license          "Apache 2.0"
description      "Installs/Configures IDM Misc properties"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ suse}.each do |os|
  supports os
end


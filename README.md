Description
===========

Installs NetIQ IDM Misc properties

Requirements
============

Platform:

* SLES 11 SP2


The following Opscode cookbooks are dependencies:



Attributes
==========

* `node["imanager"]["designer_install_loc"]` - The Designer install location, default `/opt/novell/idm/Designer/`.
* `node["imanager"]["designer_build_loc"]` - The Designer build location, default `/home/vagrant/IDM402AE/test/products/Designer/install`.
* `node["imanager"]["jre_loc"]` - The JRE location, default `/root/idm/jre`.
* `node["imanager"]["designer_locale"]` - The default locale for Designer, default `en`.


Usage
=====



License and Author
==================

Author:: Chendil Kumar Manoharan(<kchendil@netiq.com>)

Copyright:: 2010-2012, NetIQ, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

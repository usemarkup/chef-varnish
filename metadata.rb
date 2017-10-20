name 'varnishd'
license 'MIT Licence'
description 'Installs varnish from the package manager'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

maintainer 'Gavin Staniforth'
maintainer_email 'gavin@usemarkup.com'

source_url 'https://github.com/usemarkup/chef-varnish'

supports 'centos'

chef_version '>= 12.7' if respond_to?(:chef_version)

depends 'compat_resource'
